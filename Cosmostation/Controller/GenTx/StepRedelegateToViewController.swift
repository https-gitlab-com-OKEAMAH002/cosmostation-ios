//
//  StepRedelegateToViewController.swift
//  Cosmostation
//
//  Created by yongjoo on 23/05/2019.
//  Copyright © 2019 wannabit. All rights reserved.
//

import UIKit
import Alamofire
import GRPC
import NIO

class StepRedelegateToViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var redelegateToValTableView: UITableView!
    @IBOutlet weak var btnBefore: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    var pageHolderVC: StepGenTxViewController!
    
    var checkedValidator_gRPC: Cosmos_Staking_V1beta1_Validator?
    var checkedPosition:IndexPath?
    var mDpDecimal:Int16 = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageHolderVC = self.parent as? StepGenTxViewController
        mDpDecimal = WUtils.mainDivideDecimal(pageHolderVC.chainType)
        
        self.redelegateToValTableView.delegate = self
        self.redelegateToValTableView.dataSource = self
        self.redelegateToValTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.redelegateToValTableView.register(UINib(nibName: "RedelegateCell", bundle: nil), forCellReuseIdentifier: "RedelegateCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pageHolderVC.mToReDelegateValidators_gRPC.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:RedelegateCell? = tableView.dequeueReusableCell(withIdentifier:"RedelegateCell") as? RedelegateCell
        if let validator = self.pageHolderVC.mToReDelegateValidators_gRPC[indexPath.row] as? Cosmos_Staking_V1beta1_Validator {
            cell?.valMonikerLabel.text = validator.description_p.moniker
            cell?.valMonikerLabel.adjustsFontSizeToFitWidth = true
            if (validator.jailed == true) {
                cell?.valjailedImg.isHidden = false
                cell?.valjailedImg.layer.borderColor = UIColor(hexString: "#f31963").cgColor
            } else {
                cell?.valjailedImg.isHidden = true
                cell?.valjailedImg.layer.borderColor = UIColor(hexString: "#4B4F54").cgColor
            }
            
            cell?.valPowerLabel.attributedText = WUtils.displayAmount2(validator.tokens, cell!.valPowerLabel.font, mDpDecimal, mDpDecimal)
            cell?.valCommissionLabel.attributedText = WUtils.getDpEstAprCommission(cell!.valCommissionLabel.font, NSDecimalNumber.init(string: validator.commission.commissionRates.rate).multiplying(byPowerOf10: -18), pageHolderVC.chainType!)
            if let url = URL(string: WUtils.getMonikerImgUrl(pageHolderVC.chainType!, validator.operatorAddress)) {
                cell?.valImg.af_setImage(withURL: url)
            }
            cell?.rootCard.needBorderUpdate = false
            if (validator.operatorAddress == checkedValidator_gRPC?.operatorAddress) {
                cell?.valCheckedImg.image = cell?.valCheckedImg.image?.withRenderingMode(.alwaysTemplate)
                cell?.valCheckedImg.tintColor = WUtils.getChainColor(pageHolderVC.chainType!)
                cell?.rootCard.backgroundColor = UIColor.clear
                cell?.rootCard.layer.borderWidth = 1
                cell?.rootCard.layer.borderColor = UIColor(hexString: "#7A8388").cgColor
                cell?.rootCard.clipsToBounds = true
            } else {
                cell?.valCheckedImg.image = UIImage.init(named: "checkOff")
                cell?.rootCard.backgroundColor = UIColor.init(hexString: "2E2E2E", alpha: 0.4)
                cell?.rootCard.layer.borderWidth = 0
                cell?.rootCard.clipsToBounds = true
            }
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let validator = self.pageHolderVC.mToReDelegateValidators_gRPC[indexPath.row] as? Cosmos_Staking_V1beta1_Validator {
            self.checkedValidator_gRPC = validator
            self.checkedPosition = indexPath
            
            let cell:RedelegateCell? = tableView.cellForRow(at: indexPath) as? RedelegateCell
            cell?.rootCard.needBorderUpdate = false
            cell?.valCheckedImg.image = cell?.valCheckedImg.image?.withRenderingMode(.alwaysTemplate)
            cell?.valCheckedImg.tintColor = WUtils.getChainColor(pageHolderVC.chainType!)
            
            cell?.rootCard.backgroundColor = UIColor.clear
            cell?.rootCard.layer.borderWidth = 1
            cell?.rootCard.layer.borderColor = UIColor(hexString: "#7A8388").cgColor
            cell?.rootCard.clipsToBounds = true
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell:RedelegateCell? = tableView.cellForRow(at: indexPath) as? RedelegateCell
        cell?.valCheckedImg.image = UIImage.init(named: "checkOff")
        cell?.rootCard.backgroundColor = UIColor.init(hexString: "2E2E2E", alpha: 0.4)
        cell?.rootCard.layer.borderWidth = 0
        cell?.rootCard.clipsToBounds = true
    }
    
    override func enableUserInteraction() {
        self.btnBefore.isUserInteractionEnabled = true
        self.btnNext.isUserInteractionEnabled = true
        if (self.checkedPosition != nil) {
            self.redelegateToValTableView.selectRow(at: checkedPosition, animated: false, scrollPosition: .middle)
        }
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        self.btnBefore.isUserInteractionEnabled = false
        self.btnNext.isUserInteractionEnabled = false
        pageHolderVC.onBeforePage()
    }
    
    @IBAction func onClickNext(_ sender: UIButton) {
        if (self.checkedValidator_gRPC == nil && self.checkedValidator_gRPC?.operatorAddress == nil) {
            self.onShowToast(NSLocalizedString("error_redelegate_no_to_address", comment: ""))
            return;
        }
        self.onFetchRedelegation_gRPC(pageHolderVC.mAccount!.account_address, pageHolderVC.mTargetValidator_gRPC!.operatorAddress, self.checkedValidator_gRPC!.operatorAddress)
    }
    
    func goNextPage() {
        self.btnBefore.isUserInteractionEnabled = false
        self.btnNext.isUserInteractionEnabled = false
        pageHolderVC.mToReDelegateValidator_gRPC = self.checkedValidator_gRPC
        pageHolderVC.onNextPage()
    }
    
    func onFetchRedelegation_gRPC(_ address: String, _ fromValAddress: String, _ toValAddress: String) {
        DispatchQueue.global().async {
            let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
            defer { try! group.syncShutdownGracefully() }
            
            let channel = BaseNetWork.getConnection(self.pageHolderVC.chainType!, group)!
            defer { try! channel.close().wait() }
            
            let req = Cosmos_Staking_V1beta1_QueryRedelegationsRequest.with {
                $0.delegatorAddr = address
//                $0.srcValidatorAddr = fromValAddress
//                $0.dstValidatorAddr = toValAddress
            }
            do {
                let response = try Cosmos_Staking_V1beta1_QueryClient(channel: channel).redelegations(req).response.wait()
//                print("response ", response)
                for redelegation in response.redelegationResponses {
                    if (redelegation.redelegation.validatorSrcAddress == self.pageHolderVC.mTargetValidator_gRPC?.operatorAddress &&
                            redelegation.redelegation.validatorDstAddress == self.checkedValidator_gRPC?.operatorAddress) {
                        if (redelegation.entries.count > 7) {
                            DispatchQueue.main.async(execute: { self.onShowToast(NSLocalizedString("error_redelegate_cnt_over", comment: "")) });
                            return
                        }
                    }
                }
                DispatchQueue.main.async(execute: { self.goNextPage() });
                
            } catch {
                print("onFetchRedelegation_gRPC failed: \(error)")
            }
        }
    }
}
