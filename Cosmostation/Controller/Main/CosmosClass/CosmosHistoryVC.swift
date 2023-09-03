//
//  CosmosHistoryVC.swift
//  Cosmostation
//
//  Created by yongjoo jung on 2023/08/22.
//  Copyright © 2023 wannabit. All rights reserved.
//

import UIKit
import Alamofire

class CosmosHistoryVC: BaseVC {
    
    @IBOutlet weak var tableView: UITableView!
    
    var parentVC: CosmosClassVC!
    var selectedChain: CosmosClass!
    var msHistoryGroup = Array<MintscanHistoryGroup>()
    var msHistoyID: Int64 = 0
    var msHasMore = false
    let BATCH_CNT = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "HistoryCell", bundle: nil), forCellReuseIdentifier: "HistoryCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderTopPadding = 0.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        parentVC = self.parent as? CosmosClassVC

        baseAccount = BaseData.instance.baseAccount
        selectedChain = baseAccount.toDisplayCosmosChains[parentVC.selectedPosition]
        
        onRequestFetch()
    }
    
    @objc func onRequestFetch() {
        msHistoyID = 0
        msHasMore = false
        onFetchMsHistory(selectedChain.address, msHistoyID)
    }
    
    func onFetchMsHistory(_ address: String?, _ id: Int64) {
        let url = BaseNetWork.getAccountHistoryUrl(selectedChain!, address!)
        AF.request(url, method: .get, parameters: ["limit":String(BATCH_CNT), "from":String(id)]).responseDecodable(of: [MintscanHistory].self, queue: .main, decoder: JSONDecoder()) { response in
            switch response.result {
            case .success(let value):
                if (id == 0) { self.msHistoryGroup.removeAll() }
                if (value.count > 0) {
                    value.forEach { history in
                        let headerDate  = WDP.dpDate(history.header?.timestamp)
                        if let index = self.msHistoryGroup.firstIndex(where: { $0.date == headerDate }) {
                            self.msHistoryGroup[index].values.append(history)
                        } else {
                            self.msHistoryGroup.append(MintscanHistoryGroup.init(headerDate, [history]))
                        }
                    }
                    self.msHistoyID = value.last?.header?.id ?? 0
                    self.msHasMore = value.count >= self.BATCH_CNT
                    
                } else {
                    self.msHasMore = false
                    self.msHistoyID = 0
                }
                self.tableView.reloadData()
                
            case .failure:
                print("onFetchMsHistory error")
            }
        }
    }

}


extension CosmosHistoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return msHistoryGroup.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = BaseHeader(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let today = WDP.dpDate(Int(Date().timeIntervalSince1970) * 1000)
        if (msHistoryGroup[section].date == today) {
            view.titleLabel.text = "Today"
        } else {
            view.titleLabel.text = msHistoryGroup[section].date
        }
        view.cntLabel.text = ""
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msHistoryGroup[section].values.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"HistoryCell") as! HistoryCell
        let history = msHistoryGroup[indexPath.section].values[indexPath.row]
        cell.bindCosmosClassHistory(baseAccount, selectedChain, history)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.section == self.msHistoryGroup.count - 1 && indexPath.row == self.msHistoryGroup.last!.values.count - 1) {
            msHasMore = false
            onFetchMsHistory(selectedChain.address, msHistoyID)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let history = msHistoryGroup[indexPath.section].values[indexPath.row]
        guard let url = BaseNetWork.getTxDetailUrl(selectedChain, history.data!.txhash!) else { return }
        self.onShowSafariWeb(url)
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

struct MintscanHistoryGroup {
    var date : String!
    var values = Array<MintscanHistory>()
    
    init(_ date: String!, _ values: Array<MintscanHistory>) {
        self.date = date
        self.values = values
    }
}