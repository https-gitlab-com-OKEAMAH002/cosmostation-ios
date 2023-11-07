//
//  QrAddressPopupVC.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/09/09.
//  Copyright © 2023 wannabit. All rights reserved.
//

import UIKit

class QrAddressPopupVC: BaseVC {
    
    @IBOutlet weak var chainNameLabel: UILabel!
    @IBOutlet weak var rqImgView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var hdPathLabel: UILabel!
    @IBOutlet weak var tagLayer: UIStackView!
    @IBOutlet weak var deprecatedLabel: UILabel!
    @IBOutlet weak var evmLabel: UILabel!
    
    var selectedChain: CosmosClass!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseAccount = BaseData.instance.baseAccount
        chainNameLabel.text = selectedChain.name.uppercased() + "  (" + baseAccount.name + ")"
        addressLabel.text = selectedChain.address
        addressLabel.adjustsFontSizeToFitWidth = true
        if (baseAccount.type == .withMnemonic) {
            hdPathLabel.text = selectedChain.getHDPath(baseAccount.lastHDPath)
            
            if (selectedChain.evmCompatible) {
                tagLayer.isHidden = false
                evmLabel.isHidden = false
                
            } else if (selectedChain.isDefault == false) {
                tagLayer.isHidden = false
                deprecatedLabel.isHidden = false
            }
            
        } else {
            hdPathLabel.text = ""
            
            if (selectedChain.evmCompatible) {
                tagLayer.isHidden = false
                evmLabel.isHidden = false
                
            }
        }
        
        if let qrImage = generateQrCode(selectedChain.address) {
            rqImgView.image = UIImage(ciImage: qrImage)
            let chainLogo = UIImage.init(named: selectedChain.logo1)
            chainLogo?.addToCenter(of: rqImgView)
        }
    }
}