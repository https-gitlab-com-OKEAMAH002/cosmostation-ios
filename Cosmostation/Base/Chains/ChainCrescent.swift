//
//  ChainCrescent.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2022/05/10.
//  Copyright © 2022 wannabit. All rights reserved.
//

import UIKit
import Foundation

class ChainCrescent: ChainConfig {
    var isGrpc = true
    var chainType = ChainType.CRESCENT_MAIN
    var chainImg = UIImage(named: "chainCrescent")
    var chainInfoImg = UIImage(named: "infoiconCrescent")
    var chainInfoTitle = NSLocalizedString("send_guide_title_crescent", comment: "")
    var chainInfoMsg = NSLocalizedString("send_guide_msg_crescent", comment: "")
    
    var stakeDenomImg = UIImage(named: "tokenCrescent")
    var stakeDenom = "ucre"
    var stakeSymbol = "CRE"
    
    var addressPrefix = "cre"
    let addressHdPath0 = "m/44'/118'/0'/0/X"
    
    var grpcUrl = "lcd-crescent-app.cosmostation.io"
    var grpcPort = "9090"
    var lcdUrl = "https://lcd-crescent-app.cosmostation.io"
    var apiUrl = "https://api-crescent.cosmostation.io/"
    var explorerUrl = MintscanUrl + "crescent/"
    var validatorImgUrl = MonikerUrl + "crescent/"
    var relayerImgUrl = RelayerUrl + "crescent/relay-crescent-unknown.png"
    
    required init(_ chainType: ChainType) {
        self.chainType = chainType
    }
    
    func supportHdPaths() -> Array<String> {
        return [addressHdPath0]
    }
    
    func getHdPath(_ type: Int, _ path: Int) -> String {
        supportHdPaths()[type].replacingOccurrences(of: "X", with: String(path))
    }
    
    func getDpAddress(_ words: MWords, _ type: Int, _ path: Int) -> String {
        return ""
    }
}
