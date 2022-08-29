//
//  MainTabTokenViewController.swift
//  Cosmostation
//
//  Created by yongjoo on 26/09/2019.
//  Copyright © 2019 wannabit. All rights reserved.
//

import UIKit
import Alamofire
import UserNotifications
import SafariServices

class MainTabTokenViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    let SECTION_NATIVE_GRPC             = 1;
    let SECTION_IBC_GRPC                = 2;
    let SECTION_BRIDGE_GRPC             = 3;
    let SECTION_TOKEN_GRPC              = 4;
    
    let SECTION_NATIVE                  = 5;
    let SECTION_ETC                     = 6;

    @IBOutlet weak var titleChainImg: UIImageView!
    @IBOutlet weak var titleWalletName: UILabel!
    @IBOutlet weak var tokenTableView: UITableView!
    var refresher: UIRefreshControl!
    var mainTabVC: MainTabViewController!
    var mBnbTics = [String : NSMutableDictionary]()
    
    var mBalances = Array<Balance>()
    var mBalances_gRPC = Array<Coin>()
    
    var mNative_gRPC = Array<Coin>()                // section 1
    var mIbc_gRPC = Array<Coin>()                   // section 2
    var mBridged_gRPC = Array<Coin>()               // section 3
    var mToken_gRPC = Array<Cw20Token>()            // section 4
    
    var mNative = Array<Balance>()                  // section 5
    var mEtc = Array<Balance>()                     // section 6
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTabVC = (self.parent)?.parent as? MainTabViewController
        self.account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        self.chainType = ChainFactory.getChainType(account!.account_base_chain)
        self.chainConfig = ChainFactory.getChainConfig(chainType)
        
        self.tokenTableView.delegate = self
        self.tokenTableView.dataSource = self
        self.tokenTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tokenTableView.register(UINib(nibName: "WalletAddressCell", bundle: nil), forCellReuseIdentifier: "WalletAddressCell")
        self.tokenTableView.register(UINib(nibName: "TokenCell", bundle: nil), forCellReuseIdentifier: "TokenCell")
        self.tokenTableView.register(UINib(nibName: "AssetCell", bundle: nil), forCellReuseIdentifier: "AssetCell")
        self.tokenTableView.rowHeight = UITableView.automaticDimension
        self.tokenTableView.estimatedRowHeight = UITableView.automaticDimension
        
        if #available(iOS 15.0, *) {
            self.tokenTableView.sectionHeaderTopPadding = 0.0
        }
        
        refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(onRequestFetch), for: .valueChanged)
        refresher.tintColor = UIColor(named: "_font05")
        tokenTableView.addSubview(refresher)
        
        self.mBalances = BaseData.instance.mBalances
        self.mBalances_gRPC = BaseData.instance.mMyBalances_gRPC
        self.mToken_gRPC = BaseData.instance.getCw20s_gRPC()
        
        self.updateView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationController?.navigationBar.topItem?.title = "";
        NotificationCenter.default.addObserver(self, selector: #selector(self.onFetchDone(_:)), name: Notification.Name("onFetchDone"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.onFetchPrice(_:)), name: Notification.Name("onFetchPrice"), object: nil)
        self.updateTitle()
        self.updateView()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("onFetchDone"), object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("onFetchPrice"), object: nil)
    }
    
    func updateTitle() {
        self.account = BaseData.instance.selectAccountById(id: BaseData.instance.getRecentAccountId())
        self.chainType = ChainFactory.getChainType(account!.account_base_chain)
        self.chainConfig = ChainFactory.getChainConfig(chainType)
        
        self.titleChainImg.image = chainConfig?.chainImg
        self.titleWalletName.text = account?.getDpName()
    }
    
    func updateView() {
        self.onClassifyAssets()
        self.tokenTableView.reloadData()
    }
    
    @objc func onRequestFetch() {
        if (!mainTabVC.onFetchAccountData()) {
            self.refresher.endRefreshing()
        }
    }
    
    @objc func onFetchDone(_ notification: NSNotification) {
        self.mBalances = BaseData.instance.mBalances
        self.mBalances_gRPC = BaseData.instance.mMyBalances_gRPC
        self.mToken_gRPC = BaseData.instance.getCw20s_gRPC()
        
        self.updateView()
        self.refresher.endRefreshing()
    }
    
    @objc func onFetchPrice(_ notification: NSNotification) {
        self.updateView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) { return 0 }
        else if (section == SECTION_NATIVE_GRPC && mNative_gRPC.count > 0) { return 30 }
        else if (section == SECTION_IBC_GRPC && mIbc_gRPC.count > 0) { return 30 }
        else if (section == SECTION_BRIDGE_GRPC && mBridged_gRPC.count > 0) { return 30 }
        else if (section == SECTION_TOKEN_GRPC && mToken_gRPC.count > 0) { return 30 }
        
        else if (section == SECTION_NATIVE && mNative.count > 0) { return 30 }
        else if (section == SECTION_ETC && mEtc.count > 0) { return 30 }
        else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = CommonHeader(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        if (section == SECTION_NATIVE_GRPC) { view.headerTitleLabel.text = "Native Coins"; view.headerCntLabel.text = String(self.mNative_gRPC.count) }
        else if (section == SECTION_IBC_GRPC) { view.headerTitleLabel.text = "IBC Coins"; view.headerCntLabel.text = String(self.mIbc_gRPC.count) }
        else if (section == SECTION_BRIDGE_GRPC) { view.headerTitleLabel.text = "Bridged Assets"; view.headerCntLabel.text = String(self.mBridged_gRPC.count) }
        else if (section == SECTION_TOKEN_GRPC) { view.headerTitleLabel.text = "Contract Tokens"; view.headerCntLabel.text = String(self.mToken_gRPC.count) }
        
        else if (section == SECTION_NATIVE) { view.headerTitleLabel.text = "Native Coins"; view.headerCntLabel.text = String(self.mNative.count) }
        else if (section == SECTION_ETC) {
            view.headerTitleLabel.text = (chainType! == ChainType.OKEX_MAIN) ? "KIP10 Coins" : "Etc Coins"
            view.headerCntLabel.text = String(self.mEtc.count)
        }
        else { view.headerTitleLabel.text = ""; view.headerCntLabel.text = "" }
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) { return 1}
        else if (section == SECTION_NATIVE_GRPC) { return mNative_gRPC.count }
        else if (section == SECTION_IBC_GRPC) { return mIbc_gRPC.count }
        else if (section == SECTION_BRIDGE_GRPC) { return mBridged_gRPC.count }
        else if (section == SECTION_TOKEN_GRPC) { return mToken_gRPC.count }
        
        else if (section == SECTION_NATIVE) { return mNative.count }
        else if (section == SECTION_ETC) { return mEtc.count }
        else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            return onSetAddressItems(tableView, indexPath);
            
        } else {
            if (indexPath.section == SECTION_NATIVE_GRPC) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"AssetCell") as? AssetCell
                onBindNativeCoin_gRPC(cell, mNative_gRPC[indexPath.row])
                return cell!
                
            } else if (indexPath.section == SECTION_IBC_GRPC) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"AssetCell") as? AssetCell
                onBindIbcCoin_gRPC(cell, mIbc_gRPC[indexPath.row])
                return cell!
                
            } else if (indexPath.section == SECTION_BRIDGE_GRPC) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"AssetCell") as? AssetCell
                onBindBridgedAsset_gRPC(cell, mBridged_gRPC[indexPath.row])
                return cell!
                
            } else if (indexPath.section == SECTION_TOKEN_GRPC) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TokenCell") as? TokenCell
                onBindToken_gRPC(cell, mToken_gRPC[indexPath.row])
                return cell!
                
            }
            
            else if (indexPath.section == SECTION_NATIVE) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TokenCell") as? TokenCell
                onBindNativeToken(cell, mNative[indexPath.row])
                return cell!
                
            } else if (indexPath.section == SECTION_ETC) {
                let cell = tableView.dequeueReusableCell(withIdentifier:"TokenCell") as? TokenCell
                onBindEtcToken(cell, mEtc[indexPath.row])
                return cell!
                
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier:"TokenCell") as? TokenCell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == SECTION_NATIVE_GRPC) {
            if (mNative_gRPC[indexPath.row].denom == WUtils.getMainDenom(chainConfig)) {
                let sTokenDetailVC = StakingTokenGrpcViewController(nibName: "StakingTokenGrpcViewController", bundle: nil)
                sTokenDetailVC.hidesBottomBarWhenPushed = true
                self.navigationItem.title = ""
                self.navigationController?.pushViewController(sTokenDetailVC, animated: true)
            } else {
                let nTokenDetailVC = NativeTokenGrpcViewController(nibName: "NativeTokenGrpcViewController", bundle: nil)
                nTokenDetailVC.nativeDenom = mNative_gRPC[indexPath.row].denom
                nTokenDetailVC.hidesBottomBarWhenPushed = true
                self.navigationItem.title = ""
                self.navigationController?.pushViewController(nTokenDetailVC, animated: true)
            }

        } else if (indexPath.section == SECTION_IBC_GRPC) {
            let iTokenDetailVC = IBCTokenGrpcViewController(nibName: "IBCTokenGrpcViewController", bundle: nil)
            iTokenDetailVC.ibcDenom = mIbc_gRPC[indexPath.row].denom
            iTokenDetailVC.hidesBottomBarWhenPushed = true
            self.navigationItem.title = ""
            self.navigationController?.pushViewController(iTokenDetailVC, animated: true)

        } else if (indexPath.section == SECTION_BRIDGE_GRPC) {
            let bTokenDetailVC = BridgeTokenGrpcViewController(nibName: "BridgeTokenGrpcViewController", bundle: nil)
            bTokenDetailVC.hidesBottomBarWhenPushed = true
            bTokenDetailVC.bridgeDenom = mBridged_gRPC[indexPath.row].denom
            self.navigationItem.title = ""
            self.navigationController?.pushViewController(bTokenDetailVC, animated: true)

        }
//        else if (indexPath.section == SECTION_KAVA_BEP2_GRPC) {
//            let nTokenDetailVC = NativeTokenGrpcViewController(nibName: "NativeTokenGrpcViewController", bundle: nil)
//            nTokenDetailVC.nativeDenom = mKavaBep2_gRPC[indexPath.row].denom
//            nTokenDetailVC.hidesBottomBarWhenPushed = true
//            self.navigationItem.title = ""
//            self.navigationController?.pushViewController(nTokenDetailVC, animated: true)
//
//        }
        else if (indexPath.section == SECTION_TOKEN_GRPC) {
            let cTokenDetailVC = ContractTokenGrpcViewController(nibName: "ContractTokenGrpcViewController", bundle: nil)
            cTokenDetailVC.mCw20Token = mToken_gRPC[indexPath.row]
            cTokenDetailVC.hidesBottomBarWhenPushed = true
            self.navigationItem.title = ""
            self.navigationController?.pushViewController(cTokenDetailVC, animated: true)
            
        }

        else if (indexPath.section == SECTION_NATIVE) {
            if (mNative[indexPath.row].balance_denom == WUtils.getMainDenom(chainConfig)) {
                let sTokenDetailVC = StakingTokenDetailViewController(nibName: "StakingTokenDetailViewController", bundle: nil)
                sTokenDetailVC.hidesBottomBarWhenPushed = true
                self.navigationItem.title = ""
                self.navigationController?.pushViewController(sTokenDetailVC, animated: true)

            } else {
                let nTokenDetailVC = NativeTokenDetailViewController(nibName: "NativeTokenDetailViewController", bundle: nil)
                nTokenDetailVC.hidesBottomBarWhenPushed = true
                nTokenDetailVC.denom = mNative[indexPath.row].balance_denom
                self.navigationItem.title = ""
                self.navigationController?.pushViewController(nTokenDetailVC, animated: true)
            }

        } else if (indexPath.section == SECTION_ETC) {
            if (chainType == .BINANCE_MAIN || chainType == .OKEX_MAIN) {
                let nTokenDetailVC = NativeTokenDetailViewController(nibName: "NativeTokenDetailViewController", bundle: nil)
                nTokenDetailVC.hidesBottomBarWhenPushed = true
                nTokenDetailVC.denom = mEtc[indexPath.row].balance_denom
                self.navigationItem.title = ""
                self.navigationController?.pushViewController(nTokenDetailVC, animated: true)
            }

        }
    }
    
    func onSetAddressItems(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"WalletAddressCell") as? WalletAddressCell
        cell?.updateView(account, chainConfig)
        cell?.actionTapAddress = { self.shareAddressType(self.chainConfig, self.account) }
        return cell!
    }
    
    //bind native coins with grpc
    func onBindNativeCoin_gRPC(_ cell: AssetCell?, _ coin: Coin) {
        if let msAsset = BaseData.instance.getMSAsset(chainConfig!, coin.denom) {
            cell?.onBindNativeAsset(chainConfig, msAsset, coin)
        }
    }
    
    //bind ibc coins with grpc
    func onBindIbcCoin_gRPC(_ cell: AssetCell?, _ coin: Coin) {
        if let msAsset = BaseData.instance.getMSAsset(chainConfig!, coin.denom) {
            cell?.onBindIbcAsset(chainConfig, msAsset, coin)
        }
    }
    
    //bind bridged tokens with grpc (Bep2, SifChain, G-bridge, Injective)
    func onBindBridgedAsset_gRPC(_ cell: AssetCell?, _ coin: Coin) {
        if let msAsset = BaseData.instance.getMSAsset(chainConfig!, coin.denom) {
            cell?.onBindBridgeAsset(chainConfig, msAsset, coin)
        }
    }
    
    //bind contract tokens
    func onBindToken_gRPC(_ cell: TokenCell?, _ token: Cw20Token) {
        cell?.tokenImg.af_setImage(withURL: token.getImgUrl())
        cell?.tokenSymbol.text = token.denom.uppercased()
        cell?.tokenSymbol.textColor = UIColor(named: "_font05")
        cell?.tokenTitle.text = ""
        cell?.tokenDescription.text = token.contract_address
        
        let decimal = token.decimal
        cell?.tokenAmount.attributedText = WDP.dpAmount(token.amount, cell!.tokenAmount.font!, decimal, 6)
        cell?.tokenValue.attributedText = WUtils.dpValueUserCurrency(token.denom, token.getAmount(), decimal, cell!.tokenValue.font)
    }
    
    
    //bind native tokens
    func onBindNativeToken(_ cell: TokenCell?, _ balance: Balance) {
        if (balance.balance_denom == BNB_MAIN_DENOM) {
            if let bnbToken = WUtils.getBnbToken(BNB_MAIN_DENOM) {
                cell?.tokenImg.image = UIImage(named: "tokenBinance")
                cell?.tokenSymbol.text = bnbToken.original_symbol.uppercased()
                cell?.tokenSymbol.textColor = UIColor(named: "binance")
                cell?.tokenTitle.text = "(" + bnbToken.symbol + ")"
                cell?.tokenDescription.text = bnbToken.name
                
                let amount = WUtils.getAllBnbToken(BNB_MAIN_DENOM)
                cell?.tokenAmount.attributedText = WDP.dpAmount(amount.stringValue, cell!.tokenAmount.font, 0, 6)
                cell?.tokenValue.attributedText = WUtils.dpValueUserCurrency(BNB_MAIN_DENOM, amount, 0, cell!.tokenValue.font)
            }
            
        } else if (balance.balance_denom == OKEX_MAIN_DENOM) {
            if let okToken = WUtils.getOkToken(OKEX_MAIN_DENOM) {
                cell?.tokenImg.image = UIImage(named: "tokenOkc")
                cell?.tokenSymbol.text = okToken.original_symbol!.uppercased()
                cell?.tokenSymbol.textColor = UIColor(named: "okc")
                cell?.tokenTitle.text = "(" + okToken.symbol! + ")"
                cell?.tokenDescription.text = "OKC Staking Coin"
                
                let tokenAmount = WUtils.getAllExToken(OKEX_MAIN_DENOM)
                cell?.tokenAmount.attributedText = WDP.dpAmount(tokenAmount.stringValue, cell!.tokenAmount.font, 0, 6)
                cell?.tokenValue.attributedText = WUtils.dpValueUserCurrency(OKEX_MAIN_DENOM, tokenAmount, 0, cell!.tokenValue.font)
            }
        }
    }
    
    //bind Etc tokens (binance, okex)
    func onBindEtcToken(_ cell: TokenCell?, _ balance: Balance) {
        if (chainType == .BINANCE_MAIN) {
            if let bnbToken = WUtils.getBnbToken(balance.balance_denom) {
                cell?.tokenImg.af_setImage(withURL: URL(string: BinanceTokenImgUrl + bnbToken.original_symbol + ".png")!)
                cell?.tokenSymbol.text = bnbToken.original_symbol.uppercased()
                cell?.tokenSymbol.textColor = UIColor(named: "_font05")
                cell?.tokenTitle.text = "(" + bnbToken.symbol + ")"
                cell?.tokenDescription.text = bnbToken.name
                
                let tokenAmount = WUtils.getAllBnbToken(balance.balance_denom)
                let convertAmount = WUtils.getBnbConvertAmount(balance.balance_denom)
                cell?.tokenAmount.attributedText = WDP.dpAmount(tokenAmount.stringValue, cell!.tokenAmount.font, 0, 6)
                cell?.tokenValue.attributedText = WUtils.dpValueUserCurrency(BNB_MAIN_DENOM, convertAmount, 0, cell!.tokenValue.font)
            }
            
        }  else if (chainType == .OKEX_MAIN) {
            if let okToken = WUtils.getOkToken(balance.balance_denom) {
                cell?.tokenImg.af_setImage(withURL: URL(string: OKTokenImgUrl + okToken.original_symbol! + ".png")!)
                cell?.tokenSymbol.text = okToken.original_symbol?.uppercased()
                cell?.tokenSymbol.textColor = UIColor(named: "_font05")
                cell?.tokenTitle.text = "(" + okToken.symbol! + ")"
                cell?.tokenDescription.text = okToken.description
                
                let tokenAmount = WUtils.getAllExToken(balance.balance_denom)
                let convertedAmount = WUtils.convertTokenToOkt(balance.balance_denom)
                cell?.tokenAmount.attributedText = WDP.dpAmount(tokenAmount.stringValue, cell!.tokenAmount.font, 0, 6)
                cell?.tokenValue.attributedText = WUtils.dpValueUserCurrency(OKEX_MAIN_DENOM, convertedAmount, 0, cell!.tokenValue.font)
            }
        }
    }
    
    func onClassifyAssets() {
        mNative_gRPC.removeAll()
        mIbc_gRPC.removeAll()
        mBridged_gRPC.removeAll()
        
        self.mBalances_gRPC.forEach { balance_gRPC in
            if (WUtils.getMainDenom(chainConfig) == balance_gRPC.denom) {
                mNative_gRPC.append(balance_gRPC)
                
            } else if (balance_gRPC.isIbc()) {
                if let ibcToken = BaseData.instance.getIbcToken(balance_gRPC.getIbcHash()) {
                    if (ibcToken.auth == true) { mIbc_gRPC.append(balance_gRPC) }
                }
                
            } else if (chainType == .OSMOSIS_MAIN) {
                if (balance_gRPC.denom == OSMOSIS_ION_DENOM) {
                    mNative_gRPC.append(balance_gRPC)
                }
                
            } else if (chainType == .EMONEY_MAIN) {
                if (balance_gRPC.denom == EMONEY_EUR_DENOM || balance_gRPC.denom == EMONEY_CHF_DENOM || balance_gRPC.denom == EMONEY_DKK_DENOM ||
                    balance_gRPC.denom == EMONEY_NOK_DENOM || balance_gRPC.denom == EMONEY_SEK_DENOM) {
                    mNative_gRPC.append(balance_gRPC)
                }
            
            } else if (chainType == .SIF_MAIN && balance_gRPC.denom.starts(with: "c")) {
                mBridged_gRPC.append(balance_gRPC)
                
            } else if (chainType == .GRAVITY_BRIDGE_MAIN && balance_gRPC.denom.starts(with: "gravity0x")) {
                mBridged_gRPC.append(balance_gRPC)
                
            } else if (chainType == .AXELAR_MAIN) {
                if (BaseData.instance.getMSAsset(chainConfig!, balance_gRPC.denom)?.type == "bridge") {
                    mBridged_gRPC.append(balance_gRPC)
                }
                
            } else if (chainType == .KAVA_MAIN) {
                if (balance_gRPC.denom == KAVA_HARD_DENOM || balance_gRPC.denom == KAVA_USDX_DENOM || balance_gRPC.denom == KAVA_SWAP_DENOM) {
                    mNative_gRPC.append(balance_gRPC)

                } else if (balance_gRPC.denom == TOKEN_HTLC_KAVA_BNB || balance_gRPC.denom == TOKEN_HTLC_KAVA_BTCB ||
                           balance_gRPC.denom == TOKEN_HTLC_KAVA_XRPB || balance_gRPC.denom == TOKEN_HTLC_KAVA_BUSD ||
                           balance_gRPC.denom == "btch") {
                    mBridged_gRPC.append(balance_gRPC)

                }

            } else if (chainType == .INJECTIVE_MAIN) {
                if (balance_gRPC.denom.starts(with: "peggy0x")) {
                    mBridged_gRPC.append(balance_gRPC)
                }
                
            } else if (chainType == .CRESCENT_MAIN || chainType == .CRESCENT_TEST) {
                if (balance_gRPC.denom == CRESCENT_BCRE_DENOM) {
                    mNative_gRPC.append(balance_gRPC)
                }
                
            } else if (chainType == .NYX_MAIN) {
                if (balance_gRPC.denom == NYX_NYM_DENOM) {
                    mNative_gRPC.append(balance_gRPC)
                }
                
            }
        }
        
        mNative.removeAll()
        mEtc.removeAll()
        self.mBalances.forEach { balance in
            if (WUtils.getMainDenom(chainConfig) == balance.balance_denom) {
                mNative.append(balance)
                
            } else if (chainType == .BINANCE_MAIN) {
                mEtc.append(balance)
                
            } else if (chainType == .OKEX_MAIN) {
                mEtc.append(balance)
                
            }
        }
        
        mNative_gRPC.sort {
            if ($0.denom == WUtils.getMainDenom(chainConfig)) { return true }
            if ($1.denom == WUtils.getMainDenom(chainConfig)) { return false }
            if (chainType == .KAVA_MAIN) {
                if ($0.denom == KAVA_HARD_DENOM) { return true }
                if ($1.denom == KAVA_HARD_DENOM) { return false }
                if ($0.denom == KAVA_SWAP_DENOM) { return true }
                if ($1.denom == KAVA_SWAP_DENOM) { return false }
            }
            return false
        }
        mNative.sort {
            if ($0.balance_denom == WUtils.getMainDenom(chainConfig)) { return true }
            if ($1.balance_denom == WUtils.getMainDenom(chainConfig)) { return false }
            
            return false
        }
        mEtc.sort {
            if (chainType == ChainType.OKEX_MAIN) {
                if ($0.balance_denom == "okb-c4d") { return true }
                if ($1.balance_denom == "okb-c4d") { return false }
            }
            return false
        }
    }
    
    @IBAction func onClickSwitchAccount(_ sender: UIButton) {
        sender.isUserInteractionEnabled = false
        self.mainTabVC.onShowAccountSwicth {
            sender.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func onClickExplorer(_ sender: UIButton) {
        let link = WUtils.getAccountExplorer(chainConfig, account!.account_address)
        guard let url = URL(string: link) else { return }
        self.onShowSafariWeb(url)
    }
}
