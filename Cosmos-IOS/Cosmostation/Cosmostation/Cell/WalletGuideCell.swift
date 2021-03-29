//
//  WalletGuideCell.swift
//  Cosmostation
//
//  Created by yongjoo on 27/09/2019.
//  Copyright © 2019 wannabit. All rights reserved.
//

import UIKit

class WalletGuideCell: UITableViewCell {
    
    @IBOutlet weak var guideImg: UIImageView!
    @IBOutlet weak var guideTitle: UILabel!
    @IBOutlet weak var guideMsg: UILabel!
    @IBOutlet weak var btn1Label: UIButton!
    @IBOutlet weak var btn2Label: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    var actionGuide1: (() -> Void)? = nil
    var actionGuide2: (() -> Void)? = nil
    
    @IBAction func onClickGuide1(_ sender: Any) {
        actionGuide1?()
    }
    @IBAction func onClickGuide2(_ sender: Any) {
        actionGuide2?()
    }
    
    func updateView(_ account: Account?, _ chainType: ChainType?) {
        if (chainType == ChainType.COSMOS_MAIN || chainType == ChainType.COSMOS_TEST) {
            guideImg.image = UIImage(named: "guideImg")
            guideTitle.text = NSLocalizedString("send_guide_title_cosmos", comment: "")
            guideMsg.text = NSLocalizedString("send_guide_msg_cosmos", comment: "")
            btn1Label.setTitle(NSLocalizedString("send_guide_btn1_cosmos", comment: ""), for: .normal)
            btn2Label.setTitle(NSLocalizedString("send_guide_btn2_cosmos", comment: ""), for: .normal)
            
        } else if (chainType == ChainType.IRIS_MAIN || chainType == ChainType.IRIS_TEST) {
            guideImg.image = UIImage(named: "irisnetImg")
            guideTitle.text = NSLocalizedString("send_guide_title_iris", comment: "")
            guideMsg.text = NSLocalizedString("send_guide_msg_iris", comment: "")
            btn1Label.setTitle(NSLocalizedString("send_guide_btn1_iris", comment: ""), for: .normal)
            btn2Label.setTitle(NSLocalizedString("send_guide_btn2_iris", comment: ""), for: .normal)
            
        } else if (chainType == ChainType.AKASH_MAIN) {
            guideImg.image = UIImage(named: "akashImg")
            guideTitle.text = NSLocalizedString("send_guide_title_akash", comment: "")
            guideMsg.text = NSLocalizedString("send_guide_msg_akash", comment: "")
            btn1Label.setTitle(NSLocalizedString("send_guide_btn1_akash", comment: ""), for: .normal)
            btn2Label.setTitle(NSLocalizedString("send_guide_btn2_akash", comment: ""), for: .normal)
            
        } else if (chainType == ChainType.PERSIS_MAIN) {
            guideImg.image = UIImage(named: "persistenceImg")
            guideTitle.text = NSLocalizedString("send_guide_title_persis", comment: "")
            guideMsg.text = NSLocalizedString("send_guide_msg_persis", comment: "")
            btn1Label.setTitle(NSLocalizedString("send_guide_btn1_persis", comment: ""), for: .normal)
            btn2Label.setTitle(NSLocalizedString("send_guide_btn2_persis", comment: ""), for: .normal)
            
        } else if (chainType == ChainType.SENTINEL_MAIN) {
            guideImg.image = UIImage(named: "sentinelImg")
            guideTitle.text = NSLocalizedString("send_guide_title_sentinel", comment: "")
            guideMsg.text = NSLocalizedString("send_guide_msg_sentinel", comment: "")
            btn1Label.setTitle(NSLocalizedString("send_guide_btn1_sentinel", comment: ""), for: .normal)
            btn2Label.setTitle(NSLocalizedString("send_guide_btn2_sentinel", comment: ""), for: .normal)
            
        }
    }
}
