//
//  ChainArchway.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/10/01.
//  Copyright © 2023 wannabit. All rights reserved.
//

import Foundation

class ChainArchway: CosmosClass  {
    
    override init() {
        super.init()
        
        name = "Archway"
        id = "archway118"
        logo1 = "chainArchway"
        logo2 = "chainArchway2"
        apiName = "archway"
        stakeDenom = "aarch"
        
        accountKeyType = AccountKeyType(.COSMOS_Secp256k1, "m/44'/118'/0'/0/X")
        accountPrefix = "archway"
        
        grpcHost = "grpc-archway.cosmostation.io"
    }
    
}