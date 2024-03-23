//
//  ChainBinanceBeacon.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/09/05.
//  Copyright © 2023 wannabit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ChainBinanceBeacon: CosmosClass  {
    
    //For Legacy Lcd chains
    lazy var lcdNodeInfo = JSON()
    lazy var lcdAccountInfo = JSON()
    lazy var lcdBeaconTokens = Array<JSON>()
    
    override init() {
        super.init()
        
        name = "BNB Beacon"
        tag = "binanceBeacon"
        chainId = "Binance-Chain-Tigris"
        logo1 = "chainBnbBeacon"
        logo2 = "chainBnbBeacon2"
        apiName = ""
        stakeDenom = "BNB"
        
        accountKeyType = AccountKeyType(.COSMOS_Secp256k1, "m/44'/714'/0'/0/X")
        bechAccountPrefix = "bnb"
        supportStaking = false
    }
    
    override func fetchData(_ id: Int64) {
        lcdNodeInfo = JSON()
        lcdAccountInfo = JSON()
        lcdBeaconTokens.removeAll()
        
        Task {
            if let nodeInfo = try? await fetchNodeInfo(),
               let accountInfo = try? await fetchAccountInfo(bechAddress),
               let beaconTokens = try? await fetchBeaconTokens(),
               let miniTokens = try? await fetchBeaconMiniTokens() {
                self.lcdNodeInfo = nodeInfo ?? JSON()
                self.lcdAccountInfo = accountInfo ?? JSON()
                
                beaconTokens?.forEach { beaconToken in
                    self.lcdBeaconTokens.append(beaconToken)
                }
                miniTokens?.forEach { miniToken in
                    self.lcdBeaconTokens.append(miniToken)
                }
            }
            
            DispatchQueue.main.async {
                self.fetched = true
                self.allCoinValue = self.allCoinValue()
                self.allCoinUSDValue = self.allCoinValue(true)
                
                BaseData.instance.updateRefAddressesCoinValue(
                    RefAddress(id, self.tag, self.bechAddress, self.evmAddress,
                               self.lcdAllStakingDenomAmount().stringValue, self.allCoinUSDValue.stringValue,
                               nil, self.lcdAccountInfo.bnbCoins?.count))
                NotificationCenter.default.post(name: Notification.Name("FetchData"), object: self.tag, userInfo: nil)
            }
        }
    }
    
    override func fetchPreCreate() {
        lcdAccountInfo = JSON()
        Task {
            if let accountInfo = try? await fetchAccountInfo(bechAddress) {
                self.lcdAccountInfo = accountInfo ?? JSON()
            }
            
            DispatchQueue.main.async {
                self.fetched = true
                NotificationCenter.default.post(name: Notification.Name("FetchPreCreate"), object: self.tag, userInfo: nil)
            }
        }
    }
    
    override func isTxFeePayable() -> Bool {
        let availableAmount = lcdBalanceAmount(stakeDenom)
        return availableAmount.compare(NSDecimalNumber(string: BNB_BEACON_BASE_FEE)).rawValue > 0
    }
    
    override func allCoinValue(_ usd: Bool? = false) -> NSDecimalNumber {
        return lcdBalanceValue(stakeDenom, usd)
    }
    
    static func assetImg(_ original_symbol: String) -> URL {
        return URL(string: ResourceBase + "bnb-beacon-chain/asset/" + original_symbol.lowercased() + ".png") ?? URL(string: "")!
    }
}

extension ChainBinanceBeacon {
    
    func fetchNodeInfo() async throws -> JSON? {
        return try? await AF.request(BaseNetWork.lcdNodeInfoUrl(self), method: .get).serializingDecodable(JSON.self).value
    }
    
    func fetchAccountInfo(_ address: String) async throws -> JSON? {
        return try? await AF.request(BaseNetWork.lcdAccountInfoUrl(self, address), method: .get).serializingDecodable(JSON.self).value
    }
    
    func fetchBeaconTokens() async throws -> [JSON]? {
        return try? await AF.request(BaseNetWork.lcdBeaconTokenUrl(), method: .get, parameters: ["limit":"1000"]).serializingDecodable([JSON].self).value
    }
    
    func fetchBeaconMiniTokens() async throws -> [JSON]? {
        return try? await AF.request(BaseNetWork.lcdBeaconMiniTokenUrl(), method: .get, parameters: ["limit":"1000"]).serializingDecodable([JSON].self).value
    }
    
    
    func lcdAllStakingDenomAmount() -> NSDecimalNumber {
        return lcdBalanceAmount(stakeDenom)
    }
    
    func lcdBalanceAmount(_ denom: String) -> NSDecimalNumber {
        if let balance = lcdAccountInfo.bnbCoins?.filter({ $0["symbol"].string == denom }).first {
            return NSDecimalNumber.init(string: balance["free"].string ?? "0")
        }
        return NSDecimalNumber.zero
        
    }
    
    func lcdBalanceValue(_ denom: String, _ usd: Bool? = false) -> NSDecimalNumber {
        if (denom == stakeDenom) {
            let amount = lcdBalanceAmount(denom)
            var msPrice = BaseData.instance.getPrice(BNB_GECKO_ID, usd)
            return msPrice.multiplying(by: amount, withBehavior: handler6)
        }
        return NSDecimalNumber.zero
    }
}

let BNB_BEACON_LCD = "https://dex.binance.org/"
let BNB_BEACON_EXPLORER = "https://explorer.bnbchain.org/"
let BNB_BEACON_BASE_FEE = "0.000075"
let BNB_GECKO_ID = "binancecoin"
