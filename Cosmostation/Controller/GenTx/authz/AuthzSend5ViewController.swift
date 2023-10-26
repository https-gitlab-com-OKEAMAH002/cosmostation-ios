//
//  AuthzSend5ViewController.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2022/08/04.
//  Copyright © 2022 wannabit. All rights reserved.
//

import UIKit
import GRPC
import NIO

class AuthzSend5ViewController: BaseViewController, PasswordViewDelegate{
    
    @IBOutlet weak var sendAmountLabel: UILabel!
    @IBOutlet weak var sendDenomLabel: UILabel!
    @IBOutlet weak var feeAmountLabel: UILabel!
    @IBOutlet weak var feeDenomLabel: UILabel!
    @IBOutlet weak var mToAddressLabel: UILabel!
    @IBOutlet weak var mMemoLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var confirmBtn: UIButton!
    
    var pageHolderVC: StepGenTxViewController!
    var divideDecimal:Int16 = 6
    var displayDecimal:Int16 = 6

    override func viewDidLoad() {
        super.viewDidLoad()
        self.account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        self.chainType = ChainFactory.getChainType(account!.account_base_chain)
        self.chainConfig = ChainFactory.getChainConfig(chainType)
        self.pageHolderVC = self.parent as? StepGenTxViewController
        
        backBtn.borderColor = UIColor.font05
        confirmBtn.borderColor = UIColor.photon
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        backBtn.borderColor = UIColor.font05
        confirmBtn.borderColor = UIColor.photon
    }
    
    override func enableUserInteraction() {
        self.onUpdateView()
        self.backBtn.isUserInteractionEnabled = true
        self.confirmBtn.isUserInteractionEnabled = true
    }
    
    func onUpdateView() {
        WDP.dpCoin(chainConfig, pageHolderVC.mToSendAmount[0], sendDenomLabel, sendAmountLabel)
        WDP.dpCoin(chainConfig, pageHolderVC.mFee!.amount[0], feeDenomLabel, feeAmountLabel)
        mToAddressLabel.text = pageHolderVC.mRecipinetAddress
        mToAddressLabel.adjustsFontSizeToFitWidth = true
        mMemoLabel.text = pageHolderVC.mMemo
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        backBtn.isUserInteractionEnabled = false
        confirmBtn.isUserInteractionEnabled = false
        pageHolderVC.onBeforePage()
    }
    
    @IBAction func onClickConfirm(_ sender: Any) {
        if (BaseData.instance.isAutoPass()) {
            self.onFetchgRPCAuth(pageHolderVC.mAccount!)
        } else {
            self.navigationItem.title = ""
            self.navigationController!.view.layer.add(WUtils.getPasswordAni(), forKey: kCATransition)
            self.navigationController?.pushViewController(UIStoryboard.passwordViewController(delegate: self, target: PASSWORD_ACTION_CHECK_TX), animated: false)
        }
    }
    
    func passwordResponse(result: Int) {
        if (result == PASSWORD_RESUKT_OK) {
            self.onFetchgRPCAuth(pageHolderVC.mAccount!)
        }
    }
    
    func onFetchgRPCAuth(_ account: Account) {
        self.showWaittingAlert()
        DispatchQueue.global().async {
            do {
                let channel = BaseNetWork.getConnection(self.chainConfig)!
                let req = Cosmos_Auth_V1beta1_QueryAccountRequest.with { $0.address = account.account_address }
                if let response = try? Cosmos_Auth_V1beta1_QueryClient(channel: channel).account(req, callOptions: BaseNetWork.getCallOptions()).response.wait() {
                    self.onBroadcastGrpcTx(response)
                }
                try channel.close().wait()
            } catch {
                print("onFetchgRPCAuth failed: \(error)")
            }
        }
    }
    
    func onBroadcastGrpcTx(_ auth: Cosmos_Auth_V1beta1_QueryAccountResponse?) {
        DispatchQueue.global().async {
            let reqTx = Signer.genAuthzSend(auth!, self.account!.account_pubkey_type,
                                            self.account!.account_address,
                                            self.pageHolderVC.mGranterData.address,
                                            self.pageHolderVC.mRecipinetAddress!,
                                            self.pageHolderVC.mToSendAmount,
                                            self.pageHolderVC.mFee!, self.pageHolderVC.mMemo!,
                                            self.pageHolderVC.privateKey!, self.pageHolderVC.publicKey!,
                                            self.chainType!)
            do {
                let channel = BaseNetWork.getConnection(self.chainConfig)!
                let response = try Cosmos_Tx_V1beta1_ServiceClient(channel: channel).broadcastTx(reqTx).response.wait()
                DispatchQueue.main.async(execute: {
                    if (self.waitAlert != nil) {
                        self.waitAlert?.dismiss(animated: true, completion: {
                            self.onStartTxDetailgRPC(response)
                        })
                    }
                });
            } catch {
                print("onBroadcastGrpcTx failed: \(error)")
            }
        }
    }

}