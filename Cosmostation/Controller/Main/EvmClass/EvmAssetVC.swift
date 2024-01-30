//
//  EvmAssetVC.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2024/01/25.
//  Copyright © 2024 wannabit. All rights reserved.
//

import UIKit
import SwiftyJSON
import Lottie

class EvmAssetVC: BaseVC {
    
    @IBOutlet weak var loadingView: LottieAnimationView!
    @IBOutlet weak var tableView: UITableView!
    
    var selectedChain: EvmClass!
    var erc20Tokens = [MintscanToken]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseAccount = BaseData.instance.baseAccount
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "AssetCell", bundle: nil), forCellReuseIdentifier: "AssetCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderTopPadding = 0.0
        
        loadingView.isHidden = false
        loadingView.animation = LottieAnimation.named("loading")
        loadingView.contentMode = .scaleAspectFit
        loadingView.loopMode = .loop
        loadingView.animationSpeed = 1.3
        loadingView.play()
        
        onSortAssets()
    }
    
    func onSortAssets() {
        erc20Tokens.removeAll()
        Task {
            selectedChain.mintscanErc20Tokens.forEach { tokens in
                if (tokens.getAmount() != NSDecimalNumber.zero) {
                    erc20Tokens.append(tokens)
                }
            }
            erc20Tokens.sort {
                let value0 = selectedChain.tokenValue($0.address!)
                let value1 = selectedChain.tokenValue($1.address!)
                return value0.compare(value1).rawValue > 0 ? true : false
            }
            loadingView.isHidden = true
            tableView.reloadData()
        }
    }

}


extension EvmAssetVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = BaseHeader(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        if (section == 0) {
            view.titleLabel.text = "Coin"
            view.cntLabel.text = "1"
        } else {
            view.titleLabel.text = "Tokens"
            view.cntLabel.text = String(erc20Tokens.count)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) {
            return 40
        } else if (section == 1 && erc20Tokens.count > 0) {
            return 40
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        } else if (section == 1) {
            return erc20Tokens.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"AssetCell") as! AssetCell
        if (indexPath.section == 0) {
            cell.bindEvmClassCoin(selectedChain)
        } else {
            cell.bindEvmClassToken(selectedChain, erc20Tokens[indexPath.row])
        }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for cell in tableView.visibleCells {
            let hiddenFrameHeight = scrollView.contentOffset.y + (navigationController?.navigationBar.frame.size.height ?? 44) - cell.frame.origin.y
            if (hiddenFrameHeight >= 0 || hiddenFrameHeight <= cell.frame.size.height) {
                maskCell(cell: cell, margin: Float(hiddenFrameHeight))
            }
        }
    }

    func maskCell(cell: UITableViewCell, margin: Float) {
        cell.layer.mask = visibilityMaskForCell(cell: cell, location: (margin / Float(cell.frame.size.height) ))
        cell.layer.masksToBounds = true
    }

    func visibilityMaskForCell(cell: UITableViewCell, location: Float) -> CAGradientLayer {
        let mask = CAGradientLayer()
        mask.frame = cell.bounds
        mask.colors = [UIColor(white: 1, alpha: 0).cgColor, UIColor(white: 1, alpha: 1).cgColor]
        mask.locations = [NSNumber(value: location), NSNumber(value: location)]
        return mask;
    }
    
}