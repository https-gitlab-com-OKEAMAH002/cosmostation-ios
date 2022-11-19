//
//  ChainKujira.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2022/10/17.
//  Copyright © 2022 wannabit. All rights reserved.
//
import UIKit
import Foundation


class ChainKujira: ChainConfig {
    var isGrpc = true
    var chainType = ChainType.KUJIRA_MAIN
    var chainImg = UIImage(named: "chainKujira")
    var chainInfoImg = UIImage(named: "infoKujira")
    var chainInfoTitle = NSLocalizedString("guide_title_kujira", comment: "")
    var chainInfoMsg = NSLocalizedString("guide_msg_kujira", comment: "")
    var chainColor = UIColor(named: "kujira")!
    var chainColorBG = UIColor(named: "kujira_bg")!
    var chainTitle = "(Kujira Mainnet)"
    var chainTitle2 = "KUJIRA"
    var chainDBName = CHAIN_KUJIRA_S
    var chainAPIName = "kujira"
    var chainIdPrefix = "kaiyo-"
    
    
    var stakeDenomImg = UIImage(named: "tokenKujira")
    var stakeDenom = "ukuji"
    var stakeSymbol = "KUJI"
    var stakeSendImg = UIImage(named: "sendImg")!
    var stakeSendBg = UIColor(named: "kujira")!
    var divideDecimal: Int16 = 6
    var displayDecimal: Int16 = 6
    
    var addressPrefix = "kujira"
    var validatorPrefix = "kujiravaloper"
    var defaultPath = "m/44'/118'/0'/0/X"
    
    let gasRate0 = "0.00119ukuji,0.00150factory/kujira1qk00h5atutpsv900x202pxx42npjr9thg58dnqpa72f2p7m2luase444a7/uusk,0.000125ibc/27394FB092D2ECCD56123C74F36E4C1F926001CEADA9CA97EA622B25F41E5EB2,0.00150ibc/295548A78785A1007F232DE286149A6FF512F180AF5657780FC89C009E2C348F,0.00126ibc/47BD209179859CDE4A2806763D7189B6E6FE13A17880FE2B42DE1E6C1E329E23,0.00652ibc/3607EB5B5E64DD1C0E12E07F077FF470D5BC4706AFCBC98FE1BA960E5AE4CE07,617283951ibc/F3AA7EF362EC5E791FE78A0F4CCC69FEE1F9A7485EB1A8CAB3F6601C00522F10,0.000288ibc/EFF323CC632EC4F747C61BCE238A758EFDB7699C3226565F7C20DA06509D59A5,0.00137ibc/A358D7F19237777AF6D8AD0E0F53268F8B18AE8A53ED318095C14D6D7F3B2DB5,0.0488ibc/4F393C3FCA4190C0A6756CE7F6D897D5D1BE57D6CCB80D0BC87393566A7B6602,78492936ibc/004EBF085BBED1029326D56BE8A2E67C08CECE670A94AC1947DF413EF5130EB2,964351ibc/1B38805B1C75352B28169284F96DF56BDEBD9E8FAC005BDCC8CF0378C82AA8E7"

    
    var etherAddressSupport = false
    var wasmSupport = false
    var evmSupport = false
    var wcSupoort = false
    var authzSupoort = false
    var moonPaySupoort = false
    var kadoMoneySupoort = true
    var grpcUrl = "lcd-kujira-app.cosmostation.io"
    var grpcPort = 9090
    var rpcUrl = ""
    var lcdUrl = "https://lcd-kujira-app.cosmostation.io/"
    var apiUrl = "https://api-kujira.cosmostation.io/"
    var explorerUrl = MintscanUrl + "kujira/"
    var validatorImgUrl = MonikerUrl + "kujira/"
    var priceUrl = CoingeckoUrl + "kujira"
    
    required init(_ chainType: ChainType) {
        self.chainType = chainType
    }
    
    func supportHdPaths() -> Array<String> {
        return [defaultPath]
    }
    
    func getHdPath(_ type: Int, _ path: Int) -> String {
        supportHdPaths()[type].replacingOccurrences(of: "X", with: String(path))
    }
    
    func getInfoLink1() -> String {
        return "https://kujira.app/"
    }

    func getInfoLink2() -> String {
        return "https://medium.com/team-kujira"
    }
    
    func getGasRates() -> Array<String> {
        return [gasRate0]
    }
    
    func getGasDefault() -> Int {
        return 0
    }
}
