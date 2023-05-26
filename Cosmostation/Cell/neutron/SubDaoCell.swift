//
//  SubDaoCell.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/04/26.
//  Copyright © 2023 wannabit. All rights reserved.
//

import UIKit

class SubDaoCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var moduleCntLabel: UILabel!
    @IBOutlet weak var uriLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func onBindView(_ chainConfig: ChainConfig, _ position: Int) {
        let dao = BaseData.instance.mNeutronDaos[position]
        titleLabel.text = dao.name?.uppercased()
        descriptionLabel.text = dao.description
        moduleCntLabel.text = String(dao.proposal_modules.count)
        uriLabel.text = dao.dao_uri
    }
}