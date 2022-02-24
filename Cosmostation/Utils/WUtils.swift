//
//  WUtils.swift
//  Cosmostation
//
//  Created by yongjoo on 22/03/2019.
//  Copyright © 2019 wannabit. All rights reserved.
//

import Foundation
import UIKit

public class WUtils {
    
    static let handler18 = NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.down, scale: 18, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
    
    static let handler12 = NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.down, scale: 12, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
    
    static let handler8 = NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.down, scale: 8, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
    
    static let handler6 = NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.down, scale: 6, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
    
    static let handler4Down = NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.down, scale: 4, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
    
    static let handler2 = NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.bankers, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
    
    static let handler2Down = NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.down, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
    
    static let handler3Down = NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.down, scale: 3, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
    
    static let handler0 = NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.bankers, scale: 0, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
    
    static let handler0Up = NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.up, scale: 0, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
    
    static let handler0Down = NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.down, scale: 0, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
    
    static let handler12Down = NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.down, scale: 12, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)

    static let handler24Down = NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.down, scale: 24, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
    
    static func getDivideHandler(_ decimal:Int16) -> NSDecimalNumberHandler{
        return NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.down, scale: decimal, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
    }

    
    static func getAccountWithAccountInfo(_ account: Account, _ accountInfo: AccountInfo) -> Account {
        let result = account
        if (accountInfo.type == COSMOS_AUTH_TYPE_ACCOUNT || accountInfo.type == COSMOS_AUTH_TYPE_ACCOUNT_LEGACY || accountInfo.type == COSMOS_AUTH_TYPE_CERTIK_MANUAL) {
            result.account_address = accountInfo.value.address
            result.account_sequence_number = Int64(accountInfo.value.sequence) ?? 0
            result.account_account_numner = Int64(accountInfo.value.account_number) ?? 0
        } else {
            result.account_address = accountInfo.value.BaseVestingAccount.BaseAccount.address
            result.account_sequence_number = Int64(accountInfo.value.BaseVestingAccount.BaseAccount.sequence) ?? 0
            result.account_account_numner = Int64(accountInfo.value.BaseVestingAccount.BaseAccount.account_number) ?? 0
        }
        return result
    }
    
    static func getAccountWithBnbAccountInfo(_ account: Account, _ accountInfo: BnbAccountInfo) -> Account {
        let result = account
        result.account_address = accountInfo.address
        result.account_sequence_number = Int64(accountInfo.sequence)
        result.account_account_numner = Int64(accountInfo.account_number)
        return result
    }
    
    static func getAccountWithKavaAccountInfo(_ account: Account, _ accountInfo: KavaAccountInfo) -> Account {
        let result = account
        if (accountInfo.result.type == COSMOS_AUTH_TYPE_ACCOUNT) {
            result.account_address = accountInfo.result.value.address
            result.account_sequence_number = Int64(accountInfo.result.value.sequence)!
            result.account_account_numner = Int64(accountInfo.result.value.account_number)!
        } else if (accountInfo.result.type == COSMOS_AUTH_TYPE_V_VESTING_ACCOUNT || accountInfo.result.type == COSMOS_AUTH_TYPE_P_VESTING_ACCOUNT) {
            result.account_address = accountInfo.result.value.address
            result.account_sequence_number = Int64(accountInfo.result.value.sequence)!
            result.account_account_numner = Int64(accountInfo.result.value.account_number)!
        }
        return result
    }
    
    static func getAccountWithOkAccountInfo(_ account: Account, _ accountInfo: OkAccountInfo) -> Account {
        let result = account
        if (accountInfo.type == COSMOS_AUTH_TYPE_OKEX_ACCOUNT) {
            result.account_address = accountInfo.value!.address!
            result.account_sequence_number = Int64(accountInfo.value!.sequence!)!
            result.account_account_numner = Int64(accountInfo.value!.account_number!)!
        }
        return result
    }
    
    static func getAccountWithVestingAccountInfo(_ account: Account, _ accountInfo: VestingAccountInfo) -> Account {
        let result = account
        result.account_address = account.account_address
        result.account_sequence_number = Int64(accountInfo.result!.value!.sequence!)!
        result.account_account_numner = Int64(accountInfo.result!.value!.account_number!)!
        return result
    }
    
    static func getBalancesWithAccountInfo(_ account: Account, _ accountInfo: AccountInfo) -> Array<Balance> {
        var result = Array<Balance>()
        if (accountInfo.type == COSMOS_AUTH_TYPE_ACCOUNT || accountInfo.type == COSMOS_AUTH_TYPE_ACCOUNT_LEGACY ||
            accountInfo.type == COSMOS_AUTH_TYPE_CERTIK_MANUAL) {
            for coin in accountInfo.value.coins {
                result.append(Balance.init(account.account_id, coin.denom, coin.amount, Date().millisecondsSince1970))
            }
            
        } else {
            for coin in accountInfo.value.BaseVestingAccount.BaseAccount.coins {
                result.append(Balance.init(account.account_id, coin.denom, coin.amount, Date().millisecondsSince1970))
            }
        }
        return result
    }
    
    static func getBalancesWithAccountInfo(_ accountInfo: AccountInfo) -> Array<Balance> {
        var result = Array<Balance>()
        if(accountInfo.type == COSMOS_AUTH_TYPE_ACCOUNT ||
            accountInfo.type == COSMOS_AUTH_TYPE_ACCOUNT_LEGACY ||
            accountInfo.type == COSMOS_AUTH_TYPE_CERTIK_MANUAL) {
            for coin in accountInfo.value.coins {
                result.append(Balance.init(-1, coin.denom, coin.amount, Date().millisecondsSince1970))
            }

        } else {
            for coin in accountInfo.value.BaseVestingAccount.BaseAccount.coins {
                result.append(Balance.init(-1, coin.denom, coin.amount, Date().millisecondsSince1970))
            }
        }
        return result
    }
    
    
    
    static func getBalancesWithBnbAccountInfo(_ account: Account, _ accountInfo: BnbAccountInfo) -> Array<Balance> {
        var result = Array<Balance>()
        for bnbBalance in accountInfo.balances {
            result.append(Balance(account.account_id, bnbBalance.symbol, bnbBalance.free, Date().millisecondsSince1970, bnbBalance.frozen, bnbBalance.locked))
        }
        return result;
    }
    
    static func getBalancesWithOkAccountInfo(_ account: Account, _ accountToken: OkAccountToken) -> Array<Balance> {
        var result = Array<Balance>()
        for okBalance in accountToken.data.currencies {
             result.append(Balance(account.account_id, okBalance.symbol, okBalance.available, Date().millisecondsSince1970, "0", okBalance.locked))
        }
        return result;
    }
    
    static func newApiTimeToInt64(_ input: String?) -> Date? {
        if (input == nil) { return nil }
        let nodeFormatter = DateFormatter()
        nodeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        nodeFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        return nodeFormatter.date(from: input!)
    }
    
    static func newApiTimeToString(_ input: String?) -> String {
        if (input == nil) { return "" }
        let nodeFormatter = DateFormatter()
        nodeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        nodeFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        
        let localFormatter = DateFormatter()
        localFormatter.dateFormat = NSLocalizedString("date_format", comment: "")
        
        guard let fullDate = nodeFormatter.date(from: input!) else {
            return ""
        }
        return localFormatter.string(from: fullDate)
        
    }
    
    static func newApiTimeGap(_ input: String?) -> String {
        if (input == nil || newApiTimeToInt64(input!) == nil) { return "-" }
        let secondsAgo = Int(Date().timeIntervalSince(newApiTimeToInt64(input!)!))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        
        if secondsAgo < minute {
            return "(\(secondsAgo) seconds ago)"
        } else if secondsAgo < hour {
            return "(\(secondsAgo / minute) minutes ago)"
        } else if secondsAgo < day {
            return "(\(secondsAgo / hour) hours ago)"
        } else {
            return "(\(secondsAgo / day) days ago)"
        }
    }
    
    
    static func sifNodeTimeToString(_ input: String?) -> String {
        if (input == nil) { return ""}
        let nodeFormatter = DateFormatter()
        nodeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        nodeFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        
        let localFormatter = DateFormatter()
        localFormatter.dateFormat = NSLocalizedString("date_format", comment: "")
        
        guard let fullDate = nodeFormatter.date(from: input!) else { return "" }
        return localFormatter.string(from: fullDate)
    }
    
    static func nodeTimeToInt64(input: String) -> Date {
        let nodeFormatter = DateFormatter()
        nodeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSSS'Z'"
        nodeFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        return nodeFormatter.date(from: input) ?? Date.init()
    }
    
    static func nodeTimetoString(input: String?) -> String {
        if (input == nil) { return ""}
        let nodeFormatter = DateFormatter()
        nodeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSSS'Z'"
        nodeFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        
        let localFormatter = DateFormatter()
        localFormatter.dateFormat = NSLocalizedString("date_format", comment: "")
        
        if (input != nil) {
            let fullDate = nodeFormatter.date(from: input!)
            return localFormatter.string(from: fullDate!)
        } else {
            return ""
        }
    }
    
    static func txTimeToInt64(input: String) -> Date {
        let nodeFormatter = DateFormatter()
        nodeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        nodeFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        return nodeFormatter.date(from: input) ?? Date.init()
    }
    
    static func txTimetoString(input: String?) -> String {
        if (input == nil || input!.count == 0) {
            return "??"
        }
        let nodeFormatter = DateFormatter()
        nodeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        nodeFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        
        let localFormatter = DateFormatter()
        localFormatter.dateFormat = NSLocalizedString("date_format", comment: "")
        if (input != nil) {
            let fullDate = nodeFormatter.date(from: input!)
            return localFormatter.string(from: fullDate!)
        } else {
            return ""
        }
    }
    
    static func txTimetoShortString(input: String?) -> String {
        let nodeFormatter = DateFormatter()
        nodeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        nodeFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        
        let localFormatter = DateFormatter()
        localFormatter.dateFormat = NSLocalizedString("date_format2", comment: "")
        if (input != nil) {
            let fullDate = nodeFormatter.date(from: input!)
            return localFormatter.string(from: fullDate!)
        } else {
            return ""
        }
    }
    
    
    static func longTimetoString(_ input: Int64) -> String {
        let localFormatter = DateFormatter()
        localFormatter.dateFormat = NSLocalizedString("date_format", comment: "")
        
        let fullDate = Date.init(milliseconds: Int(input))
        return localFormatter.string(from: fullDate)
    }
    
    static func longTimetoString3(_ input: Int64) -> String {
        let localFormatter = DateFormatter()
        localFormatter.dateFormat = NSLocalizedString("date_format3", comment: "")
        
        let fullDate = Date.init(milliseconds: Int(input))
        return localFormatter.string(from: fullDate)
    }
    
    static func nodeTimetoString3(_ input: String) -> String {
        let nodeFormatter = DateFormatter()
        nodeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSSS'Z'"
        nodeFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        let date = nodeFormatter.date(from: input) ?? Date.init()
        return longTimetoString3(date.millisecondsSince1970)
    }
    
    
    static func vestingTimeToString(_ startTime:Int64, _ vesting: KavaAccountInfo.VestingPeriod) -> String {
        let localFormatter = DateFormatter()
        localFormatter.dateFormat = NSLocalizedString("date_format", comment: "")
        let unlockTime = (startTime + vesting.length) * 1000
        
        let fullDate = Date.init(milliseconds: Int(unlockTime))
        return localFormatter.string(from: fullDate)
    }
    
    static func unbondingDateFromNow(_ date:Int) -> String {
        let localFormatter = DateFormatter()
        localFormatter.dateFormat = NSLocalizedString("date_format", comment: "")
        
        let afterDate = Calendar.current.date(
            byAdding: .day,
            value: +date,
            to: Date())
        return localFormatter.string(from: afterDate!)
    }
    
    static func getUnbondingTimeleft(_ input: Int64) -> String {
        let secondsLeft = Int(Date().timeIntervalSince(Date.init(milliseconds: Int(input)))) * -1
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        if secondsLeft < minute {
            return "Soon"
        } else if secondsLeft < hour {
            return "(\(secondsLeft / minute) minutes remaining)"
        } else if secondsLeft < day {
            return "(\(secondsLeft / hour) hours remaining)"
        } else {
            return "(\(secondsLeft / day) days remaining)"
        }
    }
    
    static func getUnbondingTimeleft2(_ input: String) -> String {
        let nodeFormatter = DateFormatter()
        nodeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSSS'Z'"
        nodeFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        let date = nodeFormatter.date(from: input) ?? Date.init()
        
        let secondsLeft = Int(Date().timeIntervalSince(date)) * -1
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        if secondsLeft < minute {
            return "Soon"
        } else if secondsLeft < hour {
            return "(\(secondsLeft / minute) minutes remaining)"
        } else if secondsLeft < day {
            return "(\(secondsLeft / hour) hours remaining)"
        } else {
            return "(\(secondsLeft / day) days remaining)"
        }
    }
    
    static func timeGap(input: String?) -> String {
        if (input == nil) { return "-"}
        let secondsAgo = Int(Date().timeIntervalSince(nodeTimeToInt64(input: input!)))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        
        if secondsAgo < minute {
            return "(\(secondsAgo) seconds ago)"
        } else if secondsAgo < hour {
            return "(\(secondsAgo / minute) minutes ago)"
        } else if secondsAgo < day {
            return "(\(secondsAgo / hour) hours ago)"
        } else {
            return "(\(secondsAgo / day) days ago)"
        }
    }
    
    static func timeGap2(input: Int64) -> String {
        if (input == nil) { return "-"}
        let secondsAgo = (Int(Date().millisecondsSince1970 - input) / 1000)
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        
        if secondsAgo < minute {
            return "(\(secondsAgo) seconds ago)"
        } else if secondsAgo < hour {
            return "(\(secondsAgo / minute) minutes ago)"
        } else if secondsAgo < day {
            return "(\(secondsAgo / hour) hours ago)"
        } else {
            return "(\(secondsAgo / day) days ago)"
        }
    }
    
    static func txTimeGap(input: String?) -> String {
        if (input == nil || input!.count == 0) { return "??" }
        let secondsAgo = Int(Date().timeIntervalSince(txTimeToInt64(input: input!)))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        
        if secondsAgo < minute {
            return "(\(secondsAgo) seconds ago)"
        } else if secondsAgo < hour {
            return "(\(secondsAgo / minute) minutes ago)"
        } else if secondsAgo < day {
            return "(\(secondsAgo / hour) hours ago)"
        } else {
            return "(\(secondsAgo / day) days ago)"
        }
    }
    
    static func vestingTimeGap(_ startTime:Int64, _ vesting: KavaAccountInfo.VestingPeriod) -> String {
        let unlockTime = (startTime + vesting.length) * 1000
        let secondsLeft = Int(Date().timeIntervalSince(Date.init(milliseconds: Int(unlockTime)))) * -1
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        if secondsLeft < minute {
            return "Soon"
        } else if secondsLeft < hour {
            return "(\(secondsLeft / minute) minutes remaining)"
        } else if secondsLeft < day {
            return "(\(secondsLeft / hour) hours remaining)"
        } else {
            return "(\(secondsLeft / day) days remaining)"
        }
    }
    
    static func bnbHistoryTitle(_ bnbHistory:BnbHistory, _ myaddress:String) -> String {
        var resultMsg = NSLocalizedString("tx_known", comment: "")
        if (bnbHistory.txType == "NEW_ORDER") {
            resultMsg = NSLocalizedString("tx_new_order", comment: "")
            
        } else if (bnbHistory.txType == "CANCEL_ORDER") {
            resultMsg = NSLocalizedString("tx_cancel_order", comment: "")
            
        } else if (bnbHistory.txType == "TRANSFER") {
            if (bnbHistory.fromAddr == myaddress) {
                resultMsg = NSLocalizedString("tx_send", comment: "")
            } else {
                resultMsg = NSLocalizedString("tx_receive", comment: "")
            }
        } else if (bnbHistory.txType == "HTL_TRANSFER") {
            if (bnbHistory.fromAddr == myaddress) {
                resultMsg = NSLocalizedString("tx_send_htlc", comment: "")
            } else if (bnbHistory.toAddr == myaddress) {
                resultMsg = NSLocalizedString("tx_receive_htlc", comment: "")
            } else {
                resultMsg = NSLocalizedString("tx_create_htlc", comment: "")
            }
            
        } else if (bnbHistory.txType == "CLAIM_HTL") {
            resultMsg = NSLocalizedString("tx_claim_htlc", comment: "")
            
        } else if (bnbHistory.txType == "REFUND_HTL") {
            resultMsg = NSLocalizedString("tx_refund_htlc", comment: "")
        }
        return resultMsg
    }
    
    static func proposalType(_ type:String) -> String {
        if (type == IRIS_PROPOAL_TYPE_BasicProposal) {
            return NSLocalizedString("proposal_type_basic", comment: "")
            
        } else if (type == IRIS_PROPOAL_TYPE_ParameterProposal) {
            return NSLocalizedString("proposal_type_parameter", comment: "")
            
        } else if (type == IRIS_PROPOAL_TYPE_PlainTextProposal) {
            return NSLocalizedString("proposal_type_plaintext", comment: "")
                   
        } else if (type == IRIS_PROPOAL_TYPE_TokenAdditionProposal) {
            return NSLocalizedString("proposal_type_tokenaddition", comment: "")
                  
        } else if (type == IRIS_PROPOAL_TYPE_SoftwareUpgradeProposal) {
            return NSLocalizedString("proposal_type_softwareupgrade", comment: "")
                 
        } else if (type == IRIS_PROPOAL_TYPE_SystemHaltProposal) {
            return NSLocalizedString("proposal_type_systemhalt", comment: "")
                
        } else if (type == IRIS_PROPOAL_TYPE_CommunityTaxUsageProposal) {
            return NSLocalizedString("proposal_type_communitytaxusage", comment: "")
               
        }
        return ""
    }
    
    
    static func checkNAN(_ check: NSDecimalNumber) -> NSDecimalNumber{
        if(check.isEqual(to: NSDecimalNumber.notANumber)) {
            return NSDecimalNumber.zero
        }
        return check
    }
    
    static func decimalNumberToLocaleString(_ input: NSDecimalNumber, _ deciaml:Int16) -> String {
        let nf = NumberFormatter()
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = Int(deciaml)
        nf.numberStyle = .decimal
        nf.locale = Locale.current
        nf.groupingSeparator = ""
        return nf.string(from: input)!
    }
    
    static func localeStringToDecimal(_ input: String?) -> NSDecimalNumber {
        let result = NSDecimalNumber(string: input, locale: Locale.current)
        if (NSDecimalNumber.notANumber == result) {
            return NSDecimalNumber.zero
        } else {
            return result
        }
    }
    
    static func plainStringToDecimal(_ input: String?) -> NSDecimalNumber {
        if (input == nil) { return NSDecimalNumber.zero }
        let result = NSDecimalNumber(string: input)
        if (NSDecimalNumber.notANumber == result) {
            return NSDecimalNumber.zero
        } else {
            return result
        }
    }
    
    static func displayAmount2(_ amount: String?, _ font:UIFont, _ inputPoint:Int16, _ dpPoint:Int16) -> NSMutableAttributedString {
        let nf = NumberFormatter()
        nf.minimumFractionDigits = Int(dpPoint)
        nf.maximumFractionDigits = Int(dpPoint)
//        nf.maximumSignificantDigits = Int(dpPoint) - 1
//        nf.minimumSignificantDigits = Int(dpPoint) - 1
        nf.roundingMode = .floor
        nf.numberStyle = .decimal
        
        let amount = plainStringToDecimal(amount)
        var formatted: String?
        if (amount == NSDecimalNumber.zero) {
            formatted = nf.string(from: NSDecimalNumber.zero)
        } else {
            let calAmount = amount.multiplying(byPowerOf10: -Int16(inputPoint))
            formatted = nf.string(from: calAmount)
        }
        
        let added       = formatted
        let endIndex    = added!.index(added!.endIndex, offsetBy: -dpPoint)
        
        let preString   = added![..<endIndex]
        let postString  = added![endIndex...]
        
        let preAttrs = [NSAttributedString.Key.font : font]
        let postAttrs = [NSAttributedString.Key.font : font.withSize(CGFloat(Int(Double(font.pointSize) * 0.85)))]
        
        let attributedString1 = NSMutableAttributedString(string:String(preString), attributes:preAttrs as [NSAttributedString.Key : Any])
        let attributedString2 = NSMutableAttributedString(string:String(postString), attributes:postAttrs as [NSAttributedString.Key : Any])
        
        attributedString1.append(attributedString2)
        return attributedString1
    }
    
    static func getFormattedNumber(_ amount: NSDecimalNumber, _ dpPoint:Int16) -> String {
        let nf = NumberFormatter()
        nf.minimumFractionDigits = Int(dpPoint)
        nf.locale = Locale(identifier: "en_US")
        nf.numberStyle = .decimal
        
        let formatted = nf.string(from: amount)?.replacingOccurrences(of: ",", with: "" )
        return formatted!
    }
    
    static func availableAmount(_ balances:Array<Balance>, _ symbol:String) -> NSDecimalNumber {
        var amount = NSDecimalNumber.zero
        for balance in balances {
            if (balance.balance_denom == symbol) {
                amount = plainStringToDecimal(balance.balance_amount)
            }
        }
        return amount;
    }
    
    static func lockedAmount(_ balances:Array<Balance>, _ symbol:String) -> NSDecimalNumber {
        var amount = NSDecimalNumber.zero
        for balance in balances {
            if (balance.balance_denom == symbol) {
                amount = plainStringToDecimal(balance.balance_locked)
            }
        }
        return amount;
    }
    
    static func okDepositAmount(_ deposit: OkStaking?) -> NSDecimalNumber {
        return plainStringToDecimal(deposit?.tokens)
    }
    
    static func okWithdrawAmount(_ withdraw: OkUnbonding?) -> NSDecimalNumber {
        return plainStringToDecimal(withdraw?.quantity)
    }
    
    //price displaying
    static func tokenCnt(_ chainType: ChainType?) -> String {
        if (isGRPC(chainType)) {
            return String(BaseData.instance.mMyBalances_gRPC.count)
        } else {
            return String(BaseData.instance.mBalances.count)
        }
    }
    
    static func valueChange(_ denom: String) -> NSDecimalNumber {
        let baseData = BaseData.instance
        guard let coinPrice = baseData.getPrice(denom) else {
            return NSDecimalNumber.zero.rounding(accordingToBehavior: handler2Down)
        }
        return coinPrice.priceChange()
    }
    
    static func dpValueChange(_ denom: String, font:UIFont ) -> NSMutableAttributedString {
        let nf = getNumberFormatter(2)
        let formatted = nf.string(from: valueChange(denom))! + "% (24h)"
        return getDpAttributedString(formatted, 9, font)
    }
    
    static func perUsdValue(_ denom: String) -> NSDecimalNumber? {
        if (denom.contains("gamm/pool/")) {
            if let pool = BaseData.instance.getOsmoPoolByDenom(denom) {
                return WUtils.getOsmoLpTokenPerUsdPrice(pool)
            }
        }
        if (denom.starts(with: "pool") && denom.count >= 68) {
            if let pool = BaseData.instance.getParamGravityPoolByDenom(denom) {
                return WUtils.getParamGdexLpTokenPerUsdPrice(pool)
            }
        }
        if (denom == EMONEY_EUR_DENOM || denom == EMONEY_CHF_DENOM || denom == EMONEY_DKK_DENOM || denom == EMONEY_NOK_DENOM || denom == EMONEY_SEK_DENOM) {
            if let value = BaseData.instance.getPrice("usdt")?.prices.filter{ $0.currency == denom.substring(from: 1) }.first?.current_price {
                return NSDecimalNumber.one.dividing(by: NSDecimalNumber.init(value: value), withBehavior: handler18)
            }
        }
        if let coinPrice = BaseData.instance.getPrice(denom) {
            return coinPrice.currencyPrice("usd").rounding(accordingToBehavior: handler18)
        }
        return nil
    }
    
    static func usdValue(_ denom: String, _ amount: NSDecimalNumber, _ divider: Int16) -> NSDecimalNumber {
        if let perUsdValue = perUsdValue(denom) {
            return perUsdValue.multiplying(by: amount).multiplying(byPowerOf10: -divider, withBehavior: handler3Down)
        }
        return NSDecimalNumber.zero
    }
    
    static func perUserCurrencyValue(_ denom: String) -> NSDecimalNumber {
        let baseData = BaseData.instance
        guard let perUsdValue = perUsdValue(denom), let usdtPrice = baseData.getPrice("usdt") else {
            return NSDecimalNumber.zero.rounding(accordingToBehavior: handler3Down)
        }
        if (baseData.getCurrency() == 0) {
            return perUsdValue
        } else {
            let priceUSDT = usdtPrice.currencyPrice(baseData.getCurrencyString().lowercased())
            return perUsdValue.multiplying(by: priceUSDT, withBehavior: handler3Down)
        }
    }
    
    static func perBtcValue(_ denom: String) -> NSDecimalNumber {
        let baseData = BaseData.instance
        guard let perUsdValue = perUsdValue(denom), let usdtPrice = baseData.getPrice("usdt") else {
            return NSDecimalNumber.zero.rounding(accordingToBehavior: handler8)
        }
        let priceUSDT = usdtPrice.currencyPrice("btc")
        return perUsdValue.multiplying(by: priceUSDT, withBehavior: handler8)
    }
    
    
    static func dpPerUserCurrencyValue(_ denom: String, _ font:UIFont) -> NSMutableAttributedString {
        let nf = getNumberFormatter(3)
        let formatted = BaseData.instance.getCurrencySymbol() + " " + nf.string(from: perUserCurrencyValue(denom))!
        return getDpAttributedString(formatted, 3, font)
    }
    
    static func userCurrencyValue(_ denom: String, _ amount: NSDecimalNumber, _ divider: Int16) -> NSDecimalNumber {
        return perUserCurrencyValue(denom).multiplying(by: amount).multiplying(byPowerOf10: -divider, withBehavior: handler3Down)
    }
    
    static func dpUserCurrencyValue(_ denom: String, _ amount: NSDecimalNumber, _ divider: Int16, _ font:UIFont) -> NSMutableAttributedString {
        let nf = getNumberFormatter(3)
        let formatted = BaseData.instance.getCurrencySymbol() + " " + nf.string(from: userCurrencyValue(denom, amount, divider))!
        return getDpAttributedString(formatted, 3, font)
    }
    
    static func btcValue(_ denom: String, _ amount: NSDecimalNumber, _ divider: Int16) -> NSDecimalNumber {
        return perBtcValue(denom).multiplying(by: amount).multiplying(byPowerOf10: -divider, withBehavior: handler8)
    }
    
    static func allAssetToUserCurrency(_ chainType: ChainType?) -> NSDecimalNumber {
        let baseData = BaseData.instance
        var totalValue = NSDecimalNumber.zero
        if (isGRPC(chainType)) {
            baseData.mMyBalances_gRPC.forEach { coin in
                if (coin.denom == getMainDenom(chainType)) {
                    let amount = getAllMainAsset(coin.denom)
                    let assetValue = userCurrencyValue(coin.denom, amount, mainDivideDecimal(chainType))
                    totalValue = totalValue.adding(assetValue)
                    
                } else if (chainType == ChainType.OSMOSIS_MAIN && coin.denom == OSMOSIS_ION_DENOM) {
                    let amount = baseData.getAvailableAmount_gRPC(coin.denom)
                    let assetValue = userCurrencyValue(coin.denom, amount, 6)
                    totalValue = totalValue.adding(assetValue)
                    
                } else if (chainType! == ChainType.SIF_MAIN && coin.denom.starts(with: "c")) {
                    let available = baseData.getAvailableAmount_gRPC(coin.denom)
                    let decimal = getSifCoinDecimal(coin.denom)
                    if let bridgeTokenInfo = BaseData.instance.getBridge_gRPC(coin.denom) {
                        totalValue = totalValue.adding(userCurrencyValue(bridgeTokenInfo.origin_symbol!.lowercased(), available, decimal))
                    }
                    
                } else if (chainType! == ChainType.GRAVITY_BRIDGE_MAIN && coin.denom.starts(with: "gravity0x")) {
                    let available = baseData.getAvailableAmount_gRPC(coin.denom)
                    let decimal = getGBrdigeCoinDecimal(coin.denom)
                    if let bridgeTokenInfo = BaseData.instance.getBridge_gRPC(coin.denom) {
                        totalValue = totalValue.adding(userCurrencyValue(bridgeTokenInfo.origin_symbol!.lowercased(), available, decimal))
                    }
                    
                } else if (chainType! == ChainType.EMONEY_MAIN && coin.denom.starts(with: "e")) {
                    let available = baseData.getAvailableAmount_gRPC(coin.denom)
                    totalValue = totalValue.adding(userCurrencyValue(coin.denom, available, 6))
                    
                } else if (chainType == ChainType.OSMOSIS_MAIN && coin.denom.contains("gamm/pool/")) {
                    let amount = baseData.getAvailableAmount_gRPC(coin.denom)
                    let assetValue = userCurrencyValue(coin.denom, amount, 18)
                    totalValue = totalValue.adding(assetValue)
                    
                }  else if (chainType == ChainType.COSMOS_MAIN && coin.denom.starts(with: "pool") && coin.denom.count >= 68) {
                    let amount = baseData.getAvailableAmount_gRPC(coin.denom)
                    let assetValue = userCurrencyValue(coin.denom, amount, 6)
                    totalValue = totalValue.adding(assetValue)
                    
                } else if (chainType! == ChainType.KAVA_MAIN) {
                    let baseDenom = WUtils.getKavaBaseDenom(coin.denom)
                    let decimal = WUtils.getKavaCoinDecimal(coin.denom)
                    let amount = WUtils.getKavaTokenAll(coin.denom)
                    let assetValue = userCurrencyValue(baseDenom, amount, decimal)
                    totalValue = totalValue.adding(assetValue)
                    
                } else if (chainType! == ChainType.INJECTIVE_MAIN && coin.denom.starts(with: "peggy0x")) {
                    let available = baseData.getAvailableAmount_gRPC(coin.denom)
                    let decimal = getInjectiveCoinDecimal(coin.denom)
                    if let bridgeTokenInfo = BaseData.instance.getBridge_gRPC(coin.denom) {
                        totalValue = totalValue.adding(userCurrencyValue(bridgeTokenInfo.origin_symbol!.lowercased(), available, decimal))
                    }
                    
                }
                
                else if (coin.isIbc()) {
                    if let ibcToken = BaseData.instance.getIbcToken(coin.getIbcHash()) {
                        if (ibcToken.auth == true) {
                            let amount = baseData.getAvailableAmount_gRPC(coin.denom)
                            let assetValue = userCurrencyValue(ibcToken.base_denom!, amount, ibcToken.decimal!)
                            totalValue = totalValue.adding(assetValue)
                        }
                    }
                }
            }
            
            baseData.getCw20s_gRPC().forEach { cw20Token in
                let available = cw20Token.getAmount()
                let decimal = cw20Token.decimal
                totalValue = totalValue.adding(userCurrencyValue(cw20Token.denom, available, decimal))
            }
        }
        else if (chainType! == ChainType.BINANCE_MAIN) {
            baseData.mBalances.forEach { coin in
                var allBnb = NSDecimalNumber.zero
                let amount = WUtils.getAllBnbToken(coin.balance_denom)
                if (coin.balance_denom == getMainDenom(chainType)) {
                    allBnb = allBnb.adding(amount)
                } else {
                    allBnb = allBnb.adding(getBnbConvertAmount(coin.balance_denom))
                }
                let assetValue = userCurrencyValue(getMainDenom(chainType), allBnb, 0)
                totalValue = totalValue.adding(assetValue)
            }
            
        } else if (chainType! == ChainType.OKEX_MAIN) {
            baseData.mBalances.forEach { coin in
                var allOKT = NSDecimalNumber.zero
                if (coin.balance_denom == getMainDenom(chainType)) {
                    allOKT = allOKT.adding(getAllExToken(coin.balance_denom))
                } else {
                    allOKT = allOKT.adding(convertTokenToOkt(coin.balance_denom))
                }
                let assetValue = userCurrencyValue(getMainDenom(chainType), allOKT, 0)
                totalValue = totalValue.adding(assetValue)
            }
            
        }
        
        else {
            baseData.mBalances.forEach { coin in
                if (coin.balance_denom == getMainDenom(chainType)) {
                    let amount = getAllMainAssetOld(getMainDenom(chainType))
                    totalValue = totalValue.adding(userCurrencyValue(coin.balance_denom, amount, mainDivideDecimal(chainType)))
                }
            }
        }
        return totalValue
    }
    
    static func dpAllAssetValueUserCurrency(_ chainType: ChainType?, _ font:UIFont) -> NSMutableAttributedString {
        let totalValue = allAssetToUserCurrency(chainType)
        let nf = getNumberFormatter(3)
        let formatted = BaseData.instance.getCurrencySymbol() + " " + nf.string(from: totalValue)!
        return getDpAttributedString(formatted, 3, font)
    }
    
    static func getNumberFormatter(_ divider: Int) -> NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = divider
        nf.maximumFractionDigits = divider
        return nf
    }
    
    static func getDpAttributedString(_ dpString: String, _ divider: Int, _ font:UIFont)  -> NSMutableAttributedString {
        let endIndex    = dpString.index(dpString.endIndex, offsetBy: -divider)
        let preString   = dpString[..<endIndex]
        let postString  = dpString[endIndex...]
        let preAttrs    = [NSAttributedString.Key.font : font]
        let postAttrs   = [NSAttributedString.Key.font : font.withSize(CGFloat(Int(Double(font.pointSize) * 0.85)))]
        
        let attributedString1 = NSMutableAttributedString(string:String(preString), attributes:preAttrs as [NSAttributedString.Key : Any])
        let attributedString2 = NSMutableAttributedString(string:String(postString), attributes:postAttrs as [NSAttributedString.Key : Any])
        attributedString1.append(attributedString2)
        return attributedString1
    }
    
    
    static func displayGasRate(_ rate: NSDecimalNumber, font:UIFont, _ deciaml:Int) -> NSMutableAttributedString {
        let nf = NumberFormatter()
        nf.minimumFractionDigits = deciaml
        nf.maximumFractionDigits = deciaml
        nf.numberStyle = .decimal
        
        let formatted   = nf.string(from: rate)!
        let endIndex    = formatted.index(formatted.endIndex, offsetBy: -(deciaml))
        
        let preString   = formatted[..<endIndex]
        let postString  = formatted[endIndex...]
        
        let preAttrs = [NSAttributedString.Key.font : font]
        let postAttrs = [NSAttributedString.Key.font : font.withSize(CGFloat(Int(Double(font.pointSize) * 0.85)))]
        
        let attributedString1 = NSMutableAttributedString(string:String(preString), attributes:preAttrs as [NSAttributedString.Key : Any])
        let attributedString2 = NSMutableAttributedString(string:String(postString), attributes:postAttrs as [NSAttributedString.Key : Any])
        
        attributedString1.append(attributedString2)
        return attributedString1
    }
    
    static func displayGasRate2(_ rate: NSDecimalNumber, font:UIFont) -> NSMutableAttributedString {
        let nf = NumberFormatter()
        let deciaml = rate.stringValue.count - 2
        nf.minimumFractionDigits = deciaml
        nf.maximumFractionDigits = deciaml
        nf.numberStyle = .decimal
        
        let formatted   = nf.string(from: rate)!
        let endIndex    = formatted.index(formatted.endIndex, offsetBy: -(deciaml))
        
        let preString   = formatted[..<endIndex]
        let postString  = formatted[endIndex...]
        
        let preAttrs = [NSAttributedString.Key.font : font]
        let postAttrs = [NSAttributedString.Key.font : font.withSize(CGFloat(Int(Double(font.pointSize) * 0.85)))]
        
        let attributedString1 = NSMutableAttributedString(string:String(preString), attributes:preAttrs as [NSAttributedString.Key : Any])
        let attributedString2 = NSMutableAttributedString(string:String(postString), attributes:postAttrs as [NSAttributedString.Key : Any])
        
        attributedString1.append(attributedString2)
        return attributedString1
    }
    
    static func displayPriceUPdown(_ updown:NSDecimalNumber, font:UIFont ) -> NSMutableAttributedString {
        let nf = NumberFormatter()
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        nf.numberStyle = .decimal
        
        let formatted   = nf.string(from: updown.rounding(accordingToBehavior: handler2))! + "% (24h)"
        let endIndex    = formatted.index(formatted.endIndex, offsetBy: -9)
        
        let preString   = formatted[..<endIndex]
        let postString  = formatted[endIndex...]
        
        let preAttrs = [NSAttributedString.Key.font : font]
        let postAttrs = [NSAttributedString.Key.font : font.withSize(CGFloat(Int(Double(font.pointSize) * 0.85)))]
        
        let attributedString1 = NSMutableAttributedString(string:String(preString), attributes:preAttrs as [NSAttributedString.Key : Any])
        let attributedString2 = NSMutableAttributedString(string:String(postString), attributes:postAttrs as [NSAttributedString.Key : Any])
        
        attributedString1.append(attributedString2)
        return attributedString1
    }
    
    static func displayPercent(_ rate:NSDecimalNumber, _ font:UIFont ) -> NSMutableAttributedString {
        let nf = NumberFormatter()
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        nf.numberStyle = .decimal
        
        let formatted   = nf.string(from: rate.rounding(accordingToBehavior: handler2Down))! + "%"
        let endIndex    = formatted.index(formatted.endIndex, offsetBy: -3)
        
        let preString   = formatted[..<endIndex]
        let postString  = formatted[endIndex...]
        
        let preAttrs = [NSAttributedString.Key.font : font]
        let postAttrs = [NSAttributedString.Key.font : font.withSize(CGFloat(Int(Double(font.pointSize) * 0.85)))]
        
        let attributedString1 = NSMutableAttributedString(string:String(preString), attributes:preAttrs as [NSAttributedString.Key : Any])
        let attributedString2 = NSMutableAttributedString(string:String(postString), attributes:postAttrs as [NSAttributedString.Key : Any])
        
        attributedString1.append(attributedString2)
        return attributedString1
    }
    
    static func getDpEstAprCommission(_ font: UIFont, _ commission: NSDecimalNumber, _ chain: ChainType) -> NSMutableAttributedString {
        guard let param = BaseData.instance.mParam else {
            return displayPercent(NSDecimalNumber.zero, font)
        }
        let apr = param.getApr(chain)
        let calCommission = NSDecimalNumber.one.subtracting(commission)
        let aprCommission = apr.multiplying(by: calCommission, withBehavior: handler6).multiplying(byPowerOf10: 2)
        return displayPercent(aprCommission, font)
    }
    
    static func getDailyReward(_ font: UIFont, _ commission: NSDecimalNumber, _ delegated: NSDecimalNumber?, _ chain: ChainType) -> NSMutableAttributedString {
        guard let param = BaseData.instance.mParam, let bondingAmount = delegated else {
            return displayAmount2(NSDecimalNumber.zero.stringValue, font, mainDivideDecimal(chain), mainDivideDecimal(chain))
        }
        var apr = NSDecimalNumber.zero
        if (param.getRealApr(chain) == NSDecimalNumber.zero) { apr = param.getApr(chain) }
        else { apr = param.getRealApr(chain) }
        let calCommission = NSDecimalNumber.one.subtracting(commission)
        let aprCommission = apr.multiplying(by: calCommission, withBehavior: handler6)
        let dayReward = bondingAmount.multiplying(by: aprCommission).dividing(by: NSDecimalNumber.init(string: "365"), withBehavior: WUtils.handler0)
        return displayAmount2(dayReward.stringValue, font, mainDivideDecimal(chain), mainDivideDecimal(chain))
    }
    
    static func getMonthlyReward(_ font: UIFont, _ commission: NSDecimalNumber, _ delegated: NSDecimalNumber?, _ chain: ChainType) -> NSMutableAttributedString {
        guard let param = BaseData.instance.mParam, let bondingAmount = delegated else {
            return displayAmount2(NSDecimalNumber.zero.stringValue, font, mainDivideDecimal(chain), mainDivideDecimal(chain))
        }
        var apr = NSDecimalNumber.zero
        if (param.getRealApr(chain) == NSDecimalNumber.zero) { apr = param.getApr(chain) }
        else { apr = param.getRealApr(chain) }
        let calCommission = NSDecimalNumber.one.subtracting(commission)
        let aprCommission = apr.multiplying(by: calCommission, withBehavior: handler6)
        let dayReward = bondingAmount.multiplying(by: aprCommission).dividing(by: NSDecimalNumber.init(string: "12"), withBehavior: WUtils.handler0)
        return displayAmount2(dayReward.stringValue, font, mainDivideDecimal(chain), mainDivideDecimal(chain))
    }
    
    static func displayCommission(_ rate:String?, font:UIFont ) -> NSMutableAttributedString {
        let nf = NumberFormatter()
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        nf.numberStyle = .decimal
        
        let formatted   = nf.string(from: plainStringToDecimal(rate).multiplying(by: 100))! + "%"
        let endIndex    = formatted.index(formatted.endIndex, offsetBy: -3)
        
        let preString   = formatted[..<endIndex]
        let postString  = formatted[endIndex...]
        
        let preAttrs = [NSAttributedString.Key.font : font]
        let postAttrs = [NSAttributedString.Key.font : font.withSize(CGFloat(Int(Double(font.pointSize) * 0.85)))]
        
        let attributedString1 = NSMutableAttributedString(string:String(preString), attributes:preAttrs as [NSAttributedString.Key : Any])
        let attributedString2 = NSMutableAttributedString(string:String(postString), attributes:postAttrs as [NSAttributedString.Key : Any])
        
        attributedString1.append(attributedString2)
        return attributedString1
    }
    
    static func displaySelfBondRate(_ selfShare: String?, _ totalShare: String?, _ font:UIFont ) ->  NSMutableAttributedString {
        let nf = NumberFormatter()
        nf.minimumFractionDigits = 2
        nf.maximumFractionDigits = 2
        nf.numberStyle = .decimal
        
        let selfDecimal = plainStringToDecimal(selfShare)
        let totalDecimal = plainStringToDecimal(totalShare)
        
        var formatted = "0.00%"
        if (selfDecimal != NSDecimalNumber.zero && totalDecimal != NSDecimalNumber.zero) {
            formatted   = nf.string(from: selfDecimal.multiplying(by: 100).dividing(by: totalDecimal, withBehavior: handler2Down))! + "%"
        }
        let endIndex    = formatted.index(formatted.endIndex, offsetBy: -3)
        
        let preString   = formatted[..<endIndex]
        let postString  = formatted[endIndex...]
        
        let preAttrs = [NSAttributedString.Key.font : font]
        let postAttrs = [NSAttributedString.Key.font : font.withSize(CGFloat(Int(Double(font.pointSize) * 0.85)))]
        
        let attributedString1 = NSMutableAttributedString(string:String(preString), attributes:preAttrs as [NSAttributedString.Key : Any])
        let attributedString2 = NSMutableAttributedString(string:String(postString), attributes:postAttrs as [NSAttributedString.Key : Any])
        
        attributedString1.append(attributedString2)
        return attributedString1
    }
    
    static func getAllMainAsset(_ denom: String) -> NSDecimalNumber {
        var amount = NSDecimalNumber.zero
        let data = BaseData.instance
        for balance in data.mMyBalances_gRPC {
            if (balance.denom == denom) {
                amount = amount.adding(plainStringToDecimal(balance.amount))
            }
        }
        for balance in data.mMyVestings_gRPC {
            if (balance.denom == denom) {
                amount = amount.adding(plainStringToDecimal(balance.amount))
            }
        }
        for delegation in data.mMyDelegations_gRPC {
            amount = amount.adding(plainStringToDecimal(delegation.balance.amount))
        }
        for unbonding in data.mMyUnbondings_gRPC {
            for entry in unbonding.entries {
                amount = amount.adding(plainStringToDecimal(entry.balance))
            }
        }
        for reward in data.mMyReward_gRPC {
            for coin in reward.reward {
                if (coin.denom == denom) {
                    amount = amount.adding(plainStringToDecimal(coin.amount).multiplying(byPowerOf10: -18))
                }
            }
        }
        return amount
    }
    
    static func getAllMainAssetOld(_ denom: String) -> NSDecimalNumber {
        let available = BaseData.instance.availableAmount(denom)
        let lock = BaseData.instance.lockedAmount(denom)
        let delegated = BaseData.instance.delegatedSumAmount()
        let unbonding = BaseData.instance.unbondingSumAmount()
        let reward = BaseData.instance.rewardAmount(denom)
        
        return available.adding(lock).adding(delegated).adding(unbonding).adding(reward)
    }
    
    static func getAllExToken(_ symbol: String) -> NSDecimalNumber {
        let dataBase = BaseData.instance
        if (symbol == OKEX_MAIN_DENOM) {
            return dataBase.availableAmount(symbol).adding(dataBase.lockedAmount(symbol)).adding(dataBase.okDepositAmount()).adding(dataBase.okWithdrawAmount())
        } else {
            return dataBase.availableAmount(symbol).adding(dataBase.lockedAmount(symbol))
        }
    }
    
    static func getAllBnbToken(_ symbol: String) -> NSDecimalNumber {
        let dataBase = BaseData.instance
        return dataBase.availableAmount(symbol).adding(dataBase.frozenAmount(symbol)).adding(dataBase.lockedAmount(symbol))
    }
    
    static func getOkexTokenDollorValue(_ okToken: OkToken?, _ amount: NSDecimalNumber) -> NSDecimalNumber {
        if (okToken == nil) { return NSDecimalNumber.zero }
        if (okToken!.original_symbol == "usdt" || okToken!.original_symbol == "usdc" || okToken!.original_symbol == "usdk") {
            return amount
            
        } else if (okToken!.original_symbol == "okb" && BaseData.instance.mOKBPrice != nil) {
            return amount.multiplying(by: BaseData.instance.mOKBPrice)
            
        } else if (BaseData.instance.mOkTickerList != nil) {
            //TODO display with ticker update!
            let okTickers = BaseData.instance.mOkTickerList?.data
            return NSDecimalNumber.zero
        }
        return NSDecimalNumber.zero
    }
    
    static func convertTokenToOkt(_ denom: String) -> NSDecimalNumber {
        let baseData = BaseData.instance
        let okToken = getOkToken(denom)
        let tokenAmount = baseData.availableAmount(denom).adding(baseData.lockedAmount(denom))
        let totalTokenValue = getOkexTokenDollorValue(okToken, tokenAmount)
        if let okTUsd = perUsdValue(OKEX_MAIN_DENOM) {
            return totalTokenValue.dividing(by: okTUsd, withBehavior: handler18)
        }
        return NSDecimalNumber.zero
    }
    
    static func getBnbToken(_ symbol: String?) -> BnbToken? {
        return BaseData.instance.mBnbTokenList.filter{ $0.symbol == symbol }.first
    }
    
    static func getBnbTokenTic(_ symbol: String?) -> BnbTicker? {
        return BaseData.instance.mBnbTokenTicker.filter { $0.symbol == getBnbTicSymbol(symbol!)}.first
    }
    
    static func getBnbConvertAmount(_ symbol: String) -> NSDecimalNumber {
        if let ticker = getBnbTokenTic(symbol) {
            let amount = getAllBnbToken(symbol)
            if (isBnbMarketToken(symbol)) {
                return amount.dividing(by: ticker.getLastPrice(), withBehavior: WUtils.handler8)
            } else {
                return amount.multiplying(by: ticker.getLastPrice(), withBehavior: WUtils.handler8)
            }
        }
        return NSDecimalNumber.zero
    }
    
    static func getBnbTokenUserCurrencyPrice(_ symbol: String) -> NSDecimalNumber {
        if let bnbTicker = getBnbTokenTic(symbol) {
            if (isBnbMarketToken(symbol)) {
                let perPrice = (NSDecimalNumber.one).dividing(by: bnbTicker.getLastPrice(), withBehavior: WUtils.handler8)
                return perPrice.multiplying(by: perUserCurrencyValue(BNB_MAIN_DENOM))
            } else {
                let perPrice = (NSDecimalNumber.one).multiplying(by: bnbTicker.getLastPrice(), withBehavior: WUtils.handler8)
                return perPrice.multiplying(by: perUserCurrencyValue(BNB_MAIN_DENOM))
            }
        }
        return NSDecimalNumber.zero
    }
    
    static func dpBnbTokenUserCurrencyPrice(_ symbol: String, _ font:UIFont) -> NSMutableAttributedString {
        let nf = getNumberFormatter(3)
        let formatted = BaseData.instance.getCurrencySymbol() + " " + nf.string(from: getBnbTokenUserCurrencyPrice(symbol))!
        return getDpAttributedString(formatted, 3, font)
    }
    
    
    
    static func getBnbMainToken(_ bnbTokens:Array<BnbToken>) -> BnbToken? {
        for bnbToken in bnbTokens {
            if (bnbToken.symbol == BNB_MAIN_DENOM) {
                return bnbToken
            }
        }
        return nil
    }
    
    static func getOkToken(_ symbol:String?) -> OkToken? {
        return BaseData.instance.mOkTokenList?.data?.filter { $0.symbol == symbol}.first
    }
    
    static func getTokenAmount(_ balances:Array<Balance>?, _ symbol:String) -> NSDecimalNumber {
        var result = NSDecimalNumber.zero
        if (balances != nil) {
            balances!.forEach({ (balance) in
                if (balance.balance_denom.caseInsensitiveCompare(symbol) == .orderedSame) {
                    result = result.adding(WUtils.plainStringToDecimal(balance.balance_amount))
                }
            })
        }
        return result
    }
    
    static func getDelegableAmount(_ balances:Array<Balance>?, _ symbol:String) -> NSDecimalNumber {
        var result = NSDecimalNumber.zero
        if (balances != nil) {
            balances!.forEach({ (balance) in
                if (balance.balance_denom.caseInsensitiveCompare(symbol) == .orderedSame) {
                    result = result.adding(WUtils.plainStringToDecimal(balance.balance_amount))
                    result = result.adding(WUtils.plainStringToDecimal(balance.balance_locked))
                }
            })
        }
        return result
    }
    
    static func showBNBTxDp(_ coin:Coin, _ denomLabel:UILabel, _ amountLabel:UILabel, _ chainType:ChainType) {
        if (coin.denom == BNB_MAIN_DENOM) {
            WUtils.setDenomTitle(chainType, denomLabel)
        } else {
            denomLabel.textColor = .white
            denomLabel.text = coin.denom.uppercased()
        }
        amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 8, 8)
    }
    
    static func showCoinDp(_ coin: Coin, _ denomLabel: UILabel?, _ amountLabel: UILabel, _ chainType: ChainType) {
        if (isGRPC(chainType) && coin.isIbc()) {
            if let ibcToken = BaseData.instance.getIbcToken(coin.getIbcHash()) {
                if (ibcToken.auth == true) {
                    denomLabel?.textColor = .white
                    denomLabel?.text = ibcToken.display_denom!.uppercased()
                    amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, ibcToken.decimal!, ibcToken.decimal!)
                    return
                    
                } else {
                    denomLabel?.textColor = .white
                    denomLabel?.text = "Unknown"
                    amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
                    return
                }
                
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = "Unknown"
                amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
                return
            }
            
        } else if (chainType == ChainType.COSMOS_MAIN || chainType == ChainType.COSMOS_TEST) {
            if (coin.denom == COSMOS_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else if (coin.denom.starts(with: "pool")) {
                denomLabel?.textColor = .white
                if let poolInfo = BaseData.instance.getGravityPoolByDenom(coin.denom)  {
                    denomLabel?.text = "GDEX-" + String(poolInfo.id)
                } else {
                    denomLabel?.text = "UnKnown"
                }
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.IRIS_MAIN) {
            if (coin.denom == IRIS_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.BINANCE_MAIN) {
            if (coin.denom == BNB_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 0, 8)
            
        } else if (chainType == ChainType.KAVA_MAIN) {
            if (coin.denom == KAVA_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else if (coin.denom == KAVA_HARD_DENOM) {
                denomLabel?.textColor = COLOR_HARD
                denomLabel?.text = coin.denom.uppercased()
            } else if (coin.denom  == KAVA_USDX_DENOM) {
                denomLabel?.textColor = COLOR_USDX
                denomLabel?.text = coin.denom.uppercased()
            } else if (coin.denom  == KAVA_SWAP_DENOM) {
                denomLabel?.textColor = COLOR_SWP
                denomLabel?.text = coin.denom.uppercased()
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, getKavaCoinDecimal(coin.denom), getKavaCoinDecimal(coin.denom))
            
        } else if (chainType == ChainType.BAND_MAIN) {
            if (coin.denom == BAND_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.SECRET_MAIN) {
            if (coin.denom == SECRET_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.IOV_MAIN) {
            if (coin.denom == IOV_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.CERTIK_MAIN) {
            if (coin.denom == CERTIK_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.OKEX_MAIN) {
            if (coin.denom == OKEX_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 0, 18)
            
        } else if (chainType == ChainType.AKASH_MAIN) {
            if (coin.denom == AKASH_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.PERSIS_MAIN) {
            if (coin.denom == PERSIS_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.SENTINEL_MAIN) {
            if (coin.denom == SENTINEL_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.FETCH_MAIN) {
            if (coin.denom == FETCH_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 18, 18)
            
        } else if (chainType == ChainType.CRYPTO_MAIN) {
            if (coin.denom == CRYPTO_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 8, 8)
            
        } else if (chainType == ChainType.SIF_MAIN) {
            let dpDecimal = WUtils.getSifCoinDecimal(coin.denom)
            if (coin.denom == SIF_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else if (coin.denom.starts(with: "c")) {
                denomLabel?.textColor = .white
                if let bridgeTokenInfo = BaseData.instance.getBridge_gRPC(coin.denom) {
                    denomLabel?.text = bridgeTokenInfo.origin_symbol
                } else {
                    denomLabel?.text = coin.denom.substring(from: 1).uppercased()
                }
                
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, dpDecimal, dpDecimal)
            
        } else if (chainType == ChainType.KI_MAIN) {
            if (coin.denom == KI_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.OSMOSIS_MAIN) {
            if (coin.denom == OSMOSIS_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
                amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            } else if (coin.denom == OSMOSIS_ION_DENOM) {
                denomLabel?.textColor = COLOR_ION
                denomLabel?.text = "ION"
                amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            } else if (coin.isOsmosisAmm()) {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.isOsmosisAmmDpDenom()
                amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 18, 18)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
                amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            }
            
        } else if (chainType == ChainType.IRIS_TEST) {
            if (coin.denom == IRIS_TEST_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.RIZON_MAIN) {
            if (coin.denom == RIZON_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.MEDI_MAIN) {
            if (coin.denom == MEDI_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.ALTHEA_MAIN || chainType == ChainType.ALTHEA_TEST) {
            if (coin.denom == ALTHEA_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.UMEE_MAIN) {
            if (coin.denom == UMEE_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.AXELAR_MAIN) {
            if (coin.denom == AXELAR_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.EMONEY_MAIN) {
            if (coin.denom == EMONEY_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else if (coin.denom.starts(with: "e")) {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.JUNO_MAIN) {
            if (coin.denom == JUNO_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.REGEN_MAIN) {
            if (coin.denom == REGNE_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.BITCANA_MAIN) {
            if (coin.denom == BITCANA_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.GRAVITY_BRIDGE_MAIN) {
            let dpDecimal = WUtils.getGBrdigeCoinDecimal(coin.denom)
            if (coin.denom == GRAVITY_BRIDGE_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else if (coin.denom.starts(with: "gravity0x")) {
                denomLabel?.textColor = .white
                if let bridgeTokenInfo = BaseData.instance.getBridge_gRPC(coin.denom) {
                    denomLabel?.text = bridgeTokenInfo.origin_symbol
                } else {
                    denomLabel?.text = coin.denom.uppercased()
                }
                
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, dpDecimal, dpDecimal)
            
        } else if (chainType == ChainType.STARGAZE_MAIN) {
            if (coin.denom == STARGAZE_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.COMDEX_MAIN) {
            if (coin.denom == COMDEX_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.INJECTIVE_MAIN) {
            let dpDecimal = WUtils.getInjectiveCoinDecimal(coin.denom)
            if (coin.denom == INJECTIVE_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else if (coin.denom.starts(with: "peggy0x")) {
                denomLabel?.textColor = .white
                if let bridgeTokenInfo = BaseData.instance.getBridge_gRPC(coin.denom) {
                    denomLabel?.text = bridgeTokenInfo.origin_symbol
                } else {
                    denomLabel?.text = coin.denom.uppercased()
                }
                
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, dpDecimal, dpDecimal)
            
        } else if (chainType == ChainType.BITSONG_MAIN) {
            if (coin.denom == BITSONG_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.DESMOS_MAIN) {
            if (coin.denom == DESMOS_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.LUM_MAIN) {
            if (coin.denom == LUM_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.CHIHUAHUA_MAIN) {
            if (coin.denom == CHIHUAHUA_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.KONSTELLATION_MAIN) {
            if (coin.denom == KONSTELLATION_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.EVMOS_MAIN) {
            if (coin.denom == EVMOS_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 18, 18)
            
        } else if (chainType == ChainType.PROVENANCE_MAIN) {
            if (coin.denom == PROVENANCE_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = coin.denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(coin.amount, amountLabel.font, 9, 9)
            
        }
    }
    
    static func showCoinDp(_ denom:String, _ amount:String, _ denomLabel:UILabel?, _ amountLabel:UILabel, _ chainType:ChainType) {
        if (isGRPC(chainType) && denom.starts(with: "ibc/")) {
            if let ibcToken = BaseData.instance.getIbcToken(denom.replacingOccurrences(of: "ibc/", with: "")) {
                if (ibcToken.auth == true) {
                    denomLabel?.textColor = .white
                    denomLabel?.text = ibcToken.display_denom?.uppercased()
                    amountLabel.attributedText = displayAmount2(amount, amountLabel.font, ibcToken.decimal!, ibcToken.decimal!)
                    return
                    
                } else {
                    denomLabel?.textColor = .white
                    denomLabel?.text = "Unknown"
                    amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
                    return
                }
                
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = "Unknown"
                amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
                return
            }
            
        } else if (chainType == ChainType.COSMOS_MAIN || chainType == ChainType.COSMOS_TEST) {
            if (denom == COSMOS_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else if (denom.starts(with: "pool")) {
                denomLabel?.textColor = .white
                if let poolInfo = BaseData.instance.getGravityPoolByDenom(denom)  {
                    denomLabel?.text = "GDEX-" + String(poolInfo.id)
                } else {
                    denomLabel?.text = "UnKnown"
                }
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.IRIS_MAIN) {
            if (denom == IRIS_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.BINANCE_MAIN) {
            if (denom == BNB_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 0, 8)
            
        } else if (chainType == ChainType.KAVA_MAIN) {
            if (denom == KAVA_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else if (denom == KAVA_HARD_DENOM) {
                denomLabel?.textColor = COLOR_HARD
                denomLabel?.text = denom.uppercased()
            } else if (denom == KAVA_USDX_DENOM) {
                denomLabel?.textColor = COLOR_USDX
                denomLabel?.text = denom.uppercased()
            } else if (denom == KAVA_SWAP_DENOM) {
                denomLabel?.textColor = COLOR_SWP
                denomLabel?.text = denom.uppercased()
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, getKavaCoinDecimal(denom), getKavaCoinDecimal(denom))
            
        } else if (chainType == ChainType.BAND_MAIN) {
            if (denom == BAND_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.SECRET_MAIN) {
            if (denom == SECRET_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.IOV_MAIN) {
            if (denom == IOV_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.CERTIK_MAIN) {
            if (denom == CERTIK_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.OKEX_MAIN) {
            if (denom == OKEX_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 0, 18)
            
        } else if (chainType == ChainType.AKASH_MAIN) {
            if (denom == AKASH_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.PERSIS_MAIN) {
            if (denom == PERSIS_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.SENTINEL_MAIN) {
            if (denom == SENTINEL_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.FETCH_MAIN) {
            if (denom == FETCH_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 18, 18)
            
        } else if (chainType == ChainType.CRYPTO_MAIN) {
            if (denom == CRYPTO_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 8, 8)
            
        } else if (chainType == ChainType.SIF_MAIN) {
            let dpDecimal = WUtils.getSifCoinDecimal(denom)
            if (denom == SIF_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else if (denom.starts(with: "c")) {
                denomLabel?.textColor = .white
                if let bridgeTokenInfo = BaseData.instance.getBridge_gRPC(denom) {
                    denomLabel?.text = bridgeTokenInfo.origin_symbol
                } else {
                    denomLabel?.text = denom.substring(from: 1).uppercased()
                }
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, dpDecimal, dpDecimal)
            
        } else if (chainType == ChainType.KI_MAIN) {
            if (denom == KI_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.OSMOSIS_MAIN) {
            if (denom == OSMOSIS_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
                amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            } else if (denom == OSMOSIS_ION_DENOM) {
                denomLabel?.textColor = COLOR_ION
                denomLabel?.text = "ION"
                amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            } else if (denom.starts(with: "gamm/pool/")) {
                denomLabel?.textColor = .white
                denomLabel?.text = "GAMM-" + String(denom.split(separator: "/").last!)
                amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 18, 18)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
                amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            }
            
        } else if (chainType == ChainType.IRIS_TEST) {
            if (denom == IRIS_TEST_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.RIZON_MAIN) {
            if (denom == RIZON_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.MEDI_MAIN) {
            if (denom == MEDI_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.ALTHEA_MAIN || chainType == ChainType.ALTHEA_TEST) {
            if (denom == ALTHEA_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.UMEE_MAIN) {
            if (denom == UMEE_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.AXELAR_MAIN) {
            if (denom == AXELAR_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.EMONEY_MAIN) {
            if (denom == EMONEY_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else if (denom.starts(with: "e")) {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.substring(from: 1).uppercased()
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.JUNO_MAIN) {
            if (denom == JUNO_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.REGEN_MAIN) {
            if (denom == REGNE_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.BITCANA_MAIN) {
            if (denom == BITCANA_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.GRAVITY_BRIDGE_MAIN) {
            let dpDecimal = WUtils.getGBrdigeCoinDecimal(denom)
            if (denom == GRAVITY_BRIDGE_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else if (denom.starts(with: "gravity0x")) {
                denomLabel?.textColor = .white
                if let bridgeTokenInfo = BaseData.instance.getBridge_gRPC(denom) {
                    denomLabel?.text = bridgeTokenInfo.origin_symbol
                } else {
                    denomLabel?.text = denom.uppercased()
                }
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, dpDecimal, dpDecimal)
            
        } else if (chainType == ChainType.STARGAZE_MAIN) {
            if (denom == STARGAZE_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.COMDEX_MAIN) {
            if (denom == COMDEX_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.INJECTIVE_MAIN) {
            let dpDecimal = WUtils.getInjectiveCoinDecimal(denom)
            if (denom == INJECTIVE_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else if (denom.starts(with: "peggy0x")) {
                denomLabel?.textColor = .white
                if let bridgeTokenInfo = BaseData.instance.getBridge_gRPC(denom) {
                    denomLabel?.text = bridgeTokenInfo.origin_symbol
                } else {
                    denomLabel?.text = denom.uppercased()
                }
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, dpDecimal, dpDecimal)
            
        } else if (chainType == ChainType.BITSONG_MAIN) {
            if (denom == BITSONG_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.DESMOS_MAIN) {
            if (denom == DESMOS_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.LUM_MAIN) {
            if (denom == LUM_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.CHIHUAHUA_MAIN) {
            if (denom == CHIHUAHUA_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.KONSTELLATION_MAIN) {
            if (denom == KONSTELLATION_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 6, 6)
            
        } else if (chainType == ChainType.EVMOS_MAIN) {
            if (denom == EVMOS_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 18, 18)
            
        } else if (chainType == ChainType.PROVENANCE_MAIN) {
            if (denom == PROVENANCE_MAIN_DENOM) {
                WUtils.setDenomTitle(chainType, denomLabel)
            } else {
                denomLabel?.textColor = .white
                denomLabel?.text = denom.uppercased()
            }
            amountLabel.attributedText = displayAmount2(amount, amountLabel.font, 9, 9)
            
        }
            
    }
    
    static func isBnbMarketToken(_ symbol:String?) ->Bool {
        switch symbol {
        case "USDT.B-B7C":
            return true
        case "ETH.B-261":
            return true
        case "BTC.B-918":
            return true
        case "USDSB-1AC":
            return true
        case "THKDB-888":
            return true
        case "TUSDB-888":
            return true
        case "BTCB-1DE":
            return true
            
        case "ETH-1C9":
            return true
        case "BUSD-BD1":
            return true
        case "IDRTB-178":
            return true
        case "TAUDB-888":
            return true
            
        default:
            return false
        }
    }
    
    static func getBnbTicSymbol(_ symbol:String) -> String {
        if (isBnbMarketToken(symbol)) {
            return BNB_MAIN_DENOM + "_" + symbol
        } else {
            return  "" + symbol + "_" + BNB_MAIN_DENOM
        }
    }
    
    static func getChainColor(_ chain:ChainType?) -> UIColor {
        if (chain == ChainType.COSMOS_MAIN || chain == ChainType.COSMOS_TEST) {
            return COLOR_ATOM
        } else if (chain == ChainType.IRIS_MAIN || chain == ChainType.IRIS_TEST) {
            return COLOR_IRIS
        } else if (chain == ChainType.BINANCE_MAIN) {
            return COLOR_BNB
        } else if (chain == ChainType.KAVA_MAIN) {
            return COLOR_KAVA
        } else if (chain == ChainType.IOV_MAIN) {
            return COLOR_IOV
        } else if (chain == ChainType.BAND_MAIN) {
            return COLOR_BAND
        } else if (chain == ChainType.SECRET_MAIN) {
            return COLOR_SECRET
        } else if (chain == ChainType.CERTIK_MAIN) {
            return COLOR_CERTIK
        } else if (chain == ChainType.OKEX_MAIN) {
            return COLOR_OK
        } else if (chain == ChainType.AKASH_MAIN) {
            return COLOR_AKASH
        } else if (chain == ChainType.PERSIS_MAIN) {
            return COLOR_PERSIS
        } else if (chain == ChainType.SENTINEL_MAIN) {
            return COLOR_SENTINEL
        } else if (chain == ChainType.FETCH_MAIN) {
            return COLOR_FETCH
        } else if (chain == ChainType.CRYPTO_MAIN) {
            return COLOR_CRYPTO
        } else if (chain == ChainType.SIF_MAIN) {
            return COLOR_SIF
        } else if (chain == ChainType.KI_MAIN) {
            return COLOR_KI
        } else if (chain == ChainType.OSMOSIS_MAIN) {
            return COLOR_OSMOSIS
        } else if (chain == ChainType.RIZON_MAIN) {
            return COLOR_RIZON
        } else if (chain == ChainType.MEDI_MAIN) {
            return COLOR_MEDI
        } else if (chain == ChainType.ALTHEA_MAIN || chain == ChainType.ALTHEA_TEST) {
            return COLOR_ALTHEA
        } else if (chain == ChainType.UMEE_MAIN) {
            return COLOR_UMEE
        } else if (chain == ChainType.AXELAR_MAIN) {
            return COLOR_AXELAR
        } else if (chain == ChainType.EMONEY_MAIN) {
            return COLOR_EMONEY
        } else if (chain == ChainType.JUNO_MAIN) {
            return COLOR_JUNO
        } else if (chain == ChainType.REGEN_MAIN) {
            return COLOR_REGEN
        } else if (chain == ChainType.BITCANA_MAIN) {
            return COLOR_BITCANNA
        } else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) {
            return COLOR_GRAVITY_BRIDGE
        } else if (chain == ChainType.STARGAZE_MAIN) {
            return COLOR_STARGAZE
        } else if (chain == ChainType.COMDEX_MAIN) {
            return COLOR_COMDEX
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            return COLOR_INJECTIVE
        } else if (chain == ChainType.BITSONG_MAIN) {
            return COLOR_BITSONG
        } else if (chain == ChainType.DESMOS_MAIN) {
            return COLOR_DESMOS
        } else if (chain == ChainType.LUM_MAIN) {
            return COLOR_LUM
        } else if (chain == ChainType.CHIHUAHUA_MAIN) {
            return COLOR_CHIHUAHUA
        } else if (chain == ChainType.KONSTELLATION_MAIN) {
            return COLOR_KONSTELLATION
        } else if (chain == ChainType.EVMOS_MAIN) {
            return COLOR_EVMOS
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            return COLOR_PROVENANCE
        }
        return COLOR_DARK_GRAY
    }
    
    static func getChainDarkColor(_ chain:ChainType?) -> UIColor {
        if (chain == ChainType.COSMOS_MAIN || chain == ChainType.COSMOS_TEST ) {
            return COLOR_ATOM_DARK
        } else if (chain == ChainType.IRIS_MAIN || chain == ChainType.IRIS_TEST) {
            return COLOR_IRIS_DARK
        } else if (chain == ChainType.BINANCE_MAIN) {
            return COLOR_BNB_DARK
        } else if (chain == ChainType.KAVA_MAIN) {
            return COLOR_KAVA_DARK
        } else if (chain == ChainType.IOV_MAIN) {
            return COLOR_IOV_DARK
        } else if (chain == ChainType.BAND_MAIN) {
            return COLOR_BAND_DARK
        } else if (chain == ChainType.SECRET_MAIN) {
            return COLOR_SECRET_DARK
        } else if (chain == ChainType.CERTIK_MAIN) {
            return COLOR_CERTIK_DARK
        } else if (chain == ChainType.AKASH_MAIN) {
            return COLOR_AKASH_DARK
        } else if (chain == ChainType.OKEX_MAIN) {
            return COLOR_OK_DARK
        } else if (chain == ChainType.PERSIS_MAIN) {
            return COLOR_PERSIS_DARK
        } else if (chain == ChainType.SENTINEL_MAIN) {
            return COLOR_SENTINEL_DARK
        } else if (chain == ChainType.FETCH_MAIN) {
            return COLOR_FETCH_DARK
        } else if (chain == ChainType.CRYPTO_MAIN) {
            return COLOR_CRYPTO_DARK
        } else if (chain == ChainType.SIF_MAIN) {
            return COLOR_SIF_DARK
        } else if (chain == ChainType.KI_MAIN) {
            return COLOR_KI_DARK
        } else if (chain == ChainType.OSMOSIS_MAIN) {
            return COLOR_OSMOSIS_DARK
        } else if (chain == ChainType.RIZON_MAIN) {
            return COLOR_RIZON_DARK
        } else if (chain == ChainType.MEDI_MAIN) {
            return COLOR_MEDI_DARK
        } else if (chain == ChainType.ALTHEA_MAIN || chain == ChainType.ALTHEA_TEST) {
            return COLOR_ALTHEA_DARK
        } else if (chain == ChainType.UMEE_MAIN) {
            return COLOR_UMEE_DARK
        } else if (chain == ChainType.AXELAR_MAIN) {
            return COLOR_AXELAR_DARK
        } else if (chain == ChainType.EMONEY_MAIN) {
            return COLOR_EMONEY_DARK
        } else if (chain == ChainType.JUNO_MAIN) {
            return COLOR_JUNO_DARK
        } else if (chain == ChainType.REGEN_MAIN) {
            return COLOR_REGEN_DARK
        } else if (chain == ChainType.BITCANA_MAIN) {
            return COLOR_BITCANNA_DARK
        } else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) {
            return COLOR_GRAVITY_BRIDGE_DARK
        } else if (chain == ChainType.STARGAZE_MAIN) {
            return COLOR_STARGAZE_DARK
        } else if (chain == ChainType.COMDEX_MAIN) {
            return COLOR_COMDEX_DARK
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            return COLOR_INJECTIVE_DARK
        } else if (chain == ChainType.BITSONG_MAIN) {
            return COLOR_BITSONG_DARK
        } else if (chain == ChainType.DESMOS_MAIN) {
            return COLOR_DESMOS_DARK
        } else if (chain == ChainType.LUM_MAIN) {
            return COLOR_LUM_DARK
        } else if (chain == ChainType.CHIHUAHUA_MAIN) {
            return COLOR_CHIHUAHUA_DARK
        } else if (chain == ChainType.KONSTELLATION_MAIN) {
            return COLOR_KONSTELLATION_DARK
        } else if (chain == ChainType.EVMOS_MAIN) {
            return COLOR_EVMOS_DARK
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            return COLOR_PROVENANCE_DARK
        }
        return COLOR_DARK_GRAY
    }
    
    static func getChainBg(_ chain:ChainType?) -> UIColor {
        if (chain == ChainType.COSMOS_MAIN || chain == ChainType.COSMOS_TEST) {
            return TRANS_BG_COLOR_COSMOS
        } else if (chain == ChainType.IRIS_MAIN || chain == ChainType.IRIS_TEST) {
            return TRANS_BG_COLOR_IRIS
        } else if (chain == ChainType.BINANCE_MAIN) {
            return TRANS_BG_COLOR_BNB
        } else if (chain == ChainType.KAVA_MAIN) {
            return TRANS_BG_COLOR_KAVA
        } else if (chain == ChainType.IOV_MAIN) {
            return TRANS_BG_COLOR_IOV
        } else if (chain == ChainType.BAND_MAIN) {
            return TRANS_BG_COLOR_BAND
        } else if (chain == ChainType.SECRET_MAIN) {
            return TRANS_BG_COLOR_SECRET
        } else if (chain == ChainType.CERTIK_MAIN) {
            return TRANS_BG_COLOR_CERTIK
        } else if (chain == ChainType.AKASH_MAIN) {
            return TRANS_BG_COLOR_AKASH
        } else if (chain == ChainType.OKEX_MAIN) {
            return TRANS_BG_COLOR_OK
        } else if (chain == ChainType.PERSIS_MAIN) {
            return TRANS_BG_COLOR_PERSIS
        } else if (chain == ChainType.SENTINEL_MAIN) {
            return TRANS_BG_COLOR_SENTINEL
        } else if (chain == ChainType.FETCH_MAIN) {
            return TRANS_BG_COLOR_FETCH
        } else if (chain == ChainType.CRYPTO_MAIN) {
            return TRANS_BG_COLOR_CRYPTO
        } else if (chain == ChainType.SIF_MAIN) {
            return TRANS_BG_COLOR_SIF
        } else if (chain == ChainType.KI_MAIN) {
            return TRANS_BG_COLOR_KI
        } else if (chain == ChainType.OSMOSIS_MAIN) {
            return TRANS_BG_COLOR_OSMOSIS
        } else if (chain == ChainType.RIZON_MAIN) {
            return TRANS_BG_COLOR_RIZON
        } else if (chain == ChainType.MEDI_MAIN) {
            return TRANS_BG_COLOR_MEDI
        } else if (chain == ChainType.ALTHEA_MAIN || chain == ChainType.ALTHEA_TEST) {
            return TRANS_BG_COLOR_ALTHEA
        } else if (chain == ChainType.UMEE_MAIN) {
            return TRANS_BG_COLOR_UMEE
        } else if (chain == ChainType.AXELAR_MAIN) {
            return TRANS_BG_COLOR_AXELAR
        } else if (chain == ChainType.EMONEY_MAIN) {
            return TRANS_BG_COLOR_EMONEY
        } else if (chain == ChainType.JUNO_MAIN) {
            return TRANS_BG_COLOR_JUNO
        } else if (chain == ChainType.REGEN_MAIN) {
            return TRANS_BG_COLOR_REGEN
        } else if (chain == ChainType.BITCANA_MAIN) {
            return TRANS_BG_COLOR_BITCANNA
        } else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) {
            return TRANS_BG_COLOR_GRAVITY_BRIDGE
        } else if (chain == ChainType.STARGAZE_MAIN) {
            return TRANS_BG_COLOR_STARGAZE
        } else if (chain == ChainType.COMDEX_MAIN) {
            return TRANS_BG_COLOR_COMDEX
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            return TRANS_BG_COLOR_INJECTIVE
        } else if (chain == ChainType.BITSONG_MAIN) {
            return TRANS_BG_COLOR_BITSONG
        } else if (chain == ChainType.DESMOS_MAIN) {
            return TRANS_BG_COLOR_DESMOS
        } else if (chain == ChainType.LUM_MAIN) {
            return TRANS_BG_COLOR_LUM
        } else if (chain == ChainType.CHIHUAHUA_MAIN) {
            return TRANS_BG_COLOR_CHIHUAHUA
        } else if (chain == ChainType.KONSTELLATION_MAIN) {
            return TRANS_BG_COLOR_KONSTELLATION
        } else if (chain == ChainType.EVMOS_MAIN) {
            return TRANS_BG_COLOR_EVMOS
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            return TRANS_BG_COLOR_PROVENANCE
        }
        return COLOR_BG_GRAY
    }
    
    static func getDpMainDenom(_ chain:ChainType) -> String {
        if (chain == ChainType.COSMOS_MAIN) {
            return "ATOM"
        } else if (chain == ChainType.IRIS_MAIN) {
            return "IRIS"
        } else if (chain == ChainType.BINANCE_MAIN) {
            return "BNB"
        } else if (chain == ChainType.KAVA_MAIN) {
            return "KAVA"
        } else if (chain == ChainType.IOV_MAIN) {
            return "IOV"
        } else if (chain == ChainType.BAND_MAIN) {
            return "BAND"
        } else if (chain == ChainType.SECRET_MAIN) {
            return "SCRT"
        } else if (chain == ChainType.OKEX_MAIN) {
            return "OKT"
        } else if (chain == ChainType.CERTIK_MAIN) {
            return "CTK"
        } else if (chain == ChainType.AKASH_MAIN) {
            return "AKT"
        } else if (chain == ChainType.PERSIS_MAIN) {
            return "XPRT"
        } else if (chain == ChainType.SENTINEL_MAIN) {
            return "DVPN"
        } else if (chain == ChainType.FETCH_MAIN) {
            return "FET"
        } else if (chain == ChainType.CRYPTO_MAIN) {
            return "CRO"
        } else if (chain == ChainType.SIF_MAIN) {
            return "ROWAN"
        } else if (chain == ChainType.KI_MAIN) {
            return "XKI"
        } else if (chain == ChainType.OSMOSIS_MAIN) {
            return "OSMO"
        } else if (chain == ChainType.MEDI_MAIN) {
            return "MED"
        } else if (chain == ChainType.COSMOS_TEST) {
            return "MUON"
        } else if (chain == ChainType.IRIS_TEST) {
            return "BIF"
        } else if (chain == ChainType.RIZON_MAIN) {
            return "ATOLO"
        } else if (chain == ChainType.ALTHEA_MAIN || chain == ChainType.ALTHEA_TEST) {
            return "ALTG"
        } else if (chain == ChainType.UMEE_MAIN) {
            return "UMEE"
        } else if (chain == ChainType.AXELAR_MAIN) {
            return "AXL"
        } else if (chain == ChainType.EMONEY_MAIN) {
            return "NGM"
        } else if (chain == ChainType.JUNO_MAIN) {
            return "JUNO"
        } else if (chain == ChainType.REGEN_MAIN) {
            return "REGEN"
        } else if (chain == ChainType.BITCANA_MAIN) {
            return "BCNA"
        } else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) {
            return "GRAVITON"
        } else if (chain == ChainType.STARGAZE_MAIN) {
            return "STARS"
        } else if (chain == ChainType.COMDEX_MAIN) {
            return "CMDX"
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            return "INJ"
        } else if (chain == ChainType.BITSONG_MAIN) {
            return "BTSG"
        } else if (chain == ChainType.DESMOS_MAIN) {
            return "DSM"
        } else if (chain == ChainType.LUM_MAIN) {
            return "LUM"
        } else if (chain == ChainType.CHIHUAHUA_MAIN) {
            return "HUAHUA"
        } else if (chain == ChainType.KONSTELLATION_MAIN) {
            return "DARC"
        } else if (chain == ChainType.EVMOS_MAIN) {
            return "EVMOS"
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            return "HASH"
        }
        return ""
    }
    
    static func getMainDenom(_ chain:ChainType?) -> String {
        if (chain == ChainType.COSMOS_MAIN) {
            return COSMOS_MAIN_DENOM
        } else if (chain == ChainType.IRIS_MAIN) {
            return IRIS_MAIN_DENOM
        } else if (chain == ChainType.BINANCE_MAIN) {
            return BNB_MAIN_DENOM
        } else if (chain == ChainType.KAVA_MAIN) {
            return KAVA_MAIN_DENOM
        } else if (chain == ChainType.IOV_MAIN ) {
            return IOV_MAIN_DENOM
        } else if (chain == ChainType.BAND_MAIN) {
            return BAND_MAIN_DENOM
        } else if (chain == ChainType.SECRET_MAIN) {
            return SECRET_MAIN_DENOM
        } else if (chain == ChainType.OKEX_MAIN) {
            return OKEX_MAIN_DENOM
        } else if (chain == ChainType.CERTIK_MAIN) {
            return CERTIK_MAIN_DENOM
        } else if (chain == ChainType.AKASH_MAIN) {
            return AKASH_MAIN_DENOM
        } else if (chain == ChainType.PERSIS_MAIN) {
            return PERSIS_MAIN_DENOM
        } else if (chain == ChainType.SENTINEL_MAIN) {
            return SENTINEL_MAIN_DENOM
        } else if (chain == ChainType.FETCH_MAIN) {
            return FETCH_MAIN_DENOM
        } else if (chain == ChainType.CRYPTO_MAIN) {
            return CRYPTO_MAIN_DENOM
        } else if (chain == ChainType.SIF_MAIN) {
            return SIF_MAIN_DENOM
        } else if (chain == ChainType.KI_MAIN) {
            return KI_MAIN_DENOM
        } else if (chain == ChainType.OSMOSIS_MAIN) {
            return OSMOSIS_MAIN_DENOM
        } else if (chain == ChainType.MEDI_MAIN) {
            return MEDI_MAIN_DENOM
        } else if (chain == ChainType.EMONEY_MAIN) {
            return EMONEY_MAIN_DENOM
        } else if (chain == ChainType.RIZON_MAIN) {
            return RIZON_MAIN_DENOM
        } else if (chain == ChainType.JUNO_MAIN) {
            return JUNO_MAIN_DENOM
        } else if (chain == ChainType.REGEN_MAIN) {
            return REGNE_MAIN_DENOM
        } else if (chain == ChainType.BITCANA_MAIN) {
            return BITCANA_MAIN_DENOM
        } else if (chain == ChainType.ALTHEA_MAIN || chain == ChainType.ALTHEA_TEST) {
            return ALTHEA_MAIN_DENOM
        } else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) {
            return GRAVITY_BRIDGE_MAIN_DENOM
        } else if (chain == ChainType.STARGAZE_MAIN) {
            return STARGAZE_MAIN_DENOM
        } else if (chain == ChainType.COMDEX_MAIN) {
            return COMDEX_MAIN_DENOM
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            return INJECTIVE_MAIN_DENOM
        } else if (chain == ChainType.BITSONG_MAIN) {
            return BITSONG_MAIN_DENOM
        } else if (chain == ChainType.DESMOS_MAIN) {
            return DESMOS_MAIN_DENOM
        } else if (chain == ChainType.LUM_MAIN) {
            return LUM_MAIN_DENOM
        } else if (chain == ChainType.CHIHUAHUA_MAIN) {
            return CHIHUAHUA_MAIN_DENOM
        } else if (chain == ChainType.AXELAR_MAIN) {
            return AXELAR_MAIN_DENOM
        } else if (chain == ChainType.KONSTELLATION_MAIN) {
            return KONSTELLATION_MAIN_DENOM
        } else if (chain == ChainType.UMEE_MAIN) {
            return UMEE_MAIN_DENOM
        } else if (chain == ChainType.EVMOS_MAIN) {
            return EVMOS_MAIN_DENOM
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            return PROVENANCE_MAIN_DENOM
        }
        
        else if (chain == ChainType.COSMOS_TEST) {
            return COSMOS_TEST_DENOM
        } else if (chain == ChainType.IRIS_TEST) {
            return IRIS_TEST_DENOM
        }
        return ""

    }
    
    static func tokenDivideDecimal(_ chain: ChainType?, _ denom: String) -> Int16 {
        let mainDenom = getMainDenom(chain)
        if (isGRPC(chain)) {
            if (denom == mainDenom) {
                return mainDivideDecimal(chain)
            }
            if (denom.starts(with: "ibc/")) {
                if let ibcToken = BaseData.instance.getIbcToken(denom.replacingOccurrences(of: "ibc/", with: "")), let decimal = ibcToken.decimal  {
                    return decimal
                }
                return 6
            }
            if (chain == ChainType.COSMOS_MAIN) {
                return getCosmosCoinDecimal(denom)
            } else if (chain == ChainType.OSMOSIS_MAIN) {
                return getOsmosisCoinDecimal(denom)
            } else if (chain == ChainType.SIF_MAIN) {
                return getSifCoinDecimal(denom)
            } else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) {
                return getGBrdigeCoinDecimal(denom)
            } else if (chain == ChainType.KAVA_MAIN) {
                return getKavaCoinDecimal(denom)
            } else if (chain == ChainType.INJECTIVE_MAIN) {
                return getInjectiveCoinDecimal(denom)
            }
            print("CHECK DECIMAL")
            return 6
            
        } else {
            //NO need without gRPC
            return 6
        }
    }
    
    static func mainDivideDecimal(_ chain:ChainType?) -> Int16 {
        if (chain == ChainType.BINANCE_MAIN) {
            return 0
        } else if (chain == ChainType.OKEX_MAIN) {
            return 0
        } else if (chain == ChainType.FETCH_MAIN || chain == ChainType.SIF_MAIN || chain == ChainType.INJECTIVE_MAIN || chain == ChainType.EVMOS_MAIN) {
            return 18
        } else if (chain == ChainType.CRYPTO_MAIN) {
            return 8
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            return 9
        } else {
            return 6
        }
    }
    
    static func mainDisplayDecimal(_ chain:ChainType?) -> Int16 {
        if (chain == ChainType.BINANCE_MAIN) {
            return 8
        } else if (chain == ChainType.OKEX_MAIN) {
            return 18
        } else if (chain == ChainType.FETCH_MAIN || chain == ChainType.SIF_MAIN || chain == ChainType.INJECTIVE_MAIN || chain == ChainType.EVMOS_MAIN) {
            return 18
        } else if (chain == ChainType.CRYPTO_MAIN) {
            return 8
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            return 9
        } else {
            return 6
        }
    }
    
    static func setDenomTitle(_ chain: ChainType?, _ label: UILabel?) {
        if (chain == ChainType.COSMOS_MAIN) {
            label?.text = "ATOM"
            label?.textColor = COLOR_ATOM
        } else if (chain == ChainType.IRIS_MAIN) {
            label?.text = "IRIS"
            label?.textColor = COLOR_IRIS
        } else if (chain == ChainType.BINANCE_MAIN) {
            label?.text = "BNB"
            label?.textColor = COLOR_BNB
        } else if (chain == ChainType.KAVA_MAIN) {
            label?.text = "KAVA"
            label?.textColor = COLOR_KAVA
        } else if (chain == ChainType.IOV_MAIN) {
            label?.text = "IOV"
            label?.textColor = COLOR_IOV
        } else if (chain == ChainType.BAND_MAIN) {
            label?.text = "BAND"
            label?.textColor = COLOR_BAND
        } else if (chain == ChainType.SECRET_MAIN) {
            label?.text = "SCRT"
            label?.textColor = COLOR_SECRET
        } else if (chain == ChainType.OKEX_MAIN) {
            label?.text = "OKT"
            label?.textColor = COLOR_OK
        } else if (chain == ChainType.CERTIK_MAIN) {
            label?.text = "CTK"
            label?.textColor = COLOR_CERTIK
        } else if (chain == ChainType.AKASH_MAIN) {
            label?.text = "AKT"
            label?.textColor = COLOR_AKASH
        } else if (chain == ChainType.PERSIS_MAIN) {
            label?.text = "XPRT"
            label?.textColor = COLOR_PERSIS
        } else if (chain == ChainType.SENTINEL_MAIN) {
            label?.text = "DVPN"
            label?.textColor = COLOR_SENTINEL
        } else if (chain == ChainType.FETCH_MAIN) {
            label?.text = "FET"
            label?.textColor = COLOR_FETCH
        } else if (chain == ChainType.CRYPTO_MAIN) {
            label?.text = "CRO"
            label?.textColor = COLOR_CRYPTO
        } else if (chain == ChainType.SIF_MAIN) {
            label?.text = "ROWAN"
            label?.textColor = COLOR_SIF
        } else if (chain == ChainType.KI_MAIN) {
            label?.text = "XKI"
            label?.textColor = COLOR_KI
        } else if (chain == ChainType.OSMOSIS_MAIN) {
            label?.text = "OSMO"
            label?.textColor = COLOR_OSMOSIS
        } else if (chain == ChainType.COSMOS_TEST) {
            label?.text = "MUON"
            label?.textColor = COLOR_ATOM
        } else if (chain == ChainType.IRIS_TEST) {
            label?.text = "BIF"
            label?.textColor = COLOR_IRIS
        } else if (chain == ChainType.RIZON_MAIN) {
            label?.text = "ATOLO"
            label?.textColor = COLOR_RIZON
        } else if (chain == ChainType.MEDI_MAIN) {
            label?.text = "MED"
            label?.textColor = COLOR_MEDI
        } else if (chain == ChainType.ALTHEA_MAIN || chain == ChainType.ALTHEA_TEST) {
            label?.text = "ALTG"
            label?.textColor = COLOR_ALTHEA
        } else if (chain == ChainType.UMEE_MAIN) {
            label?.text = "UMEE"
            label?.textColor = COLOR_UMEE
        } else if (chain == ChainType.AXELAR_MAIN) {
            label?.text = "AXL"
            label?.textColor = COLOR_AXELAR
        } else if (chain == ChainType.EMONEY_MAIN) {
            label?.text = "NGM"
            label?.textColor = COLOR_EMONEY
        } else if (chain == ChainType.JUNO_MAIN) {
            label?.text = "JUNO"
            label?.textColor = COLOR_JUNO
        } else if (chain == ChainType.REGEN_MAIN) {
            label?.text = "REGEN"
            label?.textColor = COLOR_REGEN
        } else if (chain == ChainType.BITCANA_MAIN) {
            label?.text = "BCNA"
            label?.textColor = COLOR_BITCANNA
        } else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) {
            label?.text = "GRAVITON"
            label?.textColor = COLOR_GRAVITY_BRIDGE
        } else if (chain == ChainType.STARGAZE_MAIN) {
            label?.text = "STARS"
            label?.textColor = COLOR_STARGAZE
        } else if (chain == ChainType.COMDEX_MAIN) {
            label?.text = "CMDX"
            label?.textColor = COLOR_COMDEX
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            label?.text = "INJ"
            label?.textColor = COLOR_INJECTIVE
        } else if (chain == ChainType.BITSONG_MAIN) {
            label?.text = "BTSG"
            label?.textColor = COLOR_BITSONG
        } else if (chain == ChainType.DESMOS_MAIN) {
            label?.text = "DSM"
            label?.textColor = COLOR_DESMOS
        } else if (chain == ChainType.LUM_MAIN) {
            label?.text = "LUM"
            label?.textColor = COLOR_LUM
        } else if (chain == ChainType.CHIHUAHUA_MAIN) {
            label?.text = "HUAHUA"
            label?.textColor = COLOR_CHIHUAHUA
        } else if (chain == ChainType.KONSTELLATION_MAIN) {
            label?.text = "DARC"
            label?.textColor = COLOR_KONSTELLATION
        } else if (chain == ChainType.EVMOS_MAIN) {
            label?.text = "EVMOS"
            label?.textColor = COLOR_EVMOS
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            label?.text = "HASH"
            label?.textColor = COLOR_PROVENANCE
        }
    }
    
    static func getChainType(_ chainS:String) -> ChainType? {
        if (chainS == CHAIN_COSMOS_S ) {
            return ChainType.COSMOS_MAIN
        } else if (chainS == CHAIN_IRIS_S) {
            return ChainType.IRIS_MAIN
        } else if (chainS == CHAIN_BINANCE_S) {
            return ChainType.BINANCE_MAIN
        } else if (chainS == CHAIN_KAVA_S) {
           return ChainType.KAVA_MAIN
        } else if (chainS == CHAIN_IOV_S) {
            return ChainType.IOV_MAIN
        } else if (chainS == CHAIN_BAND_S) {
            return ChainType.BAND_MAIN
        } else if (chainS == CHAIN_SECRET_S) {
            return ChainType.SECRET_MAIN
        } else if (chainS == CHAIN_CERTIK_S) {
            return ChainType.CERTIK_MAIN
        } else if (chainS == CHAIN_AKASH_S) {
            return ChainType.AKASH_MAIN
        } else if (chainS == CHAIN_OKEX_S) {
            return ChainType.OKEX_MAIN
        } else if (chainS == CHAIN_PERSIS_S) {
            return ChainType.PERSIS_MAIN
        } else if (chainS == CHAIN_SENTINEL_S) {
            return ChainType.SENTINEL_MAIN
        } else if (chainS == CHAIN_FETCH_S) {
            return ChainType.FETCH_MAIN
        } else if (chainS == CHAIN_CRYPTO_S) {
            return ChainType.CRYPTO_MAIN
        } else if (chainS == CHAIN_SIF_S) {
            return ChainType.SIF_MAIN
        } else if (chainS == CHAIN_KI_S) {
            return ChainType.KI_MAIN
        } else if (chainS == CHAIN_OSMOSIS_S) {
            return ChainType.OSMOSIS_MAIN
        } else if (chainS == CHAIN_MEDI_S) {
            return ChainType.MEDI_MAIN
        } else if (chainS == CHAIN_EMONEY_S) {
            return ChainType.EMONEY_MAIN
        } else if (chainS == CHAIN_RIZON_S) {
            return ChainType.RIZON_MAIN
        } else if (chainS == CHAIN_JUNO_S) {
            return ChainType.JUNO_MAIN
        } else if (chainS == CHAIN_REGEN_S) {
            return ChainType.REGEN_MAIN
        } else if (chainS == CHAIN_BITCANA_S) {
            return ChainType.BITCANA_MAIN
        } else if (chainS == CHAIN_ALTHEA_S) {
            return ChainType.ALTHEA_MAIN
        } else if (chainS == CHAIN_GRAVITY_BRIDGE_S) {
            return ChainType.GRAVITY_BRIDGE_MAIN
        } else if (chainS == CHAIN_STARGAZE_S) {
            return ChainType.STARGAZE_MAIN
        } else if (chainS == CHAIN_COMDEX_S) {
            return ChainType.COMDEX_MAIN
        } else if (chainS == CHAIN_INJECTIVE_S) {
            return ChainType.INJECTIVE_MAIN
        } else if (chainS == CHAIN_BITSONG_S) {
            return ChainType.BITSONG_MAIN
        } else if (chainS == CHAIN_DESMOS_S) {
            return ChainType.DESMOS_MAIN
        } else if (chainS == CHAIN_LUM_S) {
            return ChainType.LUM_MAIN
        } else if (chainS == CHAIN_CHIHUAHUA_S) {
            return ChainType.CHIHUAHUA_MAIN
        } else if (chainS == CHAIN_AXELAR_S) {
            return ChainType.AXELAR_MAIN
        } else if (chainS == CHAIN_KONSTELLATION_S) {
            return ChainType.KONSTELLATION_MAIN
        } else if (chainS == CHAIN_UMEE_S) {
            return ChainType.UMEE_MAIN
        } else if (chainS == CHAIN_EVMOS_S) {
            return ChainType.EVMOS_MAIN
        } else if (chainS == CHAIN_PROVENANCE_S) {
            return ChainType.PROVENANCE_MAIN
        }
        
        else if (chainS == CHAIN_COSMOS_TEST_S) {
            return ChainType.COSMOS_TEST
        } else if (chainS == CHAIN_IRIS_TEST_S) {
            return ChainType.IRIS_TEST
        } else if (chainS == CHAIN_ALTHEA_TEST_S) {
            return ChainType.ALTHEA_TEST
        }
        return nil
    }
    
    static func getChainDBName(_ chain:ChainType?) -> String {
        if (chain == ChainType.COSMOS_MAIN) {
            return CHAIN_COSMOS_S
        } else if (chain == ChainType.IRIS_MAIN) {
            return CHAIN_IRIS_S
        } else if (chain == ChainType.BINANCE_MAIN) {
            return CHAIN_BINANCE_S
        } else if (chain == ChainType.KAVA_MAIN) {
            return CHAIN_KAVA_S
        } else if (chain == ChainType.IOV_MAIN) {
            return CHAIN_IOV_S
        } else if (chain == ChainType.BAND_MAIN) {
            return CHAIN_BAND_S
        } else if (chain == ChainType.SECRET_MAIN) {
            return CHAIN_SECRET_S
        } else if (chain == ChainType.CERTIK_MAIN) {
            return CHAIN_CERTIK_S
        } else if (chain == ChainType.AKASH_MAIN) {
            return CHAIN_AKASH_S
        } else if (chain == ChainType.OKEX_MAIN) {
            return CHAIN_OKEX_S
        } else if (chain == ChainType.PERSIS_MAIN) {
            return CHAIN_PERSIS_S
        } else if (chain == ChainType.SENTINEL_MAIN) {
            return CHAIN_SENTINEL_S
        } else if (chain == ChainType.FETCH_MAIN) {
            return CHAIN_FETCH_S
        } else if (chain == ChainType.CRYPTO_MAIN) {
            return CHAIN_CRYPTO_S
        } else if (chain == ChainType.SIF_MAIN) {
            return CHAIN_SIF_S
        } else if (chain == ChainType.KI_MAIN) {
            return CHAIN_KI_S
        } else if (chain == ChainType.OSMOSIS_MAIN) {
            return CHAIN_OSMOSIS_S
        } else if (chain == ChainType.MEDI_MAIN) {
            return CHAIN_MEDI_S
        } else if (chain == ChainType.EMONEY_MAIN) {
            return CHAIN_EMONEY_S
        } else if (chain == ChainType.RIZON_MAIN) {
            return CHAIN_RIZON_S
        } else if (chain == ChainType.JUNO_MAIN) {
            return CHAIN_JUNO_S
        } else if (chain == ChainType.REGEN_MAIN) {
            return CHAIN_REGEN_S
        } else if (chain == ChainType.BITCANA_MAIN) {
            return CHAIN_BITCANA_S
        } else if (chain == ChainType.ALTHEA_MAIN) {
            return CHAIN_ALTHEA_S
        } else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) {
            return CHAIN_GRAVITY_BRIDGE_S
        } else if (chain == ChainType.STARGAZE_MAIN) {
            return CHAIN_STARGAZE_S
        } else if (chain == ChainType.COMDEX_MAIN) {
            return CHAIN_COMDEX_S
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            return CHAIN_INJECTIVE_S
        } else if (chain == ChainType.BITSONG_MAIN) {
            return CHAIN_BITSONG_S
        } else if (chain == ChainType.DESMOS_MAIN) {
            return CHAIN_DESMOS_S
        } else if (chain == ChainType.LUM_MAIN) {
            return CHAIN_LUM_S
        } else if (chain == ChainType.CHIHUAHUA_MAIN) {
            return CHAIN_CHIHUAHUA_S
        } else if (chain == ChainType.AXELAR_MAIN) {
            return CHAIN_AXELAR_S
        } else if (chain == ChainType.KONSTELLATION_MAIN) {
            return CHAIN_KONSTELLATION_S
        } else if (chain == ChainType.UMEE_MAIN) {
            return CHAIN_UMEE_S
        } else if (chain == ChainType.EVMOS_MAIN) {
            return CHAIN_EVMOS_S
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            return CHAIN_PROVENANCE_S
        }
        
        else if (chain == ChainType.COSMOS_TEST) {
            return CHAIN_COSMOS_TEST_S
        } else if (chain == ChainType.IRIS_TEST) {
            return CHAIN_IRIS_TEST_S
        } else if (chain == ChainType.ALTHEA_TEST) {
            return CHAIN_ALTHEA_TEST_S
        }
        return ""
    }
    
    static func getChainCustomPathS(_ chain: ChainType, _ newBip: Bool, _ customPath: Int, _ endPath: Int) -> String {
        if (chain == ChainType.BINANCE_MAIN) {
            return BNB_BASE_PATH + String(endPath)
        } else if (chain == ChainType.IOV_MAIN) {
            return IOV_BASE_PATH + String(endPath)
        } else if (chain == ChainType.BAND_MAIN) {
            return BAND_BASE_PATH + String(endPath)
        } else if (chain == ChainType.OKEX_MAIN) {
            return OK_BASE_PATH + String(endPath)
        } else if (chain == ChainType.PERSIS_MAIN) {
            return PERSIS_BASE_PATH + String(endPath)
        } else if (chain == ChainType.CRYPTO_MAIN) {
            return CRYPTO_BASE_PATH + String(endPath)
        } else if (chain == ChainType.MEDI_MAIN) {
            return MEDI_BASE_PATH + String(endPath)
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            return ETH_NON_LEDGER_PATH + String(endPath)
        } else if (chain == ChainType.BITSONG_MAIN) {
            return BITSONG_BASE_PATH + String(endPath)
        } else if (chain == ChainType.DESMOS_MAIN) {
            return DESMOS_BASE_PATH + String(endPath)
        } else if (chain == ChainType.EVMOS_MAIN) {
            return ETH_NON_LEDGER_PATH + String(endPath)
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            return PROVENANCE_BASE_PATH + String(endPath)
        }
        
        else if (chain == ChainType.KAVA_MAIN) {
            if (newBip) {
                return KAVA_BASE_PATH + String(endPath)
            } else {
                return BASE_PATH + String(endPath)
            }
            
        } else if (chain == ChainType.SECRET_MAIN) {
            if (newBip) {
                return BASE_PATH + String(endPath)
            } else {
                return SECRET_BASE_PATH + String(endPath)
            }
            
        } else if (chain == ChainType.FETCH_MAIN) {
            if (customPath == 1) {
                return ETH_NON_LEDGER_PATH + String(endPath)
                
            } else if (customPath == 2) {
                return ETH_LEDGER_LIVE_PATH_1 + String(endPath) + ETH_LEDGER_LIVE_PATH_2
                
            } else if (customPath == 3) {
                return ETH_LEDGER_LEGACY_PATH + String(endPath)
                
            } else {
                return BASE_PATH + String(endPath)
            }
            
        } else if (chain == ChainType.LUM_MAIN) {
            if (newBip) {
                return LUM_BASE_PATH + String(endPath)
            } else {
                return BASE_PATH + String(endPath)
            }
            
        }
        return BASE_PATH + String(endPath)
    }
    
    
    
    static func getChainTypeInt(_ chainS:String) -> Int {
        if (chainS == CHAIN_COSMOS_S ) {
            return 1
        } else if (chainS == CHAIN_IRIS_S) {
            return 2
        } else if (chainS == CHAIN_BINANCE_S) {
            return 3
        }
        return 0
    }
    
    static func getMonikerName(_ validators: Array<Validator>,  _ opAddr: String?, _ bracket:Bool) -> String {
        for val in validators {
            if (val.operator_address == opAddr) {
                if (bracket) {
                    return "(" + val.description.moniker + ")"
                } else {
                    return val.description.moniker
                }
            }
        }
        return ""
    }
    
    static func clearBackgroundColor(of view: UIView) {
        if let effectsView = view as? UIVisualEffectView {
            effectsView.removeFromSuperview()
            return
        }
        view.backgroundColor = .clear
        view.subviews.forEach { (subview) in
            self.clearBackgroundColor(of: subview)
        }
    }
    
    
    
    static func getPasswordAni() -> CAAnimation{
        let transition:CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromTop
        return transition
    }
    

    static func getEstimateGasAmount(_ chain:ChainType, _ type:String,  _ valCnt:Int) -> NSDecimalNumber {
        var result = NSDecimalNumber.zero
        if (chain == ChainType.COSMOS_MAIN || chain == ChainType.IRIS_MAIN || chain == ChainType.AKASH_MAIN ||
            chain == ChainType.PERSIS_MAIN || chain == ChainType.CRYPTO_MAIN || chain == ChainType.EMONEY_MAIN ||
            chain == ChainType.RIZON_MAIN || chain == ChainType.JUNO_MAIN || chain == ChainType.REGEN_MAIN ||
            chain == ChainType.BITCANA_MAIN || chain == ChainType.STARGAZE_MAIN || chain == ChainType.COMDEX_MAIN ||
            chain == ChainType.BITSONG_MAIN || chain == ChainType.DESMOS_MAIN || chain == ChainType.GRAVITY_BRIDGE_MAIN ||
            chain == ChainType.LUM_MAIN || chain == ChainType.AXELAR_MAIN || chain == ChainType.KONSTELLATION_MAIN ||
            chain == ChainType.UMEE_MAIN || chain == ChainType.PROVENANCE_MAIN || chain == ChainType.EVMOS_MAIN ||
            chain == ChainType.COSMOS_TEST || chain == ChainType.IRIS_TEST || chain == ChainType.ALTHEA_TEST) {
            if (type == COSMOS_MSG_TYPE_TRANSFER2) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_LOW))
            } else if (type == COSMOS_MSG_TYPE_DELEGATE) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_MID))
            } else if (type == COSMOS_MSG_TYPE_UNDELEGATE2) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_MID))
            } else if (type == COSMOS_MSG_TYPE_REDELEGATE2) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_HIGH))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_DEL) {
                result = getGasAmountForRewards()[valCnt - 1]
            } else if (type == COSMOS_MULTI_MSG_TYPE_REINVEST) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_HIGH))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_MIDIFY) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_LOW))
            } else if (type == TASK_TYPE_VOTE) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_LOW))
            } else if (type == LIQUIDITY_MSG_TYPE_SWAP) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_COSMOS_SWAP))
            } else if (type == LIQUIDITY_MSG_TYPE_JOIN_POOL) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_COSMOS_JOIN_POOL))
            } else if (type == LIQUIDITY_MSG_TYPE_EXIT_POOL) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_COSMOS_EXIT_POOL))
            } else if (type == TASK_IBC_TRANSFER) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_IBC_SEND))
            } else if (type == TASK_ISSUE_NFT) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_HIGH))
            } else if (type == TASK_SEND_NFT) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_MID))
            } else if (type == TASK_ISSUE_NFT_DENOM) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_MID))
            } else if (type == TASK_GEN_PROFILE || type == TASK_LINK_CHAIN_ACCOUNT) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_PROFILE))
            } else if (type == TASK_CW20_TRANSFER) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_IBC_SEND))
            }
            
        } else if (chain == ChainType.OSMOSIS_MAIN ) {
            if (type == COSMOS_MSG_TYPE_TRANSFER2) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_LOW))
            } else if (type == COSMOS_MSG_TYPE_DELEGATE) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_MID))
            } else if (type == COSMOS_MSG_TYPE_UNDELEGATE2) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_MID))
            } else if (type == COSMOS_MSG_TYPE_REDELEGATE2) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_HIGH))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_DEL) {
                result = getGasAmountForRewards()[valCnt - 1]
            } else if (type == COSMOS_MULTI_MSG_TYPE_REINVEST) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_HIGH))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_MIDIFY) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_LOW))
            } else if (type == TASK_TYPE_VOTE) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_LOW))
            } else if (type == OSMOSIS_MSG_TYPE_SWAP) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_OSMOS_SWAP))
            } else if (type == OSMOSIS_MSG_TYPE_JOIN_POOL) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_OSMOS_JOIN_POOL))
            } else if (type == OSMOSIS_MSG_TYPE_EXIT_POOL) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_OSMOS_EXIT_POOL))
            } else if (type == OSMOSIS_MSG_TYPE_LOCK) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_OSMOS_LOCK))
            } else if (type == OSMOSIS_MSG_TYPE_BEGIN_UNLCOK) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_OSMOS_BEGIN_UNBONDING))
            } else if (type == OSMOSIS_MSG_TYPE_PERIOD_UNLOCK) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_OSMOS_UNLOCK))
            } else if (type == TASK_IBC_TRANSFER) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_IBC_SEND))
            }
        }
        
        else if (chain == ChainType.KAVA_MAIN) {
            if (type == COSMOS_MSG_TYPE_TRANSFER2) {
                result = NSDecimalNumber.init(string: String(KAVA_GAS_AMOUNT_SEND))
            } else if (type == COSMOS_MSG_TYPE_DELEGATE) {
                result = NSDecimalNumber.init(string: String(KAVA_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_UNDELEGATE2) {
                result = NSDecimalNumber.init(string: String(KAVA_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_REDELEGATE2) {
                result = NSDecimalNumber.init(string: String(KAVA_GAS_AMOUNT_REDELEGATE))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_DEL) {
                result = getGasAmountForKavaRewards()[valCnt - 1]
            } else if (type == COSMOS_MULTI_MSG_TYPE_REINVEST) {
                result = NSDecimalNumber.init(string: String(KAVA_GAS_AMOUNT_REINVEST))
            } else if (type == TASK_TYPE_VOTE) {
                result = NSDecimalNumber.init(string: String(KAVA_GAS_AMOUNT_VOTE))
            } else if (type == KAVA_MSG_TYPE_USDX_MINT_INCENTIVE || type == KAVA_MSG_TYPE_CLAIM_HARD_INCENTIVE || type == KAVA_MSG_TYPE_CLAIM_HARD_INCENTIVE_VV) {
                result = NSDecimalNumber.init(string: String(KAVA_GAS_AMOUNT_CLAIM_INCENTIVE))
            } else if (type == KAVA_MSG_TYPE_CREATE_CDP || type == KAVA_MSG_TYPE_DEPOSIT_CDP || type == KAVA_MSG_TYPE_WITHDRAW_CDP ||
                        type == KAVA_MSG_TYPE_DRAWDEBT_CDP || type == KAVA_MSG_TYPE_REPAYDEBT_CDP) {
                result = NSDecimalNumber.init(string: String(KAVA_GAS_AMOUNT_CDP))
            } else if (type == KAVA_MSG_TYPE_DEPOSIT_HARD || type == KAVA_MSG_TYPE_WITHDRAW_HARD || type == KAVA_MSG_TYPE_BORROW_HARD ||
                        type == KAVA_MSG_TYPE_REPAY_HARD) {
                result = NSDecimalNumber.init(string: String(KAVA_GAS_AMOUNT_HARD_POOL))
            } else if (type == KAVA_MSG_TYPE_SWAP_TOKEN) {
                result = NSDecimalNumber.init(string: String(KAVA_GAS_AMOUNT_SWAP_TOKEN))
            } else if (type == KAVA_MSG_TYPE_SWAP_DEPOSIT) {
                result = NSDecimalNumber.init(string: String(KAVA_GAS_AMOUNT_SWAP_DEPOSIT))
            } else if (type == KAVA_MSG_TYPE_SWAP_WITHDRAW) {
                result = NSDecimalNumber.init(string: String(KAVA_GAS_AMOUNT_SWAP_WITHDRAW))
            } else if (type == KAVA_MSG_TYPE_INCENTIVE_ALL) {
                result = NSDecimalNumber.init(string: String(KAVA_GAS_AMOUNT_CLAIM_INCENTIVE_ALL))
            } else if (type == TASK_TYPE_HTLC_SWAP) {
                result = NSDecimalNumber.init(string: String(KAVA_GAS_AMOUNT_BEP3))
            }
            
        } else if (chain == ChainType.BAND_MAIN) {
            if (type == COSMOS_MSG_TYPE_TRANSFER2) {
                result = NSDecimalNumber.init(string: String(BAND_GAS_AMOUNT_SEND))
            } else if (type == COSMOS_MSG_TYPE_DELEGATE) {
                result = NSDecimalNumber.init(string: String(BAND_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_UNDELEGATE2) {
                result = NSDecimalNumber.init(string: String(BAND_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_REDELEGATE2) {
                result = NSDecimalNumber.init(string: String(BAND_GAS_AMOUNT_REDELEGATE))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_DEL) {
                result = WUtils.getGasAmountForKavaRewards()[valCnt - 1]
            } else if (type == COSMOS_MULTI_MSG_TYPE_REINVEST) {
                result = NSDecimalNumber.init(string: String(BAND_GAS_AMOUNT_REINVEST))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_MIDIFY) {
                result = NSDecimalNumber.init(string: String(BAND_GAS_AMOUNT_ADDRESS_CHANGE))
            } else if (type == TASK_TYPE_VOTE) {
                result = NSDecimalNumber.init(string: String(BAND_GAS_AMOUNT_VOTE))
            } else if (type == TASK_IBC_TRANSFER) {
                result = NSDecimalNumber.init(string: String(BAND_GAS_AMOUNT_IBC_SEND))
            }
            
        } else if (chain == ChainType.IOV_MAIN) {
            if (type == COSMOS_MSG_TYPE_TRANSFER2) {
                result = NSDecimalNumber.init(string: String(IOV_GAS_AMOUNT_SEND))
            } else if (type == COSMOS_MSG_TYPE_DELEGATE) {
                result = NSDecimalNumber.init(string: String(IOV_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_UNDELEGATE2) {
                result = NSDecimalNumber.init(string: String(IOV_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_REDELEGATE2) {
                result = NSDecimalNumber.init(string: String(IOV_GAS_AMOUNT_REDELEGATE))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_DEL) {
                result = WUtils.getGasAmountForKavaRewards()[valCnt - 1]
            } else if (type == COSMOS_MULTI_MSG_TYPE_REINVEST) {
                result = NSDecimalNumber.init(string: String(IOV_GAS_AMOUNT_REINVEST))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_MIDIFY) {
                result = NSDecimalNumber.init(string: String(IOV_GAS_AMOUNT_ADDRESS_CHANGE))
            } else if (type == TASK_TYPE_VOTE) {
                result = NSDecimalNumber.init(string: String(IOV_GAS_AMOUNT_VOTE))
            } else if (type == IOV_MSG_TYPE_REGISTER_DOMAIN || type == IOV_MSG_TYPE_REGISTER_ACCOUNT) {
                result = NSDecimalNumber.init(string: String(IOV_GAS_AMOUNT_REGISTER))
            } else if (type == IOV_MSG_TYPE_DELETE_DOMAIN || type == IOV_MSG_TYPE_DELETE_ACCOUNT) {
                result = NSDecimalNumber.init(string: String(IOV_GAS_AMOUNT_DELETE))
            } else if (type == IOV_MSG_TYPE_RENEW_DOMAIN || type == IOV_MSG_TYPE_RENEW_ACCOUNT) {
                result = NSDecimalNumber.init(string: String(IOV_GAS_AMOUNT_RENEW))
            } else if (type == IOV_MSG_TYPE_REPLACE_ACCOUNT_RESOURCE) {
                result = NSDecimalNumber.init(string: String(IOV_GAS_AMOUNT_REPLACE))
            } else if (type == TASK_IBC_TRANSFER) {
                result = NSDecimalNumber.init(string: String(IOV_GAS_AMOUNT_IBC_SEND))
            }
            
        } else if (chain == ChainType.OKEX_MAIN) {
            if (type == COSMOS_MSG_TYPE_TRANSFER2 || type == TASK_IBC_TRANSFER) {
                result = NSDecimalNumber.init(string: String(OK_GAS_AMOUNT_SEND))
            } else if (type == OK_MSG_TYPE_DEPOSIT || type == OK_MSG_TYPE_WITHDRAW) {
                result = (NSDecimalNumber.init(string: OK_GAS_AMOUNT_STAKE_MUX).multiplying(by: NSDecimalNumber.init(value: valCnt))).adding(NSDecimalNumber.init(string: OK_GAS_AMOUNT_STAKE))
            } else if (type == OK_MSG_TYPE_DIRECT_VOTE) {
                result = (NSDecimalNumber.init(string: OK_GAS_AMOUNT_VOTE_MUX).multiplying(by: NSDecimalNumber.init(value: valCnt))).adding(NSDecimalNumber.init(string: OK_GAS_AMOUNT_VOTE))
            }
            
        } else if (chain == ChainType.CERTIK_MAIN) {
            if (type == COSMOS_MSG_TYPE_TRANSFER2) {
                result = NSDecimalNumber.init(string: String(CERTIK_GAS_AMOUNT_SEND))
            } else if (type == COSMOS_MSG_TYPE_DELEGATE || type == COSMOS_MSG_TYPE_UNDELEGATE2) {
                result = NSDecimalNumber.init(string: String(CERTIK_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_DEL) {
                result = getGasAmountForKavaRewards()[valCnt - 1]
            } else if (type == COSMOS_MSG_TYPE_REDELEGATE2) {
                result = NSDecimalNumber.init(string: String(CERTIK_GAS_AMOUNT_REDELEGATE))
            } else if (type == COSMOS_MULTI_MSG_TYPE_REINVEST) {
                result = NSDecimalNumber.init(string: String(CERTIK_GAS_AMOUNT_REINVEST))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_MIDIFY) {
                result = NSDecimalNumber.init(string: String(CERTIK_GAS_AMOUNT_REWARD_ADDRESS_CHANGE))
            } else if (type == TASK_TYPE_VOTE) {
                result = NSDecimalNumber.init(string: String(CERTIK_GAS_AMOUNT_VOTE))
            } else if (type == TASK_IBC_TRANSFER) {
                result = NSDecimalNumber.init(string: String(CERTIK_GAS_AMOUNT_IBC_SEND))
            }
            
        } else if (chain == ChainType.SECRET_MAIN) {
            if (type == COSMOS_MSG_TYPE_TRANSFER2 || type == TASK_IBC_TRANSFER) {
                result = NSDecimalNumber.init(string: String(SECRET_GAS_AMOUNT_SEND))
            } else if (type == COSMOS_MSG_TYPE_DELEGATE || type == COSMOS_MSG_TYPE_UNDELEGATE2) {
                result = NSDecimalNumber.init(string: String(SECRET_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_DEL) {
                result = getGasAmountForKavaRewards()[valCnt - 1]
            } else if (type == COSMOS_MSG_TYPE_REDELEGATE2) {
                result = NSDecimalNumber.init(string: String(SECRET_GAS_AMOUNT_REDELEGATE))
            } else if (type == COSMOS_MULTI_MSG_TYPE_REINVEST) {
                result = NSDecimalNumber.init(string: String(SECRET_GAS_AMOUNT_REINVEST))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_MIDIFY) {
                result = NSDecimalNumber.init(string: String(SECRET_GAS_AMOUNT_REWARD_ADDRESS_CHANGE))
            } else if (type == TASK_TYPE_VOTE) {
                result = NSDecimalNumber.init(string: String(SECRET_GAS_AMOUNT_VOTE))
            }
            
        } else if (chain == ChainType.SENTINEL_MAIN) {
            if (type == COSMOS_MSG_TYPE_TRANSFER2 || type == TASK_IBC_TRANSFER) {
                result = NSDecimalNumber.init(string: String(SENTINEL_GAS_AMOUNT_SEND))
            } else if (type == COSMOS_MSG_TYPE_DELEGATE) {
                result = NSDecimalNumber.init(string: String(SENTINEL_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_UNDELEGATE2) {
                result = NSDecimalNumber.init(string: String(SENTINEL_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_REDELEGATE2) {
                result = NSDecimalNumber.init(string: String(SENTINEL_GAS_AMOUNT_REDELEGATE))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_DEL) {
                result = getGasAmountForKavaRewards()[valCnt - 1]
            } else if (type == COSMOS_MULTI_MSG_TYPE_REINVEST) {
                result = NSDecimalNumber.init(string: String(SENTINEL_GAS_AMOUNT_REINVEST))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_MIDIFY) {
                result = NSDecimalNumber.init(string: String(SENTINEL_GAS_AMOUNT_REWARD_ADDRESS_CHANGE))
            } else if (type == TASK_TYPE_VOTE) {
                result = NSDecimalNumber.init(string: String(SENTINEL_GAS_AMOUNT_VOTE))
            } else if (type == TASK_IBC_TRANSFER) {
                result = NSDecimalNumber.init(string: String(SENTINEL_GAS_AMOUNT_IBC_SEND))
            }
            
        } else if (chain == ChainType.FETCH_MAIN) {
            if (type == COSMOS_MSG_TYPE_TRANSFER2 || type == TASK_IBC_TRANSFER) {
                result = NSDecimalNumber.init(string: String(FETCH_GAS_AMOUNT_SEND))
            } else if (type == COSMOS_MSG_TYPE_DELEGATE) {
                result = NSDecimalNumber.init(string: String(FETCH_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_UNDELEGATE2) {
                result = NSDecimalNumber.init(string: String(FETCH_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_REDELEGATE2) {
                result = NSDecimalNumber.init(string: String(FETCH_GAS_AMOUNT_REDELEGATE))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_DEL) {
                result = getGasAmountForKavaRewards()[valCnt - 1]
            } else if (type == COSMOS_MULTI_MSG_TYPE_REINVEST) {
                result = NSDecimalNumber.init(string: String(FETCH_GAS_AMOUNT_REINVEST))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_MIDIFY) {
                result = NSDecimalNumber.init(string: String(FETCH_GAS_AMOUNT_REWARD_ADDRESS_CHANGE))
            } else if (type == TASK_TYPE_VOTE) {
                result = NSDecimalNumber.init(string: String(FETCH_GAS_AMOUNT_VOTE))
            } else if (type == TASK_IBC_TRANSFER) {
                result = NSDecimalNumber.init(string: String(FETCH_GAS_AMOUNT_IBC_SEND))
            }
            
        } else if (chain == ChainType.SIF_MAIN) {
            if (type == COSMOS_MSG_TYPE_TRANSFER2 || type == TASK_IBC_TRANSFER) {
                result = NSDecimalNumber.init(string: String(SIF_GAS_AMOUNT_SEND))
            } else if (type == COSMOS_MSG_TYPE_DELEGATE) {
                result = NSDecimalNumber.init(string: String(SIF_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_UNDELEGATE2) {
                result = NSDecimalNumber.init(string: String(SIF_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_REDELEGATE2) {
                result = NSDecimalNumber.init(string: String(SIF_GAS_AMOUNT_REDELEGATE))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_DEL) {
                result = getGasAmountForKavaRewards()[valCnt - 1]
            } else if (type == COSMOS_MULTI_MSG_TYPE_REINVEST) {
                result = NSDecimalNumber.init(string: String(SIF_GAS_AMOUNT_REINVEST))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_MIDIFY) {
                result = NSDecimalNumber.init(string: String(SIF_GAS_AMOUNT_REWARD_ADDRESS_CHANGE))
            } else if (type == TASK_TYPE_VOTE) {
                result = NSDecimalNumber.init(string: String(SIF_GAS_AMOUNT_VOTE))
            } else if (type == TASK_IBC_TRANSFER) {
                result = NSDecimalNumber.init(string: String(SIF_GAS_AMOUNT_IBC_SEND))
            } else if (type == SIF_MSG_TYPE_CLAIM_INCENTIVE) {
                result = NSDecimalNumber.init(string: String(SIF_GAS_AMOUNT_INCENTIVE))
            } else if (type == SIF_MSG_TYPE_ADD_LP || type == SIF_MSG_TYPE_REMOVE_LP) {
                result = NSDecimalNumber.init(string: String(SIF_GAS_AMOUNT_LP))
            } else if (type == SIF_MSG_TYPE_SWAP_CION) {
                result = NSDecimalNumber.init(string: String(SIF_GAS_AMOUNT_SWAP))
            }
            
        } else if (chain == ChainType.KI_MAIN) {
            if (type == COSMOS_MSG_TYPE_TRANSFER2) {
               result = NSDecimalNumber.init(string: String(KI_GAS_AMOUNT_SEND))
            } else if (type == COSMOS_MSG_TYPE_DELEGATE) {
                result = NSDecimalNumber.init(string: String(KI_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_UNDELEGATE2) {
                result = NSDecimalNumber.init(string: String(KI_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_REDELEGATE2) {
                result = NSDecimalNumber.init(string: String(KI_GAS_AMOUNT_REDELEGATE))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_DEL) {
                result = getGasAmountForKavaRewards()[valCnt - 1]
            } else if (type == COSMOS_MULTI_MSG_TYPE_REINVEST) {
                result = NSDecimalNumber.init(string: String(KI_GAS_AMOUNT_REINVEST))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_MIDIFY) {
                result = NSDecimalNumber.init(string: String(KI_GAS_AMOUNT_REWARD_ADDRESS_CHANGE))
            } else if (type == TASK_TYPE_VOTE) {
                result = NSDecimalNumber.init(string: String(KI_GAS_AMOUNT_VOTE))
            }
            
        } else if (chain == ChainType.MEDI_MAIN) {
            if (type == COSMOS_MSG_TYPE_TRANSFER2 || type == TASK_IBC_TRANSFER) {
               result = NSDecimalNumber.init(string: String(MEDI_GAS_AMOUNT_SEND))
            } else if (type == COSMOS_MSG_TYPE_DELEGATE) {
                result = NSDecimalNumber.init(string: String(MEDI_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_UNDELEGATE2) {
                result = NSDecimalNumber.init(string: String(MEDI_GAS_AMOUNT_STAKE))
            } else if (type == COSMOS_MSG_TYPE_REDELEGATE2) {
                result = NSDecimalNumber.init(string: String(MEDI_GAS_AMOUNT_REDELEGATE))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_DEL) {
                result = getGasAmountForKavaRewards()[valCnt - 1]
            } else if (type == COSMOS_MULTI_MSG_TYPE_REINVEST) {
                result = NSDecimalNumber.init(string: String(MEDI_GAS_AMOUNT_REINVEST))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_MIDIFY) {
                result = NSDecimalNumber.init(string: String(MEDI_GAS_AMOUNT_REWARD_ADDRESS_CHANGE))
            } else if (type == TASK_TYPE_VOTE) {
                result = NSDecimalNumber.init(string: String(MEDI_GAS_AMOUNT_VOTE))
            } else if (type == TASK_IBC_TRANSFER) {
                result = NSDecimalNumber.init(string: String(MEDI_GAS_AMOUNT_IBC_SEND))
            }
            
        } else if (chain == ChainType.CHIHUAHUA_MAIN) {
            if (type == COSMOS_MSG_TYPE_WITHDRAW_DEL) {
                result = getGasAmountForRewards()[valCnt - 1]
            } else if (type == COSMOS_MSG_TYPE_REDELEGATE2) {
                result = NSDecimalNumber.init(string: String(CERTIK_GAS_AMOUNT_REDELEGATE))
            } else if (type == COSMOS_MULTI_MSG_TYPE_REINVEST) {
                result = NSDecimalNumber.init(string: String(CERTIK_GAS_AMOUNT_REINVEST))
            } else {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_MID))
            }
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            if (type == COSMOS_MSG_TYPE_TRANSFER2) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_MID))
            } else if (type == COSMOS_MSG_TYPE_DELEGATE) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_HIGH))
            } else if (type == COSMOS_MSG_TYPE_UNDELEGATE2) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_HIGH))
            } else if (type == COSMOS_MSG_TYPE_REDELEGATE2) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_HIGH))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_DEL) {
                result = getGasAmountForKavaRewards()[valCnt - 1]
            } else if (type == COSMOS_MULTI_MSG_TYPE_REINVEST) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_HIGH))
            } else if (type == COSMOS_MSG_TYPE_WITHDRAW_MIDIFY) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_MID))
            } else if (type == TASK_TYPE_VOTE) {
                result = NSDecimalNumber.init(string: String(GAS_FEE_AMOUNT_MID))
            }
            
        }
        return result
    }
    
    static func getEstimateGasFeeAmount(_ chain:ChainType, _ type:String,  _ valCnt:Int) -> NSDecimalNumber {
        if (chain == ChainType.COSMOS_MAIN || chain == ChainType.AKASH_MAIN || chain == ChainType.RIZON_MAIN ||
            chain == ChainType.JUNO_MAIN || chain == ChainType.REGEN_MAIN || chain == ChainType.BITCANA_MAIN ||
            chain == ChainType.STARGAZE_MAIN || chain == ChainType.COMDEX_MAIN ||
            chain == ChainType.COSMOS_TEST || chain == ChainType.ALTHEA_TEST) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.IRIS_MAIN || chain == ChainType.IRIS_TEST) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_IRIS)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.PERSIS_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_PERSIS)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.CRYPTO_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_CRYPTO)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.SENTINEL_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_SENTINEL)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.OSMOSIS_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_OSMOSIS)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.BAND_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_BAND)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.IOV_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_IOV)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.SIF_MAIN) {
            return NSDecimalNumber.init(string: "100000000000000000")
            
        } else if (chain == ChainType.MEDI_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_MEDI)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.CERTIK_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_CERTIK)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.EMONEY_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_EMONEY)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.FETCH_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_FETCH)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.KI_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_KI)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.SECRET_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_SECRET)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_INJECTIVE)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.BITSONG_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_BITSONG)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.DESMOS_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_DESMOS)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_GRAV)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.LUM_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_LUM)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.CHIHUAHUA_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_CHIHUAHUA)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.KAVA_MAIN) {
            return NSDecimalNumber.zero
            
        } else if (chain == ChainType.AXELAR_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_AXELAR)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.JUNO_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_JUNO)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.KONSTELLATION_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_KONSTELLATION)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.UMEE_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_UMEE)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_PROVENANCE)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        } else if (chain == ChainType.EVMOS_MAIN) {
            let gasRate = NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_EVMOS)
            let gasAmount = getEstimateGasAmount(chain, type, valCnt)
            return gasRate.multiplying(by: gasAmount, withBehavior: handler0)
            
        }
        return NSDecimalNumber.zero
    }
    
    static func getGasRate(_ chain:ChainType, _ position: Int) -> NSDecimalNumber {
        if (chain == ChainType.COSMOS_MAIN || chain == ChainType.AKASH_MAIN || chain == ChainType.RIZON_MAIN ||
            chain == ChainType.REGEN_MAIN ||
            chain == ChainType.COSMOS_TEST || chain == ChainType.ALTHEA_TEST) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE)
            }
            
        } else if (chain == ChainType.IRIS_MAIN || chain == ChainType.IRIS_TEST) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_IRIS)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_IRIS)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_IRIS)
            }
            
        } else if (chain == ChainType.PERSIS_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_PERSIS)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_PERSIS)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_PERSIS)
            }
            
        } else if (chain == ChainType.CRYPTO_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_CRYPTO)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_CRYPTO)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_CRYPTO)
            }
            
        } else if (chain == ChainType.SENTINEL_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_SENTINEL)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_SENTINEL)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_SENTINEL)
            }
            
        } else if (chain == ChainType.OSMOSIS_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_OSMOSIS)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_OSMOSIS)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_OSMOSIS)
            }
            
        } else if (chain == ChainType.BAND_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_BAND)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_BAND)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_BAND)
            }
            
        } else if (chain == ChainType.IOV_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_IOV)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_IOV)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_IOV)
            }
            
        } else if (chain == ChainType.MEDI_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_MEDI)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_MEDI)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_MEDI)
            }
            
        } else if (chain == ChainType.CERTIK_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_CERTIK)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_CERTIK)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_CERTIK)
            }
            
        } else if (chain == ChainType.EMONEY_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_EMONEY)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_EMONEY)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_EMONEY)
            }
            
        } else if (chain == ChainType.FETCH_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_FETCH)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_FETCH)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_FETCH)
            }
            
        } else if (chain == ChainType.BITCANA_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_BITCANNA)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_BITCANNA)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_BITCANNA)
            }
            
        } else if (chain == ChainType.STARGAZE_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_STARGAZER)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_STARGAZER)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_STARGAZER)
            }
            
        } else if (chain == ChainType.KI_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_KI)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_KI)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_KI)
            }
            
        } else if (chain == ChainType.COMDEX_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_COMDEX)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_COMDEX)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_COMDEX)
            }
            
        } else if (chain == ChainType.SECRET_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_SECRET)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_SECRET)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_SECRET)
            }
            
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_INJECTIVE)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_INJECTIVE)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_INJECTIVE)
            }
            
        } else if (chain == ChainType.BITSONG_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_BITSONG)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_BITSONG)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_BITSONG)
            }
            
        } else if (chain == ChainType.DESMOS_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_DESMOS)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_DESMOS)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_DESMOS)
            }
            
        } else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_GRAV)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_GRAV)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_GRAV)
            }
            
        } else if (chain == ChainType.LUM_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_LUM)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_LUM)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_LUM)
            }
            
        } else if (chain == ChainType.CHIHUAHUA_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_CHIHUAHUA)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_CHIHUAHUA)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_CHIHUAHUA)
            }
            
        } else if (chain == ChainType.KAVA_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.zero
            } else if (position == 1) {
                return NSDecimalNumber.init(string: KAVA_GAS_RATE_LOW)
            } else {
                return NSDecimalNumber.init(string: KAVA_GAS_RATE_AVERAGE)
            }
            
        } else if (chain == ChainType.AXELAR_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_AXELAR)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_AXELAR)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_AXELAR)
            }
            
        } else if (chain == ChainType.JUNO_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_JUNO)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_JUNO)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_JUNO)
            }
            
        } else if (chain == ChainType.KONSTELLATION_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_KONSTELLATION)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_KONSTELLATION)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_KONSTELLATION)
            }
            
        } else if (chain == ChainType.UMEE_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_UMEE)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_UMEE)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_UMEE)
            }
        
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_PROVENANCE)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_PROVENANCE)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_PROVENANCE)
            }
        
        } else if (chain == ChainType.EVMOS_MAIN) {
            if (position == 0) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_TINY_EVMOS)
            } else if (position == 1) {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_LOW_EVMOS)
            } else {
                return NSDecimalNumber.init(string: GAS_FEE_RATE_AVERAGE_EVMOS)
            }
        }
        
        else if (chain == ChainType.OKEX_MAIN) {
            return NSDecimalNumber.init(string: OK_GAS_RATE_AVERAGE)
        }
        return NSDecimalNumber.zero
    }
    
    static func getGasAmountForRewards() -> Array<NSDecimalNumber> {
        var gasAmounts = Array<NSDecimalNumber>()
        gasAmounts.append(NSDecimalNumber.init(string: FEE_REWARD_GAS_1))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_REWARD_GAS_2))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_REWARD_GAS_3))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_REWARD_GAS_4))
        
        gasAmounts.append(NSDecimalNumber.init(string: FEE_REWARD_GAS_5))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_REWARD_GAS_6))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_REWARD_GAS_7))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_REWARD_GAS_8))
        
        gasAmounts.append(NSDecimalNumber.init(string: FEE_REWARD_GAS_9))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_REWARD_GAS_10))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_REWARD_GAS_11))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_REWARD_GAS_12))
        
        gasAmounts.append(NSDecimalNumber.init(string: FEE_REWARD_GAS_13))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_REWARD_GAS_14))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_REWARD_GAS_15))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_REWARD_GAS_16))
        return gasAmounts
    }
    
    static func getGasAmountForKavaRewards() -> Array<NSDecimalNumber> {
        var gasAmounts = Array<NSDecimalNumber>()
        gasAmounts.append(NSDecimalNumber.init(string: FEE_KAVA_REWARD_GAS_1))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_KAVA_REWARD_GAS_2))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_KAVA_REWARD_GAS_3))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_KAVA_REWARD_GAS_4))
        
        gasAmounts.append(NSDecimalNumber.init(string: FEE_KAVA_REWARD_GAS_5))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_KAVA_REWARD_GAS_6))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_KAVA_REWARD_GAS_7))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_KAVA_REWARD_GAS_8))
        
        gasAmounts.append(NSDecimalNumber.init(string: FEE_KAVA_REWARD_GAS_9))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_KAVA_REWARD_GAS_10))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_KAVA_REWARD_GAS_11))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_KAVA_REWARD_GAS_12))
        
        gasAmounts.append(NSDecimalNumber.init(string: FEE_KAVA_REWARD_GAS_13))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_KAVA_REWARD_GAS_14))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_KAVA_REWARD_GAS_15))
        gasAmounts.append(NSDecimalNumber.init(string: FEE_KAVA_REWARD_GAS_16))
        return gasAmounts
    }
    
    static func getVoterTypeCnt(_ votes: Array<Vote>, _ type: String) -> String {
        var result = 0
        for vote in votes {
            if (vote.option == type) {
                result = result + 1
            }
        }
        return String(result)
    }
    
    static func getDPRawDollor(_ price:String, _ scale:Int, _ font:UIFont) -> NSMutableAttributedString {
        let nf = NumberFormatter()
        nf.minimumFractionDigits = scale
        nf.maximumFractionDigits = scale
        nf.numberStyle = .decimal
        
        let handler = NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.down, scale: Int16(scale), raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
        let amount = plainStringToDecimal(price).rounding(accordingToBehavior: handler)
        
        let added       = "$ " + nf.string(from: amount)!
        let endIndex    = added.index(added.endIndex, offsetBy: -scale)
        
        let preString   = added[..<endIndex]
        let postString  = added[endIndex...]
        
        let preAttrs = [NSAttributedString.Key.font : font]
        let postAttrs = [NSAttributedString.Key.font : font.withSize(CGFloat(Int(Double(font.pointSize) * 0.85)))]
        
        let attributedString1 = NSMutableAttributedString(string:String(preString), attributes:preAttrs as [NSAttributedString.Key : Any])
        let attributedString2 = NSMutableAttributedString(string:String(postString), attributes:postAttrs as [NSAttributedString.Key : Any])
        
        attributedString1.append(attributedString2)
        return attributedString1
    }
    
    static func dpChainInfo(_ chain: ChainType, _ img: UIImageView?, _ label: UILabel) {
        if (chain == ChainType.COSMOS_MAIN) {
            label.text = NSLocalizedString("chain_title_cosmos", comment: "")
            img?.image = UIImage(named: "cosmosWhMain")
        } else if (chain == ChainType.IRIS_MAIN) {
            label.text = NSLocalizedString("chain_title_iris", comment: "")
            img?.image = UIImage(named: "irisWh")
        } else if (chain == ChainType.BINANCE_MAIN) {
            label.text = NSLocalizedString("chain_title_bnb", comment: "")
            img?.image = UIImage(named: "binanceChImg")
        } else if (chain == ChainType.KAVA_MAIN) {
            label.text = NSLocalizedString("chain_title_kava", comment: "")
           img?.image = UIImage(named: "kavaImg")
        } else if (chain == ChainType.IOV_MAIN) {
            label.text = NSLocalizedString("chain_title_iov", comment: "")
            img?.image = UIImage(named: "iovImg")
        } else if (chain == ChainType.BAND_MAIN) {
            label.text = NSLocalizedString("chain_title_band", comment: "")
            img?.image = UIImage(named: "chainBandprotocal")
        }
    }
    
    static func dpChainName(_ chain: ChainType) -> String {
        if (chain == ChainType.COSMOS_MAIN) {
            return NSLocalizedString("chain_title_cosmos", comment: "")
        } else if (chain == ChainType.IRIS_MAIN) {
            return NSLocalizedString("chain_title_iris", comment: "")
        } else if (chain == ChainType.BINANCE_MAIN) {
            return NSLocalizedString("chain_title_bnb", comment: "")
        } else if (chain == ChainType.KAVA_MAIN) {
            return NSLocalizedString("chain_title_kava", comment: "")
        } else if (chain == ChainType.IOV_MAIN) {
            return NSLocalizedString("chain_title_iov", comment: "")
        } else if (chain == ChainType.BAND_MAIN) {
            return NSLocalizedString("chain_title_band", comment: "")
        }
        return ""
    }
    
    static func onDpSwapChain(_ chain: ChainType, _ img: UIImageView?, _ label: UILabel) {
        if (chain == ChainType.BINANCE_MAIN) {
            label.text = "BINANCE"
            img?.image = UIImage(named: "binanceChImg")
        } else if (chain == ChainType.KAVA_MAIN) {
            label.text = "KAVA"
           img?.image = UIImage(named: "kavaImg")
        }
    }
    
    static func getKavaHtlcStatus(_ txInfo:TxInfo, _ swap:KavaSwapInfo?) -> String {
        if (!txInfo.isSuccess()) {
            return NSLocalizedString("bep3_status_open", comment: "")
        }
        
        if (swap == nil) {
            return NSLocalizedString("bep3_status_completed", comment: "")
        }
        
        if (swap?.result.status == KavaSwapInfo.STATUS_EXPIRED) {
            return NSLocalizedString("bep3_status_expired", comment: "")
        } else if (swap?.result.status == KavaSwapInfo.STATUS_OPEN) {
            return NSLocalizedString("bep3_status_open", comment: "")
        } else {
            return NSLocalizedString("bep3_status_completed", comment: "")
        }
    }
    
    static func getBnbHtlcStatus(_ swap:BnbSwapInfo?, _ node:BnbNodeInfo?) -> String {
        if (swap == nil || node == nil) {
            return "-"
        }
        
        if (swap?.status == BnbSwapInfo.BNB_STATUS_REFUNDED) {
            return NSLocalizedString("bep3_status_refunded", comment: "")
        } else if (swap?.status == BnbSwapInfo.BNB_STATUS_COMPLETED) {
            return NSLocalizedString("bep3_status_completed", comment: "")
        } else if (swap?.status == BnbSwapInfo.BNB_STATUS_OPEN && swap!.expireHeight < node!.getCHeight()) {
            return NSLocalizedString("bep3_status_expired", comment: "")
        }
        return NSLocalizedString("bep3_status_open", comment: "")
    }

    
    static func getRealBlockTime(_ chain: ChainType?) -> NSDecimalNumber {
        if (chain == ChainType.COSMOS_MAIN || chain == ChainType.COSMOS_TEST) {
            return BLOCK_TIME_COSMOS
            
        } else if (chain == ChainType.IRIS_MAIN || chain == ChainType.IRIS_TEST) {
            return BLOCK_TIME_IRIS
            
        } else if (chain == ChainType.IOV_MAIN) {
            return BLOCK_TIME_IOV
            
        } else if (chain == ChainType.KAVA_MAIN) {
            return BLOCK_TIME_KAVA
            
        } else if (chain == ChainType.BAND_MAIN) {
            return BLOCK_TIME_BAND
            
        } else if (chain == ChainType.CERTIK_MAIN) {
            return BLOCK_TIME_CERTIK
            
        } else if (chain == ChainType.SECRET_MAIN) {
            return BLOCK_TIME_SECRET
            
        } else if (chain == ChainType.AKASH_MAIN) {
            return BLOCK_TIME_AKASH
            
        } else if (chain == ChainType.SENTINEL_MAIN) {
            return BLOCK_TIME_SENTINEL
            
        } else if (chain == ChainType.PERSIS_MAIN) {
            return BLOCK_TIME_PERSISTENCE
            
        } else if (chain == ChainType.FETCH_MAIN) {
            return BLOCK_TIME_FETCH
            
        } else if (chain == ChainType.CRYPTO_MAIN) {
            return BLOCK_TIME_CRYPTO
            
        } else if (chain == ChainType.SIF_MAIN) {
            return BLOCK_TIME_SIF
            
        } else if (chain == ChainType.KI_MAIN) {
            return BLOCK_TIME_KI
            
        } else if (chain == ChainType.MEDI_MAIN) {
            return BLOCK_TIME_MEDI
            
        } else if (chain == ChainType.OSMOSIS_MAIN) {
            return BLOCK_TIME_OSMOSIS
            
        } else if (chain == ChainType.EMONEY_MAIN) {
            return BLOCK_TIME_EMONEY
            
        } else if (chain == ChainType.EMONEY_MAIN) {
            return BLOCK_TIME_EMONEY
            
        } else if (chain == ChainType.RIZON_MAIN) {
            return BLOCK_TIME_RIZON
            
        } else if (chain == ChainType.JUNO_MAIN) {
            return BLOCK_TIME_JUNO
            
        } else if (chain == ChainType.BITCANA_MAIN) {
            return BLOCK_TIME_BITCANNA
            
        } else if (chain == ChainType.REGEN_MAIN) {
            return BLOCK_TIME_REGEN
            
        } else if (chain == ChainType.STARGAZE_MAIN) {
            return BLOCK_TIME_STARGAZE
            
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            return BLOCK_TIME_INJECTIVE
            
        } else if (chain == ChainType.BITSONG_MAIN) {
            return BLOCK_TIME_BITSONG
            
        } else if (chain == ChainType.DESMOS_MAIN) {
            return BLOCK_TIME_DESMOS
            
        } else if (chain == ChainType.COMDEX_MAIN) {
            return BLOCK_TIME_COMDEX
            
        } else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) {
            return BLOCK_TIME_GRAV
            
        } else if (chain == ChainType.LUM_MAIN) {
            return BLOCK_TIME_LUM
            
        } else if (chain == ChainType.CHIHUAHUA_MAIN) {
            return BLOCK_TIME_CHIHUAHUA
            
        } else if (chain == ChainType.AXELAR_MAIN) {
            return BLOCK_TIME_AXELAR
            
        } else if (chain == ChainType.KONSTELLATION_MAIN) {
            return BLOCK_TIME_KONSTEALLTION
            
        } else if (chain == ChainType.UMEE_MAIN) {
            return BLOCK_TIME_UMEE
            
        } else if (chain == ChainType.EVMOS_MAIN) {
            return BLOCK_TIME_EVMOS
            
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            return BLOCK_TIME_PROVENANCE
            
        }
        return NSDecimalNumber.zero
    }
    
    static func getRealBlockPerYear(_ chain: ChainType?) -> NSDecimalNumber {
        if (getRealBlockTime(chain) == NSDecimalNumber.zero) {
            return NSDecimalNumber.zero
        }
        return YEAR_SEC.dividing(by: getRealBlockTime(chain), withBehavior: handler2)
    }
    
    
    static func getMonikerImgUrl(_ chain: ChainType?, _ opAddress: String) -> String {
        if (chain == ChainType.COSMOS_MAIN || chain == ChainType.COSMOS_TEST) {
            return COSMOS_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.IRIS_MAIN || chain == ChainType.IRIS_TEST) {
            return IRIS_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.AKASH_MAIN) {
            return AKASH_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.PERSIS_MAIN) {
            return PERSIS_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.IOV_MAIN) {
            return IOV_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.SENTINEL_MAIN) {
            return SENTINEL_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.SIF_MAIN) {
            return SIF_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.CRYPTO_MAIN) {
            return CRYPTO_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.OSMOSIS_MAIN) {
            return OSMOSIS_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.MEDI_MAIN) {
            return MEDI_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.EMONEY_MAIN) {
            return EMONEY_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.JUNO_MAIN) {
            return JUNO_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.KAVA_MAIN) {
            return KAVA_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.BAND_MAIN) {
            return BAND_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.CERTIK_MAIN) {
            return CERTIK_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.SECRET_MAIN) {
            return SECRET_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.OKEX_MAIN) {
            return OKEX_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.FETCH_MAIN) {
            return FETCH_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.KI_MAIN) {
            return KI_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.ALTHEA_MAIN || chain == ChainType.ALTHEA_TEST) {
            return ALTHEA_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.RIZON_MAIN) {
            return RIZON_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.UMEE_MAIN) {
            return UMEE_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.AXELAR_MAIN) {
            return AXELAR_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.REGEN_MAIN) {
            return REGEN_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.BITCANA_MAIN) {
            return BITCANNA_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) {
            return GRAVITY_BRIDGE_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.STARGAZE_MAIN) {
            return STARGAZE_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.COMDEX_MAIN) {
            return COMDEX_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            return INJECTIVE_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.BITSONG_MAIN) {
            return BITSONG_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.DESMOS_MAIN) {
            return DESMOS_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.LUM_MAIN) {
            return LUM_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.CHIHUAHUA_MAIN) {
            return CHIHUAHUA_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.KONSTELLATION_MAIN) {
            return KONSTELLATION_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.EVMOS_MAIN) {
            return EVMOS_VAL_URL + opAddress + ".png";
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            return PROVENANCE_VAL_URL + opAddress + ".png";
        }
        return ""
    }
    
    static func getTxExplorer(_ chain: ChainType, _ hash: String) -> String {
        if (chain == ChainType.COSMOS_MAIN) {
            return EXPLORER_COSMOS_MAIN + "txs/" + hash
            
        } else if (chain == ChainType.IRIS_MAIN) {
            return EXPLORER_IRIS_MAIN + "txs/" + hash
            
        } else if (chain == ChainType.AKASH_MAIN) {
            return EXPLORER_AKASH_MAIN + "txs/" + hash
            
        } else if (chain == ChainType.PERSIS_MAIN) {
            return EXPLORER_PERSIS_MAIN + "txs/" + hash
            
        } else if (chain == ChainType.CRYPTO_MAIN) {
            return EXPLORER_CRYPTO_MAIN + "txs/" + hash
            
        } else if (chain == ChainType.OSMOSIS_MAIN) {
            return EXPLORER_OSMOSIS_MAIN + "txs/" + hash
            
        } else if (chain == ChainType.MEDI_MAIN) {
            return EXPLORER_MEDI_MAIN + "txs/" + hash
            
        } else if (chain == ChainType.EMONEY_MAIN) {
            return EXPLORER_EMONEY + "txs/" + hash
            
        } else if (chain == ChainType.RIZON_MAIN) {
            return EXPLORER_RIZON + "txs/" + hash
            
        } else if (chain == ChainType.JUNO_MAIN) {
            return EXPLORER_JUNO + "txs/" + hash
            
        } else if (chain == ChainType.REGEN_MAIN) {
            return EXPLORER_REGEN + "txs/" + hash
            
        } else if (chain == ChainType.BITCANA_MAIN) {
            return EXPLORER_BITCANNA + "txs/" + hash
            
        } else if (chain == ChainType.ALTHEA_MAIN) {
            return EXPLORER_ALTHEA + "txs/" + hash
            
        } else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) {
            return EXPLORER_GRAVITY_BRIDGE + "txs/" + hash
            
        } else if (chain == ChainType.STARGAZE_MAIN) {
            return EXPLORER_STARGAZE + "txs/" + hash
            
        } else if (chain == ChainType.BINANCE_MAIN) {
            return EXPLORER_BINANCE_MAIN + "txs/" + hash
            
        } else if (chain == ChainType.KAVA_MAIN) {
            return EXPLORER_KAVA_MAIN + "txs/" + hash
            
        } else if (chain == ChainType.BAND_MAIN) {
            return EXPLORER_BAND_MAIN + "txs/" + hash
            
        } else if (chain == ChainType.SECRET_MAIN) {
            return EXPLORER_SECRET_MAIN + "txs/" + hash
            
        } else if (chain == ChainType.IOV_MAIN) {
            return EXPLORER_IOV_MAIN + "txs/" + hash
            
        } else if (chain == ChainType.OKEX_MAIN) {
            return EXPLORER_OKEX_MAIN + "tx/" + hash
            
        } else if (chain == ChainType.CERTIK_MAIN) {
            return EXPLORER_CERTIK + "txs/" + hash
            
        } else if (chain == ChainType.SENTINEL_MAIN) {
            return EXPLORER_SENTINEL_MAIN + "txs/" + hash
            
        } else if (chain == ChainType.FETCH_MAIN) {
            return EXPLORER_FETCH_MAIN + "txs/" + hash
            
        } else if (chain == ChainType.SIF_MAIN) {
            return EXPLORER_SIF_MAIN + "txs/" + hash
            
        } else if (chain == ChainType.KI_MAIN) {
            return EXPLORER_KI_MAIN + "txs/" + hash
            
        } else if (chain == ChainType.COMDEX_MAIN) {
            return EXPLORER_COMDEX + "txs/" + hash
            
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            return EXPLORER_INJECTIVE + "txs/" + hash
            
        } else if (chain == ChainType.BITSONG_MAIN) {
            return EXPLORER_BITSONG + "txs/" + hash
            
        } else if (chain == ChainType.DESMOS_MAIN) {
            return EXPLORER_DESMOS + "txs/" + hash
            
        } else if (chain == ChainType.LUM_MAIN) {
            return EXPLORER_LUM + "txs/" + hash
            
        } else if (chain == ChainType.CHIHUAHUA_MAIN) {
            return EXPLORER_CHIHUAHUA + "txs/" + hash
            
        } else if (chain == ChainType.AXELAR_MAIN) {
            return EXPLORER_AXELAR + "txs/" + hash
            
        } else if (chain == ChainType.KONSTELLATION_MAIN) {
            return EXPLORER_KONSTELLATION + "txs/" + hash
            
        } else if (chain == ChainType.UMEE_MAIN) {
            return EXPLORER_UMEE + "txs/" + hash
            
        } else if (chain == ChainType.EVMOS_MAIN) {
            return EXPLORER_EVMOS + "txs/" + hash
            
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            return EXPLORER_PROVENANCE + "txs/" + hash
            
        }
        
        else if (chain == ChainType.COSMOS_TEST) {
            return EXPLORER_COSMOS_TEST + "txs/" + hash
            
        } else if (chain == ChainType.IRIS_TEST) {
            return EXPLORER_IRIS_TEST + "txs/" + hash
            
        } else if (chain == ChainType.ALTHEA_TEST) {
            return EXPLORER_ALTHEA_TEST + "txs/" + hash
            
        }
        
        return ""
    }
    
    static func getAccountExplorer(_ chain: ChainType, _ address: String) -> String {
        if (chain == ChainType.COSMOS_MAIN) {
            return EXPLORER_COSMOS_MAIN + "account/" + address
            
        } else if (chain == ChainType.IRIS_MAIN) {
            return EXPLORER_IRIS_MAIN + "account/" + address
            
        } else if (chain == ChainType.AKASH_MAIN) {
            return EXPLORER_AKASH_MAIN + "account/" + address
            
        } else if (chain == ChainType.KAVA_MAIN) {
            return EXPLORER_KAVA_MAIN + "account/" + address
            
        } else if (chain == ChainType.BAND_MAIN) {
            return EXPLORER_BAND_MAIN + "account/" + address
            
        } else if (chain == ChainType.SECRET_MAIN) {
            return EXPLORER_SECRET_MAIN + "account/" + address
            
        } else if (chain == ChainType.CERTIK_MAIN) {
            return EXPLORER_CERTIK + "account/" + address
            
        } else if (chain == ChainType.IOV_MAIN) {
            return EXPLORER_IOV_MAIN + "account/" + address
            
        } else if (chain == ChainType.PERSIS_MAIN) {
            return EXPLORER_PERSIS_MAIN + "account/" + address
            
        } else if (chain == ChainType.SENTINEL_MAIN) {
            return EXPLORER_SENTINEL_MAIN + "account/" + address
            
        } else if (chain == ChainType.BINANCE_MAIN) {
            return EXPLORER_BINANCE_MAIN + "account/" + address
            
        } else if (chain == ChainType.OKEX_MAIN) {
            return EXPLORER_OKEX_MAIN + "address/" + address
            
        } else if (chain == ChainType.FETCH_MAIN) {
            return EXPLORER_FETCH_MAIN + "account/" + address
            
        } else if (chain == ChainType.CRYPTO_MAIN) {
            return EXPLORER_CRYPTO_MAIN + "account/" + address
            
        } else if (chain == ChainType.SIF_MAIN) {
            return EXPLORER_SIF_MAIN + "account/" + address
            
        } else if (chain == ChainType.KI_MAIN) {
            return EXPLORER_KI_MAIN + "account/" + address
            
        } else if (chain == ChainType.OSMOSIS_MAIN) {
            return EXPLORER_OSMOSIS_MAIN + "account/" + address
            
        } else if (chain == ChainType.MEDI_MAIN) {
            return EXPLORER_MEDI_MAIN + "account/" + address
            
        } else if (chain == ChainType.EMONEY_MAIN) {
            return EXPLORER_EMONEY + "account/" + address
            
        } else if (chain == ChainType.RIZON_MAIN) {
            return EXPLORER_RIZON + "account/" + address
            
        } else if (chain == ChainType.JUNO_MAIN) {
            return EXPLORER_JUNO + "account/" + address
            
        } else if (chain == ChainType.REGEN_MAIN) {
            return EXPLORER_REGEN + "account/" + address
            
        } else if (chain == ChainType.BITCANA_MAIN) {
            return EXPLORER_BITCANNA + "account/" + address
            
        } else if (chain == ChainType.ALTHEA_MAIN) {
            return EXPLORER_ALTHEA + "account/" + address
            
        } else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) {
            return EXPLORER_GRAVITY_BRIDGE + "account/" + address
            
        } else if (chain == ChainType.STARGAZE_MAIN) {
            return EXPLORER_STARGAZE + "account/" + address
            
        } else if (chain == ChainType.COMDEX_MAIN) {
            return EXPLORER_COMDEX + "account/" + address
            
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            return EXPLORER_INJECTIVE + "account/" + address
            
        } else if (chain == ChainType.BITSONG_MAIN) {
            return EXPLORER_BITSONG + "account/" + address
            
        } else if (chain == ChainType.DESMOS_MAIN) {
            return EXPLORER_DESMOS + "account/" + address
            
        } else if (chain == ChainType.LUM_MAIN) {
            return EXPLORER_LUM + "account/" + address
            
        } else if (chain == ChainType.CHIHUAHUA_MAIN) {
            return EXPLORER_CHIHUAHUA + "account/" + address
            
        } else if (chain == ChainType.AXELAR_MAIN) {
            return EXPLORER_AXELAR + "account/" + address
            
        } else if (chain == ChainType.KONSTELLATION_MAIN) {
            return EXPLORER_KONSTELLATION + "account/" + address
            
        } else if (chain == ChainType.UMEE_MAIN) {
            return EXPLORER_UMEE + "account/" + address
            
        } else if (chain == ChainType.EVMOS_MAIN) {
            return EXPLORER_EVMOS + "account/" + address
            
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            return EXPLORER_PROVENANCE + "account/" + address
            
        }
        
        else if (chain == ChainType.COSMOS_TEST) {
            return EXPLORER_COSMOS_TEST + "account/" + address
            
        } else if (chain == ChainType.IRIS_TEST) {
            return EXPLORER_IRIS_TEST + "address/" + address
            
        } else if (chain == ChainType.ALTHEA_TEST) {
            return EXPLORER_ALTHEA_TEST + "account/" + address
            
        }
        return ""
    }
    
    static func getProposalExplorer(_ chain: ChainType, _ proposalId: String) -> String {
        if (chain == ChainType.COSMOS_MAIN) {
            return EXPLORER_COSMOS_MAIN + "proposals/" + proposalId
            
        } else if (chain == ChainType.IRIS_MAIN) {
            return EXPLORER_IRIS_MAIN + "proposals/" + proposalId
            
        } else if (chain == ChainType.AKASH_MAIN) {
            return EXPLORER_AKASH_MAIN + "proposals/" + proposalId
            
        } else if (chain == ChainType.KAVA_MAIN) {
            return EXPLORER_KAVA_MAIN + "proposals/" + proposalId
            
        } else if (chain == ChainType.BAND_MAIN) {
            return EXPLORER_BAND_MAIN + "proposals/" + proposalId
            
        } else if (chain == ChainType.SECRET_MAIN) {
            return EXPLORER_SECRET_MAIN + "proposals/" + proposalId
            
        } else if (chain == ChainType.CERTIK_MAIN) {
            return EXPLORER_CERTIK + "proposals/" + proposalId
            
        } else if (chain == ChainType.IOV_MAIN) {
            return EXPLORER_IOV_MAIN + "proposals/" + proposalId
            
        } else if (chain == ChainType.PERSIS_MAIN) {
            return EXPLORER_PERSIS_MAIN + "proposals/" + proposalId
            
        } else if (chain == ChainType.SENTINEL_MAIN) {
            return EXPLORER_SENTINEL_MAIN + "proposals/" + proposalId
            
        } else if (chain == ChainType.FETCH_MAIN) {
            return EXPLORER_FETCH_MAIN + "proposals/" + proposalId
            
        } else if (chain == ChainType.CRYPTO_MAIN) {
            return EXPLORER_CRYPTO_MAIN + "proposals/" + proposalId
            
        } else if (chain == ChainType.SIF_MAIN) {
            return EXPLORER_SIF_MAIN + "proposals/" + proposalId
            
        } else if (chain == ChainType.KI_MAIN) {
            return EXPLORER_KI_MAIN + "proposals/" + proposalId
            
        } else if (chain == ChainType.OSMOSIS_MAIN) {
            return EXPLORER_OSMOSIS_MAIN + "proposals/" + proposalId
            
        } else if (chain == ChainType.MEDI_MAIN) {
            return EXPLORER_MEDI_MAIN + "proposals/" + proposalId
            
        } else if (chain == ChainType.EMONEY_MAIN) {
            return EXPLORER_EMONEY + "proposals/" + proposalId
            
        } else if (chain == ChainType.RIZON_MAIN) {
            return EXPLORER_RIZON + "proposals/" + proposalId
            
        } else if (chain == ChainType.JUNO_MAIN) {
            return EXPLORER_JUNO + "proposals/" + proposalId
            
        } else if (chain == ChainType.REGEN_MAIN) {
            return EXPLORER_REGEN + "proposals/" + proposalId
            
        } else if (chain == ChainType.BITCANA_MAIN) {
            return EXPLORER_BITCANNA + "proposals/" + proposalId
            
        } else if (chain == ChainType.ALTHEA_MAIN) {
            return EXPLORER_ALTHEA + "proposals/" + proposalId
            
        } else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) {
            return EXPLORER_GRAVITY_BRIDGE + "proposals/" + proposalId
            
        } else if (chain == ChainType.STARGAZE_MAIN) {
            return EXPLORER_STARGAZE + "proposals/" + proposalId
            
        } else if (chain == ChainType.COMDEX_MAIN) {
            return EXPLORER_COMDEX + "proposals/" + proposalId
            
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            return EXPLORER_INJECTIVE + "proposals/" + proposalId
            
        } else if (chain == ChainType.BITSONG_MAIN) {
            return EXPLORER_BITSONG + "proposals/" + proposalId
            
        } else if (chain == ChainType.DESMOS_MAIN) {
            return EXPLORER_DESMOS + "proposals/" + proposalId
            
        } else if (chain == ChainType.LUM_MAIN) {
            return EXPLORER_LUM + "proposals/" + proposalId
            
        } else if (chain == ChainType.CHIHUAHUA_MAIN) {
            return EXPLORER_CHIHUAHUA + "proposals/" + proposalId
            
        } else if (chain == ChainType.AXELAR_MAIN) {
            return EXPLORER_AXELAR + "proposals/" + proposalId
            
        } else if (chain == ChainType.KONSTELLATION_MAIN) {
            return EXPLORER_KONSTELLATION + "proposals/" + proposalId
            
        } else if (chain == ChainType.UMEE_MAIN) {
            return EXPLORER_UMEE + "proposals/" + proposalId
            
        } else if (chain == ChainType.EVMOS_MAIN) {
            return EXPLORER_EVMOS + "proposals/" + proposalId
            
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            return EXPLORER_PROVENANCE + "proposals/" + proposalId
            
        }
        
        else if (chain == ChainType.COSMOS_TEST) {
            return EXPLORER_COSMOS_TEST + "proposals/" + proposalId
            
        } else if (chain == ChainType.IRIS_TEST) {
            return EXPLORER_IRIS_TEST + "proposals/" + proposalId
            
        } else if (chain == ChainType.ALTHEA_TEST) {
            return EXPLORER_ALTHEA_TEST + "proposals/" + proposalId
            
        }
        return ""
    }
    
    static func getStakingTokenImg(_ chain: ChainType) -> UIImage? {
        if (chain == ChainType.COSMOS_MAIN || chain == ChainType.COSMOS_TEST) {
            return UIImage(named: "atom_ic")
            
        } else if (chain == ChainType.IRIS_MAIN || chain == ChainType.IRIS_TEST) {
            return UIImage(named: "irisTokenImg")
            
        } else if (chain == ChainType.BINANCE_MAIN) {
            return UIImage(named: "bnbTokenImg")
            
        } else if (chain == ChainType.OKEX_MAIN) {
            return UIImage(named: "tokenOkx")
            
        } else if (chain == ChainType.AKASH_MAIN) {
            return UIImage(named: "akashTokenImg")
            
        } else if (chain == ChainType.KAVA_MAIN) {
            return UIImage(named: "kavaTokenImg")
            
        } else if (chain == ChainType.BAND_MAIN) {
            return UIImage(named: "tokenBand")
            
        } else if (chain == ChainType.SECRET_MAIN) {
            return UIImage(named: "secretTokenImg")
            
        } else if (chain == ChainType.CERTIK_MAIN) {
            return UIImage(named: "certikTokenImg")
            
        } else if (chain == ChainType.IOV_MAIN) {
            return UIImage(named: "tokenStarname")
            
        } else if (chain == ChainType.PERSIS_MAIN) {
            return UIImage(named: "tokenpersistence")
            
        } else if (chain == ChainType.SENTINEL_MAIN) {
            return UIImage(named: "tokensentinel")
            
        } else if (chain == ChainType.FETCH_MAIN) {
            return UIImage(named: "tokenfetchai")
            
        } else if (chain == ChainType.CRYPTO_MAIN) {
            return UIImage(named: "tokencrypto")
            
        } else if (chain == ChainType.SIF_MAIN) {
            return UIImage(named: "tokensifchain")
            
        } else if (chain == ChainType.KI_MAIN) {
            return UIImage(named: "tokenKifoundation")
            
        } else if (chain == ChainType.OSMOSIS_MAIN) {
            return UIImage(named: "tokenOsmosis")
            
        } else if (chain == ChainType.MEDI_MAIN) {
            return UIImage(named: "tokenmedibloc")
            
        } else if (chain == ChainType.EMONEY_MAIN) {
            return UIImage(named: "tokenEmoney")
            
        } else if (chain == ChainType.RIZON_MAIN) {
            return UIImage(named: "tokenRizon")
            
        } else if (chain == ChainType.JUNO_MAIN) {
            return UIImage(named: "tokenJuno")
            
        } else if (chain == ChainType.REGEN_MAIN) {
            return UIImage(named: "tokenRegen")
            
        } else if (chain == ChainType.BITCANA_MAIN) {
            return UIImage(named: "tokenBitcanna")
            
        } else if (chain == ChainType.ALTHEA_MAIN || chain == ChainType.ALTHEA_TEST) {
            return UIImage(named: "tokenAlthea")
            
        } else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) {
            return UIImage(named: "tokenGravitybridge")
            
        } else if (chain == ChainType.STARGAZE_MAIN) {
            return UIImage(named: "tokenStargaze")
            
        } else if (chain == ChainType.COMDEX_MAIN) {
            return UIImage(named: "tokenComdex")
            
        } else if (chain == ChainType.INJECTIVE_MAIN) {
            return UIImage(named: "tokenInjective")
            
        } else if (chain == ChainType.BITSONG_MAIN) {
            return UIImage(named: "tokenBitsong")
            
        } else if (chain == ChainType.DESMOS_MAIN) {
            return UIImage(named: "tokenDesmos")
            
        } else if (chain == ChainType.LUM_MAIN) {
            return UIImage(named: "tokenLum")
            
        } else if (chain == ChainType.CHIHUAHUA_MAIN) {
            return UIImage(named: "tokenHuahua")
            
        } else if (chain == ChainType.AXELAR_MAIN) {
            return UIImage(named: "tokenAxelar")
            
        } else if (chain == ChainType.KONSTELLATION_MAIN) {
            return UIImage(named: "tokenKonstellation")
            
        } else if (chain == ChainType.UMEE_MAIN) {
            return UIImage(named: "tokenUmee")
            
        } else if (chain == ChainType.EVMOS_MAIN) {
            return UIImage(named: "tokenEvmos")
            
        } else if (chain == ChainType.PROVENANCE_MAIN) {
            return UIImage(named: "tokenHash")
        
        }
        return UIImage(named: "tokenIc")
        
    }
    
    static func getChainImg(_ chain: ChainType?) -> UIImage? {
        if (chain == ChainType.COSMOS_MAIN) { return UIImage(named: "cosmosWhMain") }
        else if (chain == ChainType.IRIS_MAIN) { return UIImage(named: "irisWh") }
        else if (chain == ChainType.BINANCE_MAIN) { return UIImage(named: "binanceChImg") }
        else if (chain == ChainType.OKEX_MAIN) { return UIImage(named: "chainOkex") }
        else if (chain == ChainType.AKASH_MAIN) { return UIImage(named: "akashChainImg") }
        else if (chain == ChainType.KAVA_MAIN) { return UIImage(named: "kavaImg") }
        else if (chain == ChainType.BAND_MAIN) { return UIImage(named: "chainBandprotocal") }
        else if (chain == ChainType.SECRET_MAIN) { return UIImage(named: "secretChainImg") }
        else if (chain == ChainType.CERTIK_MAIN) { return UIImage(named: "certikChainImg") }
        else if (chain == ChainType.IOV_MAIN) { return UIImage(named: "chainStarname") }
        else if (chain == ChainType.PERSIS_MAIN) { return UIImage(named: "chainpersistence") }
        else if (chain == ChainType.SENTINEL_MAIN) { return UIImage(named: "chainsentinel") }
        else if (chain == ChainType.FETCH_MAIN) { return UIImage(named: "chainfetchai") }
        else if (chain == ChainType.CRYPTO_MAIN) { return UIImage(named: "chaincrypto") }
        else if (chain == ChainType.SIF_MAIN) { return UIImage(named: "chainsifchain") }
        else if (chain == ChainType.KI_MAIN) { return UIImage(named: "chainKifoundation") }
        else if (chain == ChainType.OSMOSIS_MAIN) { return UIImage(named: "chainOsmosis") }
        else if (chain == ChainType.MEDI_MAIN) { return UIImage(named: "chainMedibloc") }
        else if (chain == ChainType.EMONEY_MAIN) { return UIImage(named: "chainEmoney") }
        else if (chain == ChainType.RIZON_MAIN) { return UIImage(named: "chainRizon") }
        else if (chain == ChainType.JUNO_MAIN) { return UIImage(named: "chainJuno") }
        else if (chain == ChainType.REGEN_MAIN) { return UIImage(named: "chainRegen") }
        else if (chain == ChainType.BITCANA_MAIN) { return UIImage(named: "chainBitcanna") }
        else if (chain == ChainType.ALTHEA_MAIN) { return UIImage(named: "chainAlthea") }
        else if (chain == ChainType.STARGAZE_MAIN) { return UIImage(named: "chainStargaze") }
        else if (chain == ChainType.COMDEX_MAIN) { return UIImage(named: "chainComdex") }
        else if (chain == ChainType.INJECTIVE_MAIN) { return UIImage(named: "chainInjective") }
        else if (chain == ChainType.BITSONG_MAIN) { return UIImage(named: "chainBitsong") }
        else if (chain == ChainType.DESMOS_MAIN) { return UIImage(named: "chainDesmos") }
        else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) { return UIImage(named: "chainGravitybridge") }
        else if (chain == ChainType.LUM_MAIN) { return UIImage(named: "chainLumnetwork") }
        else if (chain == ChainType.CHIHUAHUA_MAIN) { return UIImage(named: "chainChihuahua") }
        else if (chain == ChainType.AXELAR_MAIN) { return UIImage(named: "chainAxelar") }
        else if (chain == ChainType.KONSTELLATION_MAIN) { return UIImage(named: "chainKonstellation") }
        else if (chain == ChainType.UMEE_MAIN) { return UIImage(named: "chainUmee") }
        else if (chain == ChainType.EVMOS_MAIN) { return UIImage(named: "chainEvmos") }
        else if (chain == ChainType.PROVENANCE_MAIN) { return UIImage(named: "chainProvenance") }

        
        else if (chain == ChainType.COSMOS_TEST) { return UIImage(named: "cosmosTestChainImg") }
        else if (chain == ChainType.IRIS_TEST) { return UIImage(named: "irisTestChainImg") }
        else if (chain == ChainType.ALTHEA_TEST) { return UIImage(named: "testnetAlthea") }
        return UIImage(named: "defaultChainImg")
    }
    
    static func getChainNameByBaseChain(_ chain: ChainType?) -> String {
        if (chain == ChainType.COSMOS_MAIN) { return "cosmos" }
        else if (chain == ChainType.IRIS_MAIN) { return "iris" }
        else if (chain == ChainType.AKASH_MAIN) { return "akash" }
        else if (chain == ChainType.KAVA_MAIN) { return "kava" }
        else if (chain == ChainType.BAND_MAIN) { return "band" }
        else if (chain == ChainType.SECRET_MAIN) { return "secret" }
        else if (chain == ChainType.CERTIK_MAIN) { return "certik" }
        else if (chain == ChainType.IOV_MAIN) { return "starname" }
        else if (chain == ChainType.PERSIS_MAIN) { return "persistence" }
        else if (chain == ChainType.SENTINEL_MAIN) { return "sentinel" }
        else if (chain == ChainType.FETCH_MAIN) { return "fetchai" }
        else if (chain == ChainType.CRYPTO_MAIN) { return "cryptoorg" }
        else if (chain == ChainType.SIF_MAIN) { return "sifchain" }
        else if (chain == ChainType.KI_MAIN) { return "kichain" }
        else if (chain == ChainType.OSMOSIS_MAIN) { return "osmosis" }
        else if (chain == ChainType.MEDI_MAIN) { return "medibloc" }
        else if (chain == ChainType.EMONEY_MAIN) { return "emoney" }
        else if (chain == ChainType.RIZON_MAIN) { return "rizon" }
        else if (chain == ChainType.JUNO_MAIN) { return "juno" }
        else if (chain == ChainType.REGEN_MAIN) { return "regen" }
        else if (chain == ChainType.BITCANA_MAIN) { return "bitcanna" }
        else if (chain == ChainType.STARGAZE_MAIN) { return "stargaze" }
        else if (chain == ChainType.COMDEX_MAIN) { return "comdex" }
        else if (chain == ChainType.INJECTIVE_MAIN) { return "injective" }
        else if (chain == ChainType.BITSONG_MAIN) { return "bitsong" }
        else if (chain == ChainType.DESMOS_MAIN) { return "desmos" }
        else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) { return "gravity-bridge" }
        else if (chain == ChainType.LUM_MAIN) { return "lum" }
        else if (chain == ChainType.CHIHUAHUA_MAIN) { return "chihuahua" }
        else if (chain == ChainType.AXELAR_MAIN) { return "axelar" }
        else if (chain == ChainType.KONSTELLATION_MAIN) { return "konstellation" }
        else if (chain == ChainType.UMEE_MAIN) { return "umee" }
        else if (chain == ChainType.EVMOS_MAIN) { return "evmos" }
        else if (chain == ChainType.PROVENANCE_MAIN) { return "provenance" }
        
        else if (chain == ChainType.BINANCE_MAIN) { return "bnb" }
        else if (chain == ChainType.OKEX_MAIN) { return "okex" }
        
        else if (chain == ChainType.ALTHEA_MAIN) { return "ALTHEA" }
        return "Unknown"
    }
    
    static func getChainTitle(_ chain: ChainType?) -> String {
        if (chain == ChainType.COSMOS_MAIN) { return "(Cosmos Mainnet)" }
        else if (chain == ChainType.IRIS_MAIN) { return "(Iris Mainnet)" }
        else if (chain == ChainType.BINANCE_MAIN) { return "(Binance Mainnet)" }
        else if (chain == ChainType.OKEX_MAIN) { return "(OEC Mainnet)" }
        else if (chain == ChainType.AKASH_MAIN) { return "(Akash Mainnet)" }
        else if (chain == ChainType.KAVA_MAIN) { return "(Kava Mainnet)" }
        else if (chain == ChainType.BAND_MAIN) { return "(Band Mainnet)" }
        else if (chain == ChainType.SECRET_MAIN) { return "(Secret Mainnet)" }
        else if (chain == ChainType.CERTIK_MAIN) { return "(Certik Mainnet)" }
        else if (chain == ChainType.IOV_MAIN) { return "(Starname Mainnet)" }
        else if (chain == ChainType.PERSIS_MAIN) { return "(Persistence Mainnet)" }
        else if (chain == ChainType.SENTINEL_MAIN) { return "(Sentinel Mainnet)" }
        else if (chain == ChainType.FETCH_MAIN) { return "(Fetch.Ai Mainnet)" }
        else if (chain == ChainType.CRYPTO_MAIN) { return "(Crypto.org Mainnet)" }
        else if (chain == ChainType.SIF_MAIN) { return "(SifChain Mainnet)" }
        else if (chain == ChainType.KI_MAIN) { return "(KiChain Mainnet)" }
        else if (chain == ChainType.OSMOSIS_MAIN) { return "(Osmosis Mainnet)" }
        else if (chain == ChainType.MEDI_MAIN) { return "(Medibloc Mainnet)" }
        else if (chain == ChainType.EMONEY_MAIN) { return "(E-Money Mainnet)" }
        else if (chain == ChainType.RIZON_MAIN) { return "(Rizon Mainnet)" }
        else if (chain == ChainType.JUNO_MAIN) { return "(Juno Mainnet)" }
        else if (chain == ChainType.REGEN_MAIN) { return "(Regen Mainnet)" }
        else if (chain == ChainType.BITCANA_MAIN) { return "(Bitcanna Mainnet)" }
        else if (chain == ChainType.ALTHEA_MAIN) { return "(Althea Mainnet)" }
        else if (chain == ChainType.STARGAZE_MAIN) { return "(Stargaze Mainnet)" }
        else if (chain == ChainType.COMDEX_MAIN) { return "(Comdex Mainnet)" }
        else if (chain == ChainType.INJECTIVE_MAIN) { return "(Injective Mainnet)" }
        else if (chain == ChainType.BITSONG_MAIN) { return "(Bitsong Mainnet)" }
        else if (chain == ChainType.DESMOS_MAIN) { return "(Desmos Mainnet)" }
        else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) { return "(G-Bridge Mainnet)" }
        else if (chain == ChainType.LUM_MAIN) { return "(Lum Mainnet)" }
        else if (chain == ChainType.CHIHUAHUA_MAIN) { return "(Chihuahua Mainnet)" }
        else if (chain == ChainType.AXELAR_MAIN) { return "(Axelar Mainnet)" }
        else if (chain == ChainType.KONSTELLATION_MAIN) { return "(Konstellation Mainnet)" }
        else if (chain == ChainType.UMEE_MAIN) { return "(Umee Mainnet)" }
        else if (chain == ChainType.EVMOS_MAIN) { return "(Evmos Mainnet)" }
        else if (chain == ChainType.PROVENANCE_MAIN) { return "(Provenance Mainnet)" }
        
        else if (chain == ChainType.COSMOS_TEST) { return "(StarGate Testnet)" }
        else if (chain == ChainType.IRIS_TEST) { return "(Bifrost Testnet)" }
        else if (chain == ChainType.ALTHEA_TEST) { return "(Althea Testnet)" }
        
        return "Unknown"
    }
    
    static func getChainTitle2(_ chain: ChainType?) -> String {
        if (chain == ChainType.COSMOS_MAIN) { return "COSMOS" }
        else if (chain == ChainType.IRIS_MAIN) { return "IRIS" }
        else if (chain == ChainType.BINANCE_MAIN) { return "BINANCE" }
        else if (chain == ChainType.OKEX_MAIN) { return "OEC" }
        else if (chain == ChainType.AKASH_MAIN) { return "AKASH" }
        else if (chain == ChainType.KAVA_MAIN) { return "KAVA" }
        else if (chain == ChainType.BAND_MAIN) { return "BAND" }
        else if (chain == ChainType.SECRET_MAIN) { return "SECRET" }
        else if (chain == ChainType.CERTIK_MAIN) { return "CERTIK" }
        else if (chain == ChainType.IOV_MAIN) { return "STARNAME" }
        else if (chain == ChainType.PERSIS_MAIN) { return "PERSISTENCE" }
        else if (chain == ChainType.SENTINEL_MAIN) { return "SENTINEL" }
        else if (chain == ChainType.FETCH_MAIN) { return "FETCH.AI" }
        else if (chain == ChainType.CRYPTO_MAIN) { return "CRYPTO.ORG" }
        else if (chain == ChainType.SIF_MAIN) { return "SIF" }
        else if (chain == ChainType.KI_MAIN) { return "KI" }
        else if (chain == ChainType.OSMOSIS_MAIN) { return "OSMOSIS" }
        else if (chain == ChainType.MEDI_MAIN) { return "MEDIBLOC" }
        else if (chain == ChainType.EMONEY_MAIN) { return "E-MONEY" }
        else if (chain == ChainType.RIZON_MAIN) { return "RIZON" }
        else if (chain == ChainType.JUNO_MAIN) { return "JUNO" }
        else if (chain == ChainType.REGEN_MAIN) { return "REGEN" }
        else if (chain == ChainType.BITCANA_MAIN) { return "BITCANNA" }
        else if (chain == ChainType.ALTHEA_MAIN) { return "ALTHEA" }
        else if (chain == ChainType.STARGAZE_MAIN) { return "STARGAZE" }
        else if (chain == ChainType.COMDEX_MAIN) { return "COMDEX" }
        else if (chain == ChainType.INJECTIVE_MAIN) { return "INJECTIVE" }
        else if (chain == ChainType.BITSONG_MAIN) { return "BITSONG" }
        else if (chain == ChainType.DESMOS_MAIN) { return "DESMOS" }
        else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) { return "G-BRIDGE" }
        else if (chain == ChainType.LUM_MAIN) { return "LUM" }
        else if (chain == ChainType.CHIHUAHUA_MAIN) { return "CHIHUAHUA" }
        else if (chain == ChainType.AXELAR_MAIN) { return "AXELAR" }
        else if (chain == ChainType.KONSTELLATION_MAIN) { return "KONSTELLATION" }
        else if (chain == ChainType.UMEE_MAIN) { return "UMEE" }
        else if (chain == ChainType.EVMOS_MAIN) { return "EVMOS" }
        else if (chain == ChainType.PROVENANCE_MAIN) { return "PROVENANCE" }
        
        else if (chain == ChainType.COSMOS_TEST) { return "STARGATE" }
        else if (chain == ChainType.IRIS_TEST) { return "BIFROST" }
        else if (chain == ChainType.ALTHEA_TEST) { return "ALTHEA TEST" }
        
        return "Unknown"
    }
    
    static func getDefaultRlayerImg(_ chain: ChainType?) -> String {
        if (chain == ChainType.COSMOS_MAIN) { return RELAYER_IMG_COSMOS }
        else if (chain == ChainType.IRIS_MAIN) { return RELAYER_IMG_IRIS }
        else if (chain == ChainType.BAND_MAIN) { return RELAYER_IMG_BAND }
        else if (chain == ChainType.IOV_MAIN) { return RELAYER_IMG_IOV }
        else if (chain == ChainType.CERTIK_MAIN) { return RELAYER_IMG_CERTIK }
        else if (chain == ChainType.AKASH_MAIN) { return RELAYER_IMG_AKASH }
        else if (chain == ChainType.PERSIS_MAIN) { return RELAYER_IMG_PERSIS }
        else if (chain == ChainType.SENTINEL_MAIN) { return RELAYER_IMG_SENTINEL }
        else if (chain == ChainType.FETCH_MAIN) { return RELAYER_IMG_FETCH }
        else if (chain == ChainType.CRYPTO_MAIN) { return RELAYER_IMG_CRYPTO }
        else if (chain == ChainType.SIF_MAIN) { return RELAYER_IMG_SIF }
        else if (chain == ChainType.OSMOSIS_MAIN) { return RELAYER_IMG_OSMOSIS }
        else if (chain == ChainType.EMONEY_MAIN) { return RELAYER_IMG_EMONEY }
        else if (chain == ChainType.JUNO_MAIN) { return RELAYER_IMG_JUNO }
        else if (chain == ChainType.REGEN_MAIN) { return RELAYER_IMG_REGEN }
        else if (chain == ChainType.INJECTIVE_MAIN) { return RELAYER_IMG_INJECTIVE }
        else if (chain == ChainType.KI_MAIN) { return RELAYER_IMG_KI }
        else if (chain == ChainType.SECRET_MAIN) { return RELAYER_IMG_SECRET }
        else if (chain == ChainType.BITCANA_MAIN) { return RELAYER_IMG_BITCANNA }
        else if (chain == ChainType.COMDEX_MAIN) { return RELAYER_IMG_COMDEX }
        else if (chain == ChainType.STARGAZE_MAIN) { return RELAYER_IMG_STARGAZE }
        else if (chain == ChainType.RIZON_MAIN) { return RELAYER_IMG_RIZON }
        else if (chain == ChainType.MEDI_MAIN) { return RELAYER_IMG_MEDI }
        else if (chain == ChainType.BITSONG_MAIN) { return RELAYER_IMG_BITSONG }
        else if (chain == ChainType.DESMOS_MAIN) { return RELAYER_IMG_DESMOS }
        else if (chain == ChainType.GRAVITY_BRIDGE_MAIN) { return RELAYER_IMG_GRAVITYBRIDGE }
        else if (chain == ChainType.LUM_MAIN) { return RELAYER_IMG_LUM }
        else if (chain == ChainType.CHIHUAHUA_MAIN) { return RELAYER_IMG_CHIHUAHUA }
        else if (chain == ChainType.KAVA_MAIN) { return RELAYER_IMG_KAVA }
        else if (chain == ChainType.AXELAR_MAIN) { return RELAYER_IMG_AXELAR }
        else if (chain == ChainType.KONSTELLATION_MAIN) { return RELAYER_IMG_KONSTELLATION }
        else if (chain == ChainType.UMEE_MAIN) { return RELAYER_IMG_UMEE }
        else if (chain == ChainType.EVMOS_MAIN) { return RELAYER_IMG_EVMOS }
        else if (chain == ChainType.PROVENANCE_MAIN) { return RELAYER_IMG_PROVENANCE }
        return ""
    }
    
    static func getChainTypeByChainId(_ chainId: String?) -> ChainType? {
        if (chainId?.contains("cosmoshub-") == true) {
            return ChainType.COSMOS_MAIN
        } else if (chainId?.contains("irishub-") == true) {
            return ChainType.IRIS_MAIN
        } else if (chainId?.contains("iov-") == true) {
            return ChainType.IOV_MAIN
        } else if (chainId?.contains("akashnet-") == true) {
            return ChainType.AKASH_MAIN
        } else if (chainId?.contains("sentinelhub-") == true) {
            return ChainType.SENTINEL_MAIN
        } else if (chainId?.contains("core-") == true) {
            return ChainType.PERSIS_MAIN
        } else if (chainId?.contains("sifchain-") == true) {
            return ChainType.SIF_MAIN
        } else if (chainId?.contains("osmosis-") == true) {
            return ChainType.OSMOSIS_MAIN
        } else if (chainId?.contains("crypto-org-") == true) {
            return ChainType.CRYPTO_MAIN
        } else if (chainId?.contains("laozi-mainnet") == true) {
            return ChainType.BAND_MAIN
        } else if (chainId?.contains("shentu-") == true) {
            return ChainType.CERTIK_MAIN
        } else if (chainId?.contains("fetchhub-") == true) {
            return ChainType.FETCH_MAIN
        } else if (chainId?.contains("panacea-") == true) {
            return ChainType.MEDI_MAIN
        } else if (chainId?.contains("emoney-") == true) {
            return ChainType.EMONEY_MAIN
        } else if (chainId?.contains("titan-") == true) {
            return ChainType.RIZON_MAIN
        } else if (chainId?.contains("juno-") == true) {
            return ChainType.JUNO_MAIN
        } else if (chainId?.contains("regen-") == true) {
            return ChainType.REGEN_MAIN
        } else if (chainId?.contains("bitcanna-") == true) {
            return ChainType.BITCANA_MAIN
        } else if (chainId?.contains("althea-") == true) {
            return ChainType.ALTHEA_MAIN
        } else if (chainId?.contains("stargaze-") == true) {
            return ChainType.STARGAZE_MAIN
        } else if (chainId?.contains("comdex-") == true) {
            return ChainType.COMDEX_MAIN
        } else if (chainId?.contains("injective-") == true) {
            return ChainType.INJECTIVE_MAIN
        } else if (chainId?.contains("kichain-") == true) {
            return ChainType.KI_MAIN
        } else if (chainId?.contains("secret-") == true) {
            return ChainType.SECRET_MAIN
        } else if (chainId?.contains("bitsong-") == true) {
            return ChainType.BITSONG_MAIN
        } else if (chainId?.contains("desmos-") == true) {
            return ChainType.DESMOS_MAIN
        } else if (chainId?.contains("gravity-bridge-") == true) {
            return ChainType.GRAVITY_BRIDGE_MAIN
        } else if (chainId?.contains("lum-") == true) {
            return ChainType.LUM_MAIN
        } else if (chainId?.contains("chihuahua-") == true) {
            return ChainType.CHIHUAHUA_MAIN
        } else if (chainId?.contains("kava-") == true) {
            return ChainType.KAVA_MAIN
        } else if (chainId?.contains("axelar-") == true) {
            return ChainType.AXELAR_MAIN
        } else if (chainId?.contains("darchub") == true) {
            return ChainType.KONSTELLATION_MAIN
        } else if (chainId?.contains("umee-") == true) {
            return ChainType.UMEE_MAIN
        } else if (chainId?.contains("evmos") == true) {
            return ChainType.EVMOS_MAIN
        } else if (chainId?.contains("pio-mainnet-") == true) {
            return ChainType.PROVENANCE_MAIN
        }
        
        return nil
    }
    
    static func isValidChainAddress(_ chain: ChainType?, _ address: String?) -> Bool {
        if (address?.starts(with: "0x") == true) {
            if (!WKey.isValidEthAddress(address!)) { return false }
            if (chain == ChainType.OKEX_MAIN) { return true }
            return false
        }
        
        if (!WKey.isValidateBech32(address ?? "")) { return false }
        if (address?.starts(with: "cosmos1") == true && chain == ChainType.COSMOS_MAIN) { return true }
        else if (address?.starts(with: "iaa1") == true && chain == ChainType.IRIS_MAIN) { return true }
        else if (address?.starts(with: "bnb1") == true && chain == ChainType.BINANCE_MAIN) { return true }
        else if (address?.starts(with: "kava1") == true && chain == ChainType.KAVA_MAIN) { return true }
        else if (address?.starts(with: "star1") == true && chain == ChainType.IOV_MAIN) { return true }
        else if (address?.starts(with: "band1") == true && chain == ChainType.BAND_MAIN) { return true }
        else if (address?.starts(with: "secret1") == true && chain == ChainType.SECRET_MAIN) { return true }
        else if (address?.starts(with: "certik1") == true && chain == ChainType.CERTIK_MAIN) { return true }
        else if (address?.starts(with: "akash1") == true && chain == ChainType.AKASH_MAIN) { return true }
        else if (address?.starts(with: "persistence1") == true && chain == ChainType.PERSIS_MAIN) { return true }
        else if (address?.starts(with: "sent1") == true && chain == ChainType.SENTINEL_MAIN) { return true }
        else if (address?.starts(with: "fetch1") == true && chain == ChainType.FETCH_MAIN) { return true }
        else if (address?.starts(with: "cro1") == true && chain == ChainType.CRYPTO_MAIN) { return true }
        else if (address?.starts(with: "sif1") == true && chain == ChainType.SIF_MAIN) { return true }
        else if (address?.starts(with: "ki1") == true && chain == ChainType.KI_MAIN) { return true }
        else if (address?.starts(with: "panacea1") == true && chain == ChainType.MEDI_MAIN) { return true }
        else if (address?.starts(with: "osmo1") == true && chain == ChainType.OSMOSIS_MAIN) { return true }
        else if (address?.starts(with: "emoney1") == true && chain == ChainType.EMONEY_MAIN) { return true }
        else if (address?.starts(with: "rizon1") == true && chain == ChainType.RIZON_MAIN) { return true }
        else if (address?.starts(with: "juno1") == true && chain == ChainType.JUNO_MAIN) { return true }
        else if (address?.starts(with: "regen1") == true && chain == ChainType.REGEN_MAIN) { return true }
        else if (address?.starts(with: "bcna1") == true && chain == ChainType.BITCANA_MAIN) { return true }
        else if (address?.starts(with: "althea1") == true && chain == ChainType.ALTHEA_MAIN) { return true }
        else if (address?.starts(with: "stars1") == true && chain == ChainType.STARGAZE_MAIN) { return true }
        else if (address?.starts(with: "comdex1") == true && chain == ChainType.COMDEX_MAIN) { return true }
        else if (address?.starts(with: "inj1") == true && chain == ChainType.INJECTIVE_MAIN) { return true }
        else if (address?.starts(with: "bitsong1") == true && chain == ChainType.BITSONG_MAIN) { return true }
        else if (address?.starts(with: "desmos1") == true && chain == ChainType.DESMOS_MAIN) { return true }
        else if (address?.starts(with: "gravity1") == true && chain == ChainType.GRAVITY_BRIDGE_MAIN) { return true }
        else if (address?.starts(with: "lum1") == true && chain == ChainType.LUM_MAIN) { return true }
        else if (address?.starts(with: "chihuahua1") == true && chain == ChainType.CHIHUAHUA_MAIN) { return true }
        else if (address?.starts(with: "axelar1") == true && chain == ChainType.AXELAR_MAIN) { return true }
        else if (address?.starts(with: "darc1") == true && chain == ChainType.KONSTELLATION_MAIN) { return true }
        else if (address?.starts(with: "umee1") == true && chain == ChainType.UMEE_MAIN) { return true }
        else if (address?.starts(with: "evmos1") == true && chain == ChainType.EVMOS_MAIN) { return true }
        else if (address?.starts(with: "pb1") == true && chain == ChainType.PROVENANCE_MAIN) { return true }
        return false
    }
    
    static func getChainsFromAddress(_ address: String?) -> Array<ChainType>? {
        if (address?.starts(with: "0x") == true) {
            if (WKey.isValidEthAddress(address!)) {
                return [ChainType.OKEX_MAIN]
            } else {
                return nil
            }
        }
        
        if (!WKey.isValidateBech32(address ?? "")) { return nil }
        if (address?.starts(with: "cosmos1") == true) { return [ChainType.COSMOS_MAIN, ChainType.COSMOS_TEST] }
        else if (address?.starts(with: "iaa1") == true) { return [ChainType.IRIS_MAIN, ChainType.IRIS_TEST] }
        else if (address?.starts(with: "bnb1") == true) { return [ChainType.BINANCE_MAIN] }
        else if (address?.starts(with: "kava1") == true) { return [ChainType.KAVA_MAIN] }
        else if (address?.starts(with: "star1") == true) { return [ChainType.IOV_MAIN] }
        else if (address?.starts(with: "band1") == true) { return [ChainType.BAND_MAIN] }
        else if (address?.starts(with: "secret1") == true) { return [ChainType.SECRET_MAIN] }
        else if (address?.starts(with: "certik1") == true) { return [ChainType.CERTIK_MAIN] }
        else if (address?.starts(with: "akash1") == true) { return [ChainType.AKASH_MAIN] }
        else if (address?.starts(with: "persistence1") == true) { return [ChainType.PERSIS_MAIN] }
        else if (address?.starts(with: "sent1") == true) { return [ChainType.SENTINEL_MAIN] }
        else if (address?.starts(with: "fetch1") == true) { return [ChainType.FETCH_MAIN] }
        else if (address?.starts(with: "cro1") == true) { return [ChainType.CRYPTO_MAIN] }
        else if (address?.starts(with: "sif1") == true) { return [ChainType.SIF_MAIN] }
        else if (address?.starts(with: "ki1") == true) { return [ChainType.KI_MAIN] }
        else if (address?.starts(with: "panacea1") == true) { return [ChainType.MEDI_MAIN] }
        else if (address?.starts(with: "osmo1") == true) { return [ChainType.OSMOSIS_MAIN] }
        else if (address?.starts(with: "emoney1") == true) { return [ChainType.EMONEY_MAIN] }
        else if (address?.starts(with: "rizon1") == true) { return [ChainType.RIZON_MAIN] }
        else if (address?.starts(with: "juno1") == true) { return [ChainType.JUNO_MAIN] }
        else if (address?.starts(with: "regen1") == true) { return [ChainType.REGEN_MAIN] }
        else if (address?.starts(with: "bcna1") == true) { return [ChainType.BITCANA_MAIN] }
        else if (address?.starts(with: "althea1") == true) { return [ChainType.ALTHEA_MAIN] }
        else if (address?.starts(with: "stars1") == true) { return [ChainType.STARGAZE_MAIN] }
        else if (address?.starts(with: "comdex1") == true) { return [ChainType.COMDEX_MAIN] }
        else if (address?.starts(with: "inj1") == true) { return [ChainType.INJECTIVE_MAIN] }
        else if (address?.starts(with: "bitsong1") == true) { return [ChainType.BITSONG_MAIN] }
        else if (address?.starts(with: "desmos1") == true) { return [ChainType.DESMOS_MAIN] }
        else if (address?.starts(with: "gravity1") == true) { return [ChainType.GRAVITY_BRIDGE_MAIN] }
        else if (address?.starts(with: "lum1") == true) { return [ChainType.LUM_MAIN] }
        else if (address?.starts(with: "chihuahua1") == true) { return [ChainType.CHIHUAHUA_MAIN] }
        else if (address?.starts(with: "axelar1") == true) { return [ChainType.AXELAR_MAIN] }
        else if (address?.starts(with: "darc1") == true) { return [ChainType.KONSTELLATION_MAIN] }
        else if (address?.starts(with: "umee1") == true) { return [ChainType.UMEE_MAIN] }
        else if (address?.starts(with: "evmos1") == true) { return [ChainType.EVMOS_MAIN] }
        else if (address?.starts(with: "pb1") == true) { return [ChainType.PROVENANCE_MAIN] }
        
        return nil
    }
    
    static func getWalletName(_ account: Account?) -> String? {
        if (account == nil) {
            return  ""
        } else if (account!.account_nick_name == "") {
            return NSLocalizedString("wallet_dash", comment: "") + String(account!.account_id)
        } else {
            return account!.account_nick_name
        }
    }
    
    static func systemQuorum(_ chain: ChainType?) -> NSDecimalNumber {
        if (BaseData.instance.mParam != nil) {
            return BaseData.instance.mParam!.getQuorum()
        }
        return NSDecimalNumber.zero
    }
    
    
    //address, accountnumber, sequencenumber
    static func onParseAuthGrpc(_ response :Cosmos_Auth_V1beta1_QueryAccountResponse) -> (String?, UInt64?, UInt64?) {
        var rawAccount = response.account
        if (rawAccount.typeURL.contains(Desmos_Profiles_V1beta1_Profile.protoMessageName)) {
            rawAccount = try! Desmos_Profiles_V1beta1_Profile.init(serializedData: rawAccount.value).account
        }
        
        if (rawAccount.typeURL.contains(Cosmos_Auth_V1beta1_BaseAccount.protoMessageName)) {
            let auth = try! Cosmos_Auth_V1beta1_BaseAccount.init(serializedData: rawAccount.value)
            return (auth.address, auth.accountNumber, auth.sequence)
            
        } else if (rawAccount.typeURL.contains(Cosmos_Vesting_V1beta1_PeriodicVestingAccount.protoMessageName)) {
            let auth = try! Cosmos_Vesting_V1beta1_PeriodicVestingAccount.init(serializedData: rawAccount.value).baseVestingAccount.baseAccount
            return (auth.address, auth.accountNumber, auth.sequence)
            
        } else if (rawAccount.typeURL.contains(Cosmos_Vesting_V1beta1_ContinuousVestingAccount.protoMessageName)) {
            let auth = try! Cosmos_Vesting_V1beta1_ContinuousVestingAccount.init(serializedData: rawAccount.value).baseVestingAccount.baseAccount
            return (auth.address, auth.accountNumber, auth.sequence)
            
        } else if (rawAccount.typeURL.contains(Cosmos_Vesting_V1beta1_DelayedVestingAccount.protoMessageName)) {
            let auth = try! Cosmos_Vesting_V1beta1_DelayedVestingAccount.init(serializedData: rawAccount.value).baseVestingAccount.baseAccount
            return (auth.address, auth.accountNumber, auth.sequence)
            
        } else if (rawAccount.typeURL.contains(Injective_Types_V1beta1_EthAccount.protoMessageName)) {
            let auth = try! Injective_Types_V1beta1_EthAccount.init(serializedData: rawAccount.value).baseAccount
            return (auth.address, auth.accountNumber, auth.sequence)
        
        } else if (rawAccount.typeURL.contains(Ethermint_Types_V1_EthAccount.protoMessageName)) {
            let auth = try! Ethermint_Types_V1_EthAccount.init(serializedData: rawAccount.value).baseAccount
            return (auth.address, auth.accountNumber, auth.sequence)
        }
        
        return (nil, nil, nil)
    }
    
    
    static func onParseAuthAccount(_ chain: ChainType) {
        print("onParseAuthAccount")
        guard let rawAccount = BaseData.instance.mAccount_gRPC else { return }
        if (chain == ChainType.PERSIS_MAIN) {
            onParsePersisVestingAccount(rawAccount)
            
        } else if (chain == ChainType.DESMOS_MAIN && rawAccount.typeURL.contains(Desmos_Profiles_V1beta1_Profile.protoMessageName)) {
            if let profileAccount = try? Desmos_Profiles_V1beta1_Profile.init(serializedData: rawAccount.value) {
                onParseVestingAccount(chain, profileAccount.account)
            } else {
                onParseVestingAccount(chain, rawAccount)
            }
            
        } else if (chain == ChainType.INJECTIVE_MAIN && rawAccount.typeURL.contains(Injective_Types_V1beta1_EthAccount.protoMessageName)) {
//            print("rawAccount.typeURL ", rawAccount.typeURL)
//            if let ethAccount = try? Injective_Types_V1beta1_EthAccount.init(serializedData: rawAccount.value) {
//                onParseVestingAccount(chain, ethAccount.baseAccount)
//            } else {
//                onParseVestingAccount(chain, rawAccount)
//            }
            onParseVestingAccount(chain, rawAccount)
            
        } else if (chain == ChainType.EVMOS_MAIN && rawAccount.typeURL.contains(Ethermint_Types_V1_EthAccount.protoMessageName)) {
            onParseVestingAccount(chain, rawAccount)
        } else {
            onParseVestingAccount(chain, rawAccount)
        }
        
    }
    
    static func onParseVestingAccount(_ chain: ChainType, _ rawAccount: Google_Protobuf2_Any) {
        var sBalace = Array<Coin>()
        BaseData.instance.mMyBalances_gRPC.forEach { coin in
            sBalace.append(coin)
        }
//        print("sBalace ", sBalace)
        if (rawAccount.typeURL.contains(Cosmos_Vesting_V1beta1_PeriodicVestingAccount.protoMessageName)) {
//            print("PeriodicVestingAccount")
            let vestingAccount = try! Cosmos_Vesting_V1beta1_PeriodicVestingAccount.init(serializedData: rawAccount.value)
            sBalace.forEach({ (coin) in
                let denom = coin.denom
                var dpBalance = NSDecimalNumber.zero
                var dpVesting = NSDecimalNumber.zero
                var originalVesting = NSDecimalNumber.zero
                var remainVesting = NSDecimalNumber.zero
                var delegatedVesting = NSDecimalNumber.zero
                
                dpBalance = NSDecimalNumber.init(string: coin.amount)
//                print("dpBalance ", denom, "  ", dpBalance)
                
                vestingAccount.baseVestingAccount.originalVesting.forEach({ (coin) in
                    if (coin.denom == denom) {
                        originalVesting = originalVesting.adding(NSDecimalNumber.init(string: coin.amount))
                    }
                })
//                print("originalVesting ", denom, "  ", originalVesting)
                
                vestingAccount.baseVestingAccount.delegatedVesting.forEach({ (coin) in
                    if (coin.denom == denom) {
                        delegatedVesting = delegatedVesting.adding(NSDecimalNumber.init(string: coin.amount))
                    }
                })
//                print("delegatedVesting ", denom, "  ", delegatedVesting)
                
                remainVesting = WUtils.onParsePeriodicRemainVestingsAmountByDenom(vestingAccount, denom)
//                print("remainVesting ", denom, "  ", remainVesting)
                
                dpVesting = remainVesting.subtracting(delegatedVesting);
//                print("dpVestingA ", denom, "  ", dpVesting)
                
                dpVesting = dpVesting.compare(NSDecimalNumber.zero).rawValue <= 0 ? NSDecimalNumber.zero : dpVesting
//                print("dpVestingB ", denom, "  ", dpVesting)
                
                if (remainVesting.compare(delegatedVesting).rawValue > 0) {
                    dpBalance = dpBalance.subtracting(remainVesting).adding(delegatedVesting);
                }
//                print("final dpBalance ", denom, "  ", dpBalance)
                
                if (dpVesting.compare(NSDecimalNumber.zero).rawValue > 0) {
                    let vestingCoin = Coin.init(denom, dpVesting.stringValue)
                    BaseData.instance.mMyVestings_gRPC.append(vestingCoin)
                    var replace = -1
                    for i in 0..<BaseData.instance.mMyBalances_gRPC.count {
                        if (BaseData.instance.mMyBalances_gRPC[i].denom == denom) {
                            replace = i
                        }
                    }
                    if (replace >= 0) {
                        BaseData.instance.mMyBalances_gRPC[replace] = Coin.init(denom, dpBalance.stringValue)
                    }
                }
            })
            
        } else if (rawAccount.typeURL.contains(Cosmos_Vesting_V1beta1_ContinuousVestingAccount.protoMessageName)) {
//            print("ContinuousVestingAccount")
            let vestingAccount = try! Cosmos_Vesting_V1beta1_ContinuousVestingAccount.init(serializedData: rawAccount.value)
            sBalace.forEach({ (coin) in
                let denom = coin.denom
                var dpBalance = NSDecimalNumber.zero
                var dpVesting = NSDecimalNumber.zero
                var originalVesting = NSDecimalNumber.zero
                var remainVesting = NSDecimalNumber.zero
                var delegatedVesting = NSDecimalNumber.zero
                
                dpBalance = NSDecimalNumber.init(string: coin.amount)
//                print("dpBalance ", denom, "  ", dpBalance)
                
                vestingAccount.baseVestingAccount.originalVesting.forEach({ (coin) in
                    if (coin.denom == denom) {
                        originalVesting = originalVesting.adding(NSDecimalNumber.init(string: coin.amount))
                    }
                })
//                print("originalVesting ", denom, "  ", originalVesting)
                
                vestingAccount.baseVestingAccount.delegatedVesting.forEach({ (coin) in
                    if (coin.denom == denom) {
                        delegatedVesting = delegatedVesting.adding(NSDecimalNumber.init(string: coin.amount))
                    }
                })
//                print("delegatedVesting ", denom, "  ", delegatedVesting)
                
                let cTime = Date().millisecondsSince1970
                let vestingStart = vestingAccount.startTime * 1000
                let vestingEnd = vestingAccount.baseVestingAccount.endTime * 1000
                if (cTime < vestingStart) {
                    remainVesting = originalVesting
                } else if (cTime > vestingEnd) {
                    remainVesting = NSDecimalNumber.zero
                } else {
                    let progress = ((Float)(cTime - vestingStart)) / ((Float)(vestingEnd - vestingStart))
//                    print("progress ", progress)
                    remainVesting = originalVesting.multiplying(by: NSDecimalNumber.init(value: 1 - progress), withBehavior: handler0Up)
                }
//                print("remainVesting ", denom, "  ", remainVesting)
                
                dpVesting = remainVesting.subtracting(delegatedVesting);
//                print("dpVestingA ", denom, "  ", dpVesting)
                
                dpVesting = dpVesting.compare(NSDecimalNumber.zero).rawValue <= 0 ? NSDecimalNumber.zero : dpVesting
//                print("dpVestingB ", denom, "  ", dpVesting)
                
                if (remainVesting.compare(delegatedVesting).rawValue > 0) {
                    dpBalance = dpBalance.subtracting(remainVesting).adding(delegatedVesting);
                }
//                print("final dpBalance ", denom, "  ", dpBalance)
                
                if (dpVesting.compare(NSDecimalNumber.zero).rawValue > 0) {
                    let vestingCoin = Coin.init(denom, dpVesting.stringValue)
                    BaseData.instance.mMyVestings_gRPC.append(vestingCoin)
                    var replace = -1
                    for i in 0..<BaseData.instance.mMyBalances_gRPC.count {
                        if (BaseData.instance.mMyBalances_gRPC[i].denom == denom) {
                            replace = i
                        }
                    }
                    if (replace >= 0) {
                        BaseData.instance.mMyBalances_gRPC[replace] = Coin.init(denom, dpBalance.stringValue)
                    }
                }
                
            })
            
        } else if (rawAccount.typeURL.contains(Cosmos_Vesting_V1beta1_DelayedVestingAccount.protoMessageName)) {
//            print("DelayedVestingAccount")
            let vestingAccount = try! Cosmos_Vesting_V1beta1_DelayedVestingAccount.init(serializedData: rawAccount.value)
            sBalace.forEach({ (coin) in
                let denom = coin.denom
                var dpBalance = NSDecimalNumber.zero
                var dpVesting = NSDecimalNumber.zero
                var originalVesting = NSDecimalNumber.zero
                var remainVesting = NSDecimalNumber.zero
                var delegatedVesting = NSDecimalNumber.zero
                
                dpBalance = NSDecimalNumber.init(string: coin.amount)
//                print("dpBalance ", denom, "  ", dpBalance)
                
                vestingAccount.baseVestingAccount.originalVesting.forEach({ (coin) in
                    if (coin.denom == denom) {
                        originalVesting = originalVesting.adding(NSDecimalNumber.init(string: coin.amount))
                    }
                })
//                print("originalVesting ", denom, "  ", originalVesting)
                
                //looks bug for delegatedVesting with delayedVesting
//                vestingAccount.baseVestingAccount.delegatedVesting.forEach({ (coin) in
//                    if (coin.denom == denom) {
//                        delegatedVesting = delegatedVesting.adding(NSDecimalNumber.init(string: coin.amount))
//                    }
//                })
//                print("delegatedVesting ", denom, "  ", delegatedVesting)
                
                let cTime = Date().millisecondsSince1970
                let vestingEnd = vestingAccount.baseVestingAccount.endTime * 1000
                if (cTime < vestingEnd) {
                    remainVesting = originalVesting
                }
//                print("remainVesting ", denom, "  ", remainVesting)
                
                if (coin.denom == getMainDenom(chain)) {
                    let stakedAmount = BaseData.instance.getDelegatedSumAmount_gRPC()
                    if (remainVesting.compare(stakedAmount).rawValue >= 0){
                        delegatedVesting = stakedAmount
                    } else {
                        delegatedVesting = remainVesting
                    }
                }
//                print("delegatedVesting ", denom, "  ", delegatedVesting)
                
                dpVesting = remainVesting.subtracting(delegatedVesting);
//                print("dpVestingA ", denom, "  ", dpVesting)
                
                dpVesting = dpVesting.compare(NSDecimalNumber.zero).rawValue <= 0 ? NSDecimalNumber.zero : dpVesting
//                print("dpVestingB ", denom, "  ", dpVesting)
                
                if (remainVesting.compare(delegatedVesting).rawValue > 0) {
                    dpBalance = dpBalance.subtracting(remainVesting).adding(delegatedVesting);
                }
//                print("final dpBalance ", denom, "  ", dpBalance)
                
                if (dpVesting.compare(NSDecimalNumber.zero).rawValue > 0) {
                    let vestingCoin = Coin.init(denom, dpVesting.stringValue)
                    BaseData.instance.mMyVestings_gRPC.append(vestingCoin)
                    var replace = -1
                    for i in 0..<BaseData.instance.mMyBalances_gRPC.count {
                        if (BaseData.instance.mMyBalances_gRPC[i].denom == denom) {
                            replace = i
                        }
                    }
                    if (replace >= 0) {
                        BaseData.instance.mMyBalances_gRPC[replace] = Coin.init(denom, dpBalance.stringValue)
                    }
                }
                
            })
            
        }
    }
    
    static func onParsePersisVestingAccount(_ rawAccount: Google_Protobuf2_Any) {
        print("onParsePersisVestingAccount")
        var sBalace = Array<Coin>()
        BaseData.instance.mMyBalances_gRPC.forEach { coin in
            sBalace.append(coin)
        }
//        print("sBalace ", sBalace)
        if (rawAccount.typeURL.contains(Cosmos_Vesting_V1beta1_PeriodicVestingAccount.protoMessageName)) {
            let vestingAccount = try! Cosmos_Vesting_V1beta1_PeriodicVestingAccount.init(serializedData: rawAccount.value)
            sBalace.forEach({ (coin) in
                let denom = coin.denom
                var bankBalance = NSDecimalNumber.zero
                var dpBalance = NSDecimalNumber.zero
                var dpVesting = NSDecimalNumber.zero
                var remainVesting = NSDecimalNumber.zero
                
                bankBalance = NSDecimalNumber.init(string: coin.amount)
//                print("bankBalance ", denom, "  ", bankBalance)
                
                remainVesting = WUtils.onParsePeriodicRemainVestingsAmountByDenom(vestingAccount, denom)
//                print("remainVesting ", denom, "  ", remainVesting)
                
                dpBalance = bankBalance.compare(remainVesting).rawValue <= 0 ? NSDecimalNumber.zero : bankBalance.subtracting(remainVesting)
//                print("final dpBalance ", denom, "  ", dpBalance)
                
                dpVesting = bankBalance.subtracting(dpBalance)
//                print("dpVesting ", denom, "  ", dpVesting)
                
                let vestingCoin = Coin.init(denom, dpVesting.stringValue)
                BaseData.instance.mMyVestings_gRPC.append(vestingCoin)
                var replace = -1
                for i in 0..<BaseData.instance.mMyBalances_gRPC.count {
                    if (BaseData.instance.mMyBalances_gRPC[i].denom == denom) {
                        replace = i
                    }
                }
                if (replace >= 0) {
                    BaseData.instance.mMyBalances_gRPC[replace] = Coin.init(denom, dpBalance.stringValue)
                }
            })
            
        } else if (rawAccount.typeURL.contains(Cosmos_Vesting_V1beta1_ContinuousVestingAccount.protoMessageName)) {
            let vestingAccount = try! Cosmos_Vesting_V1beta1_ContinuousVestingAccount.init(serializedData: rawAccount.value)
            sBalace.forEach({ (coin) in
                let denom = coin.denom
                var bankBalance = NSDecimalNumber.zero
                var dpBalance = NSDecimalNumber.zero
                var dpVesting = NSDecimalNumber.zero
                var originalVesting = NSDecimalNumber.zero
                var remainVesting = NSDecimalNumber.zero
                
                bankBalance = NSDecimalNumber.init(string: coin.amount)
//                print("bankBalance ", denom, "  ", bankBalance)
                
                vestingAccount.baseVestingAccount.originalVesting.forEach({ (coin) in
                    if (coin.denom == denom) {
                        originalVesting = originalVesting.adding(NSDecimalNumber.init(string: coin.amount))
                    }
                })
//                print("originalVesting ", denom, "  ", originalVesting)
                
                let cTime = Date().millisecondsSince1970
                let vestingStart = vestingAccount.startTime * 1000
                let vestingEnd = vestingAccount.baseVestingAccount.endTime * 1000
                
                if (cTime < vestingStart) {
                    remainVesting = originalVesting
                } else if (cTime > vestingEnd) {
                    remainVesting = NSDecimalNumber.zero
                } else {
                    let progress = ((Float)(cTime - vestingStart)) / ((Float)(vestingEnd - vestingStart))
                    remainVesting = originalVesting.multiplying(by: NSDecimalNumber.init(value: 1 - progress), withBehavior: handler0Up)
                }
                
                if (remainVesting.compare(NSDecimalNumber.zero).rawValue > 0) {
                    dpBalance = NSDecimalNumber.zero
                    dpVesting = bankBalance
                    
                } else {
                    dpBalance = bankBalance
                    dpVesting = NSDecimalNumber.zero
                    
                }
                
                if (dpVesting.compare(NSDecimalNumber.zero).rawValue > 0) {
                    let vestingCoin = Coin.init(denom, dpVesting.stringValue)
                    BaseData.instance.mMyVestings_gRPC.append(vestingCoin)
                    var replace = -1
                    for i in 0..<BaseData.instance.mMyBalances_gRPC.count {
                        if (BaseData.instance.mMyBalances_gRPC[i].denom == denom) {
                            replace = i
                        }
                    }
                    if (replace >= 0) {
                        BaseData.instance.mMyBalances_gRPC[replace] = Coin.init(denom, dpBalance.stringValue)
                    }
                }
            })
        }
    }
    
    static func onParsePeriodicUnLockTime(_ vestingAccount: Cosmos_Vesting_V1beta1_PeriodicVestingAccount, _ position: Int) -> Int64 {
        var result = vestingAccount.startTime
        for i in 0..<(position + 1) {
            result = result + vestingAccount.vestingPeriods[i].length
        }
        return result * 1000
    }
    
    static func onParsePeriodicRemainVestings(_ vestingAccount: Cosmos_Vesting_V1beta1_PeriodicVestingAccount) -> Array<Cosmos_Vesting_V1beta1_Period> {
        var results = Array<Cosmos_Vesting_V1beta1_Period>()
        let cTime = Date().millisecondsSince1970
        for i in 0..<vestingAccount.vestingPeriods.count {
            let unlockTime = onParsePeriodicUnLockTime(vestingAccount, i)
            if (cTime < unlockTime) {
                let temp = Cosmos_Vesting_V1beta1_Period.with {
                    $0.length = unlockTime
                    $0.amount = vestingAccount.vestingPeriods[i].amount
                }
                results.append(temp)
            }
        }
        return results
    }
    
    static func onParsePeriodicRemainVestingsByDenom(_ vestingAccount: Cosmos_Vesting_V1beta1_PeriodicVestingAccount, _ denom: String) -> Array<Cosmos_Vesting_V1beta1_Period> {
        var results = Array<Cosmos_Vesting_V1beta1_Period>()
        for vp in onParsePeriodicRemainVestings(vestingAccount) {
            for coin in vp.amount {
                if (coin.denom ==  denom) {
                    results.append(vp)
                }
            }
        }
        return results
    }
    
    static func onParseAllPeriodicRemainVestingsCnt(_ vestingAccount: Cosmos_Vesting_V1beta1_PeriodicVestingAccount) -> Int {
        return onParsePeriodicRemainVestings(vestingAccount).count
    }
    
    static func onParsePeriodicRemainVestingsCntByDenom(_ vestingAccount: Cosmos_Vesting_V1beta1_PeriodicVestingAccount, _ denom: String) -> Int {
        return onParsePeriodicRemainVestingsByDenom(vestingAccount, denom).count
    }

    static func onParsePeriodicRemainVestingTime(_ vestingAccount: Cosmos_Vesting_V1beta1_PeriodicVestingAccount, _ denom: String, _ position: Int) -> Int64 {
        return onParsePeriodicRemainVestingsByDenom(vestingAccount, denom)[position].length
    }
    
    static func onParsePeriodicRemainVestingsAmountByDenom(_ vestingAccount: Cosmos_Vesting_V1beta1_PeriodicVestingAccount, _ denom: String) -> NSDecimalNumber {
        var results = NSDecimalNumber.zero
        let periods = onParsePeriodicRemainVestingsByDenom(vestingAccount, denom)
        for vp in periods {
            for coin in vp.amount {
                if (coin.denom ==  denom) {
                    results = results.adding(NSDecimalNumber.init(string: coin.amount))
                }
            }
        }
        return results
    }
    
    static func onParsePeriodicRemainVestingAmount(_ vestingAccount: Cosmos_Vesting_V1beta1_PeriodicVestingAccount, _ denom: String, _ position: Int) -> NSDecimalNumber {
        let periods = onParsePeriodicRemainVestingsByDenom(vestingAccount, denom)
        if (periods.count > position && periods[position] != nil) {
            let coin = periods[position].amount.filter { $0.denom == denom }.first
            return NSDecimalNumber.init(string: coin?.amount)
        }
        return NSDecimalNumber.zero
    }
    
    static func getAmountVp(_ vp: Cosmos_Vesting_V1beta1_Period, _ denom: String) -> NSDecimalNumber {
        var result = NSDecimalNumber.zero
        vp.amount.forEach { (coin) in
            if (coin.denom == denom) {
                result = NSDecimalNumber.init(string: coin.amount)
            }
        }
        return result
    }
    
    static func onParseFeeAmountGrpc(_ tx: Cosmos_Tx_V1beta1_GetTxResponse) -> NSDecimalNumber {
        let result = NSDecimalNumber.zero
        if (tx.tx.authInfo.fee.amount.count > 0) {
            return NSDecimalNumber.init(string: tx.tx.authInfo.fee.amount[0].amount)
        }
        return result
    }
    
    static func onParseAutoRewardGrpc(_ tx: Cosmos_Tx_V1beta1_GetTxResponse, _ position: Int) -> Array<Coin> {
        var result = Array<Coin>()
        if (tx.txResponse.logs == nil || tx.txResponse.logs.count <= position || tx.txResponse.logs[position] == nil)  { return result }
        tx.txResponse.logs[position].events.forEach { (event) in
            if (event.type == "transfer") {
                for i in 0...event.attributes.count - 1 {
                    if (event.attributes[i].key == "amount") {
                        let rawValue = event.attributes[i].value
                        for rawCoin in rawValue.split(separator: ","){
                            let coin = String(rawCoin)
                            if let range = coin.range(of: "[0-9]*", options: .regularExpression) {
                                let amount = String(coin[range])
                                let denomIndex = coin.index(coin.startIndex, offsetBy: amount.count)
                                let denom = String(coin[denomIndex...])
                                result.append(Coin.init(denom, amount))
                            }
                        }
                    }
                }
            }
        }
        return result
    }
    
    
    
    static func onParseStakeRewardGrpc(_ tx: Cosmos_Tx_V1beta1_GetTxResponse, _ position: Int) -> Array<Coin> {
        var result = Array<Coin>()
        if (tx.txResponse.logs == nil || tx.txResponse.logs.count <= position || tx.txResponse.logs[position] == nil)  { return result }
        tx.txResponse.logs[position].events.forEach { (event) in
            if (event.type == "withdraw_rewards") {
                for i in 0...event.attributes.count - 1 {
                    if (event.attributes[i].key == "amount") {
                        let rawValue = event.attributes[i].value
                        for rawCoin in rawValue.split(separator: ","){
                            let coin = String(rawCoin)
                            if let range = coin.range(of: "[0-9]*", options: .regularExpression) {
                                let amount = String(coin[range])
                                let denomIndex = coin.index(coin.startIndex, offsetBy: amount.count)
                                let denom = String(coin[denomIndex...])
                                result.append(Coin.init(denom, amount))
                            }
                        }
                    }
                }
            }
        }
        return result
    }
    
    static func onParseCommisiondGrpc(_ tx: Cosmos_Tx_V1beta1_GetTxResponse, _ position: Int) -> Array<Coin> {
        var result = Array<Coin>()
        if (tx.txResponse.logs == nil || tx.txResponse.logs.count <= position || tx.txResponse.logs[position] == nil)  { return result }
        tx.txResponse.logs[position].events.forEach { (event) in
            if (event.type == "withdraw_commission") {
                for i in 0...event.attributes.count - 1 {
                    if (event.attributes[i].key == "amount") {
                        let rawValue = event.attributes[i].value
                        for rawCoin in rawValue.split(separator: ","){
                            let coin = String(rawCoin)
                            if let range = coin.range(of: "[0-9]*", options: .regularExpression) {
                                let amount = String(coin[range])
                                let denomIndex = coin.index(coin.startIndex, offsetBy: amount.count)
                                let denom = String(coin[denomIndex...])
                                result.append(Coin.init(denom, amount))
                            }
                        }
                    }
                }
            }
        }
        return result
    }
    
    static func onParseKavaIncentiveGrpc(_ tx: Cosmos_Tx_V1beta1_GetTxResponse, _ position: Int) -> Array<Coin> {
        var result = Array<Coin>()
        if (tx.txResponse.logs == nil || tx.txResponse.logs.count <= position || tx.txResponse.logs[position] == nil)  { return result }
        tx.txResponse.logs[position].events.forEach { (event) in
            if (event.type == "claim_reward") {
                for i in 0...event.attributes.count - 1 {
                    if (event.attributes[i].key == "claim_amount") {
                        let rawValue = event.attributes[i].value
                        for rawCoin in rawValue.split(separator: ","){
                            let coin = String(rawCoin)
                            if let range = coin.range(of: "[0-9]*", options: .regularExpression) {
                                let amount = String(coin[range])
                                let denomIndex = coin.index(coin.startIndex, offsetBy: amount.count)
                                let denom = String(coin[denomIndex...])
                                result.append(Coin.init(denom, amount))
                            }
                        }
                    }
                }
            }
        }
        return result
    }
    
    static func onParseBep3ClaimAmountGrpc(_ tx: Cosmos_Tx_V1beta1_GetTxResponse, _ position: Int) -> Array<Coin> {
        var result = Array<Coin>()
        if (tx.txResponse.logs == nil || tx.txResponse.logs.count <= position || tx.txResponse.logs[position] == nil)  { return result }
        tx.txResponse.logs[position].events.forEach { (event) in
            if (event.type == "transfer") {
                for i in 0...event.attributes.count - 1 {
                    if (event.attributes[i].key == "amount") {
                        let rawValue = event.attributes[i].value
                        for rawCoin in rawValue.split(separator: ","){
                            let coin = String(rawCoin)
                            if let range = coin.range(of: "[0-9]*", options: .regularExpression) {
                                let amount = String(coin[range])
                                let denomIndex = coin.index(coin.startIndex, offsetBy: amount.count)
                                let denom = String(coin[denomIndex...])
                                result.append(Coin.init(denom, amount))
                            }
                        }
                    }
                }
            }
        }
        return result
    }
    
    static func onParseProposalTitle(_ proposalContent: Google_Protobuf2_Any) -> String {
        if (proposalContent.typeURL.contains(Cosmos_Gov_V1beta1_TextProposal.protoMessageName)) {
            let textProposal = try! Cosmos_Gov_V1beta1_TextProposal.init(serializedData: proposalContent.value)
            return textProposal.title
            
        } else if (proposalContent.typeURL.contains(Cosmos_Params_V1beta1_ParameterChangeProposal.protoMessageName)) {
            let paramProposal = try! Cosmos_Params_V1beta1_ParameterChangeProposal.init(serializedData: proposalContent.value)
            return paramProposal.title
            
        } else if (proposalContent.typeURL.contains(Ibc_Core_Client_V1_ClientUpdateProposal.protoMessageName)) {
            let clientProposal = try! Ibc_Core_Client_V1_ClientUpdateProposal.init(serializedData: proposalContent.value)
            return clientProposal.title
            
        } else if (proposalContent.typeURL.contains(Cosmos_Distribution_V1beta1_CommunityPoolSpendProposal.protoMessageName)) {
            let poolProposal = try! Cosmos_Distribution_V1beta1_CommunityPoolSpendProposal.init(serializedData: proposalContent.value)
            return poolProposal.title
            
        } else if (proposalContent.typeURL.contains(Cosmos_Upgrade_V1beta1_SoftwareUpgradeProposal.protoMessageName)) {
            let upgradeProposal = try! Cosmos_Upgrade_V1beta1_SoftwareUpgradeProposal.init(serializedData: proposalContent.value)
            return upgradeProposal.title
            
        } else if (proposalContent.typeURL.contains(Cosmos_Upgrade_V1beta1_CancelSoftwareUpgradeProposal.protoMessageName)) {
            let cancelProposal = try! Cosmos_Upgrade_V1beta1_CancelSoftwareUpgradeProposal.init(serializedData: proposalContent.value)
            return cancelProposal.title
            
        } else if (proposalContent.typeURL.contains(Osmosis_Poolincentives_V1beta1_UpdatePoolIncentivesProposal.protoMessageName)) {
            let PoolIncentiveProposal = try! Osmosis_Poolincentives_V1beta1_UpdatePoolIncentivesProposal.init(serializedData: proposalContent.value)
            return PoolIncentiveProposal.title
            
        } else if (proposalContent.typeURL.contains(Osmosis_Poolincentives_V1beta1_ReplacePoolIncentivesProposal.protoMessageName)) {
            let ReplacePoolIncentive = try! Osmosis_Poolincentives_V1beta1_ReplacePoolIncentivesProposal.init(serializedData: proposalContent.value)
            return ReplacePoolIncentive.title
            
        }
        return ""
    }
    
    static func onParseProposalDescription(_ proposalContent: Google_Protobuf2_Any) -> String {
        if (proposalContent.typeURL.contains(Cosmos_Gov_V1beta1_TextProposal.protoMessageName)) {
            let textProposal = try! Cosmos_Gov_V1beta1_TextProposal.init(serializedData: proposalContent.value)
            return textProposal.description_p
            
        } else if (proposalContent.typeURL.contains(Cosmos_Params_V1beta1_ParameterChangeProposal.protoMessageName)) {
            let paramProposal = try! Cosmos_Params_V1beta1_ParameterChangeProposal.init(serializedData: proposalContent.value)
            return paramProposal.description_p
            
        } else if (proposalContent.typeURL.contains(Ibc_Core_Client_V1_ClientUpdateProposal.protoMessageName)) {
            let clientProposal = try! Ibc_Core_Client_V1_ClientUpdateProposal.init(serializedData: proposalContent.value)
            return clientProposal.description_p
            
        } else if (proposalContent.typeURL.contains(Cosmos_Distribution_V1beta1_CommunityPoolSpendProposal.protoMessageName)) {
            let poolProposal = try! Cosmos_Distribution_V1beta1_CommunityPoolSpendProposal.init(serializedData: proposalContent.value)
            return poolProposal.description_p
            
        } else if (proposalContent.typeURL.contains(Cosmos_Upgrade_V1beta1_SoftwareUpgradeProposal.protoMessageName)) {
            let upgradeProposal = try! Cosmos_Upgrade_V1beta1_SoftwareUpgradeProposal.init(serializedData: proposalContent.value)
            return upgradeProposal.description_p
            
        } else if (proposalContent.typeURL.contains(Cosmos_Upgrade_V1beta1_CancelSoftwareUpgradeProposal.protoMessageName)) {
            let cancelProposal = try! Cosmos_Upgrade_V1beta1_CancelSoftwareUpgradeProposal.init(serializedData: proposalContent.value)
            return cancelProposal.description_p
            
        } else if (proposalContent.typeURL.contains(Osmosis_Poolincentives_V1beta1_UpdatePoolIncentivesProposal.protoMessageName)) {
            let PoolIncentiveProposal = try! Osmosis_Poolincentives_V1beta1_UpdatePoolIncentivesProposal.init(serializedData: proposalContent.value)
            return PoolIncentiveProposal.description_p
            
        } else if (proposalContent.typeURL.contains(Osmosis_Poolincentives_V1beta1_ReplacePoolIncentivesProposal.protoMessageName)) {
            let ReplacePoolIncentive = try! Osmosis_Poolincentives_V1beta1_ReplacePoolIncentivesProposal.init(serializedData: proposalContent.value)
            return ReplacePoolIncentive.description_p
            
        }
        return ""
    }
    
    static func onParseProposalRequestAmount(_ proposalContent: Google_Protobuf2_Any) -> Coin? {
        if (proposalContent.typeURL.contains(Cosmos_Distribution_V1beta1_CommunityPoolSpendProposal.protoMessageName)) {
            let poolProposal = try! Cosmos_Distribution_V1beta1_CommunityPoolSpendProposal.init(serializedData: proposalContent.value)
            return Coin.init(poolProposal.amount[0].denom, poolProposal.amount[0].amount)
        } else {
            return nil;
        }
    }
    
    static func onProposalProposer(_ proposal: MintscanProposalDetail?) -> String? {
        if (proposal?.moniker?.isEmpty == true) {
            return proposal?.proposer
        } else {
            return proposal?.moniker
        }
    }
    
    static func onProposalStatusTxt(_ proposal: MintscanProposalDetail?) -> String {
        if (proposal?.proposal_status?.localizedCaseInsensitiveContains("DEPOSIT") == true) {
            return "DepositPeriod"
        } else if (proposal?.proposal_status?.localizedCaseInsensitiveContains("VOTING") == true) {
            return "VotingPeriod"
        } else if (proposal?.proposal_status?.localizedCaseInsensitiveContains("PASSED") == true) {
            return "Passed"
        } else if (proposal?.proposal_status?.localizedCaseInsensitiveContains("REJECTED") == true) {
            return "Rejected"
        }
        return "unKnown"
    }
    
    static func onParseProposalStatusTxt(_ proposal: Cosmos_Gov_V1beta1_Proposal) -> String {
        if (proposal.status == Cosmos_Gov_V1beta1_ProposalStatus.depositPeriod) {
            return "DepositPeriod"
        } else if (proposal.status == Cosmos_Gov_V1beta1_ProposalStatus.votingPeriod) {
            return "VotingPeriod"
        } else if (proposal.status == Cosmos_Gov_V1beta1_ProposalStatus.passed) {
            return "Passed"
        } else if (proposal.status == Cosmos_Gov_V1beta1_ProposalStatus.rejected) {
            return "Rejected"
        }
        return "unKnown"
    }
    
    static func onParseProposalStatusCertikTxt(_ status: Shentu_Gov_V1alpha1_ProposalStatus) -> String {
        if (status == Shentu_Gov_V1alpha1_ProposalStatus.depositPeriod) {
            return "DepositPeriod"
        } else if (status == Shentu_Gov_V1alpha1_ProposalStatus.certifierVotingPeriod || status == Shentu_Gov_V1alpha1_ProposalStatus.validatorVotingPeriod) {
            return "VotingPeriod"
        } else if (status == Shentu_Gov_V1alpha1_ProposalStatus.passed) {
            return "Passed"
        } else if (status == Shentu_Gov_V1alpha1_ProposalStatus.rejected) {
            return "Rejected"
        } else if (status == Shentu_Gov_V1alpha1_ProposalStatus.failed) {
            return "Failed"
        }
        return "unKnown"
    }
    
    static func onProposalStatusImg(_ proposal: MintscanProposalDetail?) -> UIImage? {
        if (proposal?.proposal_status?.localizedCaseInsensitiveContains("DEPOSIT") == true) {
            return UIImage.init(named: "depositImg")
        } else if (proposal?.proposal_status?.localizedCaseInsensitiveContains("VOTING") == true) {
            return UIImage.init(named: "votingImg")
        } else if (proposal?.proposal_status?.localizedCaseInsensitiveContains("PASSED") == true) {
            return UIImage.init(named: "passedImg")
        } else if (proposal?.proposal_status?.localizedCaseInsensitiveContains("REJECTED") == true) {
            return UIImage.init(named: "rejectedImg")
        }
        return nil
    }
    
    static func onParseProposalStatusImg(_ proposal: Cosmos_Gov_V1beta1_Proposal) -> UIImage? {
        if (proposal.status == Cosmos_Gov_V1beta1_ProposalStatus.depositPeriod) {
            return UIImage.init(named: "depositImg")
        } else if (proposal.status == Cosmos_Gov_V1beta1_ProposalStatus.votingPeriod) {
            return UIImage.init(named: "votingImg")
        } else if (proposal.status == Cosmos_Gov_V1beta1_ProposalStatus.passed) {
            return UIImage.init(named: "passedImg")
        } else if (proposal.status == Cosmos_Gov_V1beta1_ProposalStatus.rejected) {
            return UIImage.init(named: "rejectedImg")
        }
        return nil
    }
    
    static func onParseProposalStatusCertikImg(_ status: Shentu_Gov_V1alpha1_ProposalStatus) -> UIImage? {
        if (status == Shentu_Gov_V1alpha1_ProposalStatus.depositPeriod) {
            return UIImage.init(named: "depositImg")
        } else if (status == Shentu_Gov_V1alpha1_ProposalStatus.certifierVotingPeriod || status == Shentu_Gov_V1alpha1_ProposalStatus.validatorVotingPeriod) {
            return UIImage.init(named: "votingImg")
        } else if (status == Shentu_Gov_V1alpha1_ProposalStatus.passed) {
            return UIImage.init(named: "passedImg")
        } else if (status == Shentu_Gov_V1alpha1_ProposalStatus.rejected) {
            return UIImage.init(named: "rejectedImg")
        } else if (status == Shentu_Gov_V1alpha1_ProposalStatus.failed) {
            return UIImage.init(named: "rejectedImg")
        }
        return nil
    }
    
    static func onParseProposalStartTime(_ proposal: Cosmos_Gov_V1beta1_Proposal) -> String {
        if (proposal.status == Cosmos_Gov_V1beta1_ProposalStatus.depositPeriod) {
            return "Waiting Deposit"
        } else {
            return longTimetoString(proposal.votingStartTime.seconds * 1000)
        }
    }
    
    static func onParseProposalCertikStartTime(_ proposal: Shentu_Gov_V1alpha1_Proposal) -> String {
        if (proposal.status == Shentu_Gov_V1alpha1_ProposalStatus.depositPeriod) {
            return "Waiting Deposit"
        } else {
            return longTimetoString(proposal.votingStartTime.seconds * 1000)
        }
    }
    
    static func onParseProposalEndTime(_ proposal: Cosmos_Gov_V1beta1_Proposal) -> String {
        if (proposal.status == Cosmos_Gov_V1beta1_ProposalStatus.depositPeriod) {
            return "Waiting Deposit"
        } else {
            return longTimetoString(proposal.votingEndTime.seconds * 1000)
        }
    }
    
    static func onParseProposalCertikEndTime(_ proposal: Shentu_Gov_V1alpha1_Proposal) -> String {
        if (proposal.status == Shentu_Gov_V1alpha1_ProposalStatus.depositPeriod) {
            return "Waiting Deposit"
        } else {
            return longTimetoString(proposal.votingEndTime.seconds * 1000)
        }
    }
    
    
    static func getSum(_ tally:Cosmos_Gov_V1beta1_TallyResult) ->NSDecimalNumber {
        var sum = NSDecimalNumber.zero
        sum = sum.adding(NSDecimalNumber.init(string: tally.yes))
        sum = sum.adding(NSDecimalNumber.init(string: tally.no))
        sum = sum.adding(NSDecimalNumber.init(string: tally.noWithVeto))
        sum = sum.adding(NSDecimalNumber.init(string: tally.abstain))
        return sum
    }
    
    static func getYes(_ tally:Cosmos_Gov_V1beta1_TallyResult) -> NSDecimalNumber {
        if (getSum(tally) == NSDecimalNumber.zero) {
            return NSDecimalNumber.zero
        }
        return NSDecimalNumber.init(string: tally.yes).multiplying(byPowerOf10: 2).dividing(by: getSum(tally), withBehavior: WUtils.handler2)
    }
    
    static func getNo(_ tally:Cosmos_Gov_V1beta1_TallyResult) -> NSDecimalNumber {
        if (getSum(tally) == NSDecimalNumber.zero) {
            return NSDecimalNumber.zero
        }
        return NSDecimalNumber.init(string: tally.no).multiplying(byPowerOf10: 2).dividing(by: getSum(tally), withBehavior: WUtils.handler2)
    }
    
    static func getVeto(_ tally:Cosmos_Gov_V1beta1_TallyResult) -> NSDecimalNumber {
        if (getSum(tally) == NSDecimalNumber.zero) {
            return NSDecimalNumber.zero
        }
        return NSDecimalNumber.init(string: tally.noWithVeto).multiplying(byPowerOf10: 2).dividing(by: getSum(tally), withBehavior: WUtils.handler2)
    }
    
    static func getAbstain(_ tally:Cosmos_Gov_V1beta1_TallyResult) -> NSDecimalNumber {
        if (getSum(tally) == NSDecimalNumber.zero) {
            return NSDecimalNumber.zero
        }
        return NSDecimalNumber.init(string: tally.abstain).multiplying(byPowerOf10: 2).dividing(by: getSum(tally), withBehavior: WUtils.handler2)
    }
    
    static func getTurnout(_ tally:Cosmos_Gov_V1beta1_TallyResult) -> NSDecimalNumber {
        guard let param = BaseData.instance.mParam else {
            return NSDecimalNumber.zero
        }
        return getSum(tally).multiplying(byPowerOf10: 2).dividing(by: param.getBondedAmount(), withBehavior: WUtils.handler2)
    }
    
    static func getVoterTypeCnt_gRPC(_ votes: Array<Cosmos_Gov_V1beta1_Vote>?, _ option: Cosmos_Gov_V1beta1_VoteOption) -> String {
        var result = 0
        if (votes == nil) {
            return String(result)
        }
        for vote in votes! {
            if (vote.option == option) {
                result = result + 1
            }
        }
        return String(result)
    }
    
    static func getCertikVoterTypeCnt_gRPC(_ votes: Array<Shentu_Gov_V1alpha1_Vote>?, _ option: Cosmos_Gov_V1beta1_VoteOption) -> String {
        var result = 0
        if (votes == nil) {
            return String(result)
        }
        for vote in votes! {
            if (vote.deposit.option == option) {
                result = result + 1
            }
        }
        return String(result)
    }
    
    public static func isGRPC(_ chain: ChainType?) -> Bool {
        if (chain == ChainType.BINANCE_MAIN || chain == ChainType.OKEX_MAIN) {
            return false
        }
        return true
    }
}

extension Date {
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    var StringmillisecondsSince1970:String {
        return String((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    var Stringmilli3MonthAgo:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0) - TimeInterval(7776000000.0).rounded())
    }
    
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }

    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }

    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
    
    func hexToString() -> String{
        var finalString = ""
        let chars = Array(self)
        
        for count in stride(from: 0, to: chars.count - 1, by: 2){
            let firstDigit =  Int.init("\(chars[count])", radix: 16) ?? 0
            let lastDigit = Int.init("\(chars[count + 1])", radix: 16) ?? 0
            let decimal = firstDigit * 16 + lastDigit
            let decimalString = String(format: "%c", decimal) as String
            finalString.append(Character.init(decimalString))
        }
        return finalString
        
    }
}


extension UIImage {
    
    public class func gifImageWithData(_ data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            return nil
        }
        
        return UIImage.animatedImageWithSource(source)
    }
    
    public class func gifImageWithURL(_ gifUrl:String) -> UIImage? {
        guard let bundleURL:URL? = URL(string: gifUrl)
            else {
                return nil
        }
        guard let imageData = try? Data(contentsOf: bundleURL!) else {
            return nil
        }
        
        return gifImageWithData(imageData)
    }
    
    public class func gifImageWithName(_ name: String) -> UIImage? {
        guard let bundleURL = Bundle.main
            .url(forResource: name, withExtension: "gif") else {
                return nil
        }
        guard let imageData = try? Data(contentsOf: bundleURL) else {
            return nil
        }
        
        return gifImageWithData(imageData)
    }
    
    class func delayForImageAtIndex(_ index: Int, source: CGImageSource!) -> Double {
        var delay = 0.1
        
        let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
        let gifProperties: CFDictionary = unsafeBitCast(
            CFDictionaryGetValue(cfProperties,
                                 Unmanaged.passUnretained(kCGImagePropertyGIFDictionary).toOpaque()),
            to: CFDictionary.self)
        
        var delayObject: AnyObject = unsafeBitCast(
            CFDictionaryGetValue(gifProperties,
                                 Unmanaged.passUnretained(kCGImagePropertyGIFUnclampedDelayTime).toOpaque()),
            to: AnyObject.self)
        if delayObject.doubleValue == 0 {
            delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties,
                                                             Unmanaged.passUnretained(kCGImagePropertyGIFDelayTime).toOpaque()), to: AnyObject.self)
        }
        
        delay = delayObject as! Double
        
        if delay < 0.1 {
            delay = 0.1
        }
        
        return delay
    }
    
    class func gcdForPair(_ a: Int?, _ b: Int?) -> Int {
        var a = a
        var b = b
        if b == nil || a == nil {
            if b != nil {
                return b!
            } else if a != nil {
                return a!
            } else {
                return 0
            }
        }
        
        if a! < b! {
            let c = a
            a = b
            b = c
        }
        
        var rest: Int
        while true {
            rest = a! % b!
            
            if rest == 0 {
                return b!
            } else {
                a = b
                b = rest
            }
        }
    }
    
    class func gcdForArray(_ array: Array<Int>) -> Int {
        if array.isEmpty {
            return 1
        }
        
        var gcd = array[0]
        
        for val in array {
            gcd = UIImage.gcdForPair(val, gcd)
        }
        
        return gcd
    }
    
    class func animatedImageWithSource(_ source: CGImageSource) -> UIImage? {
        let count = CGImageSourceGetCount(source)
        var images = [CGImage]()
        var delays = [Int]()
        
        for i in 0..<count {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(image)
            }
            
            let delaySeconds = UIImage.delayForImageAtIndex(Int(i), source: source)
            delays.append(Int(delaySeconds * 3000.0)) // Seconds to ms
        }
        
        let duration: Int = {
            var sum = 0
            
            for val: Int in delays {
                sum += val
            }
            
            return sum
        }()
        
        let gcd = gcdForArray(delays)
        var frames = [UIImage]()
        
        var frame: UIImage
        var frameCount: Int
        for i in 0..<count {
            frame = UIImage(cgImage: images[Int(i)])
            frameCount = Int(delays[Int(i)] / gcd)
            
            for _ in 0..<frameCount {
                frames.append(frame)
            }
        }
        
        let animation = UIImage.animatedImage(with: frames,
                                              duration: Double(duration) / 3000.0)
        
        return animation
    }
}


open class CustomSlider : UISlider {
    @IBInspectable open var trackWidth:CGFloat = 2 {
        didSet {setNeedsDisplay()}
    }

    override open func trackRect(forBounds bounds: CGRect) -> CGRect {
        let defaultBounds = super.trackRect(forBounds: bounds)
        return CGRect(
            x: defaultBounds.origin.x,
            y: defaultBounds.origin.y + defaultBounds.size.height/2 - trackWidth/2,
            width: defaultBounds.size.width,
            height: trackWidth
        )
    }
}
