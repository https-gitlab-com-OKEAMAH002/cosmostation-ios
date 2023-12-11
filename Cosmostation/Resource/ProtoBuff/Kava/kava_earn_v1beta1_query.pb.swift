// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: kava/earn/v1beta1/query.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// QueryParamsRequest defines the request type for querying x/earn parameters.
struct Kava_Earn_V1beta1_QueryParamsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryParamsResponse defines the response type for querying x/earn parameters.
struct Kava_Earn_V1beta1_QueryParamsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// params represents the earn module parameters
  var params: Kava_Earn_V1beta1_Params {
    get {return _params ?? Kava_Earn_V1beta1_Params()}
    set {_params = newValue}
  }
  /// Returns true if `params` has been explicitly set.
  var hasParams: Bool {return self._params != nil}
  /// Clears the value of `params`. Subsequent reads from it will return its default value.
  mutating func clearParams() {self._params = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _params: Kava_Earn_V1beta1_Params? = nil
}

/// QueryVaultsRequest is the request type for the Query/Vaults RPC method.
struct Kava_Earn_V1beta1_QueryVaultsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryVaultsResponse is the response type for the Query/Vaults RPC method.
struct Kava_Earn_V1beta1_QueryVaultsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// vaults represents the earn module vaults
  var vaults: [Kava_Earn_V1beta1_VaultResponse] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryVaultRequest is the request type for the Query/Vault RPC method.
struct Kava_Earn_V1beta1_QueryVaultRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// vault filters vault by denom
  var denom: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryVaultResponse is the response type for the Query/Vault RPC method.
struct Kava_Earn_V1beta1_QueryVaultResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// vault represents the queried earn module vault
  var vault: Kava_Earn_V1beta1_VaultResponse {
    get {return _vault ?? Kava_Earn_V1beta1_VaultResponse()}
    set {_vault = newValue}
  }
  /// Returns true if `vault` has been explicitly set.
  var hasVault: Bool {return self._vault != nil}
  /// Clears the value of `vault`. Subsequent reads from it will return its default value.
  mutating func clearVault() {self._vault = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _vault: Kava_Earn_V1beta1_VaultResponse? = nil
}

/// VaultResponse is the response type for a vault.
struct Kava_Earn_V1beta1_VaultResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// denom represents the denom of the vault
  var denom: String = String()

  /// VaultStrategy is the strategy used for this vault.
  var strategies: [Kava_Earn_V1beta1_StrategyType] = []

  /// IsPrivateVault is true if the vault only allows depositors contained in
  /// AllowedDepositors.
  var isPrivateVault: Bool = false

  /// AllowedDepositors is a list of addresses that are allowed to deposit to
  /// this vault if IsPrivateVault is true. Addresses not contained in this list
  /// are not allowed to deposit into this vault. If IsPrivateVault is false,
  /// this should be empty and ignored.
  var allowedDepositors: [String] = []

  /// TotalShares is the total amount of shares issued to depositors.
  var totalShares: String = String()

  /// TotalValue is the total value of denom coins supplied to the vault if the
  /// vault were to be liquidated.
  var totalValue: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryDepositsRequest is the request type for the Query/Deposits RPC method.
struct Kava_Earn_V1beta1_QueryDepositsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// depositor optionally filters deposits by depositor
  var depositor: String = String()

  /// denom optionally filters deposits by vault denom
  var denom: String = String()

  /// respond with vault value in ukava for bkava vaults
  var valueInStakedTokens: Bool = false

  /// pagination defines an optional pagination for the request.
  var pagination: Cosmos_Base_Query_V1beta1_PageRequest {
    get {return _pagination ?? Cosmos_Base_Query_V1beta1_PageRequest()}
    set {_pagination = newValue}
  }
  /// Returns true if `pagination` has been explicitly set.
  var hasPagination: Bool {return self._pagination != nil}
  /// Clears the value of `pagination`. Subsequent reads from it will return its default value.
  mutating func clearPagination() {self._pagination = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _pagination: Cosmos_Base_Query_V1beta1_PageRequest? = nil
}

/// QueryDepositsResponse is the response type for the Query/Deposits RPC method.
struct Kava_Earn_V1beta1_QueryDepositsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// deposits returns the deposits matching the requested parameters
  var deposits: [Kava_Earn_V1beta1_DepositResponse] = []

  /// pagination defines the pagination in the response.
  var pagination: Cosmos_Base_Query_V1beta1_PageResponse {
    get {return _pagination ?? Cosmos_Base_Query_V1beta1_PageResponse()}
    set {_pagination = newValue}
  }
  /// Returns true if `pagination` has been explicitly set.
  var hasPagination: Bool {return self._pagination != nil}
  /// Clears the value of `pagination`. Subsequent reads from it will return its default value.
  mutating func clearPagination() {self._pagination = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _pagination: Cosmos_Base_Query_V1beta1_PageResponse? = nil
}

/// DepositResponse defines a deposit query response type.
struct Kava_Earn_V1beta1_DepositResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// depositor represents the owner of the deposit.
  var depositor: String = String()

  /// Shares represent the issued shares from their corresponding vaults.
  var shares: [Kava_Earn_V1beta1_VaultShare] = []

  /// Value represents the total accumulated value of denom coins supplied to
  /// vaults. This may be greater than or equal to amount_supplied depending on
  /// the strategy.
  var value: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryTotalSupplyRequest defines the request type for Query/TotalSupply method.
struct Kava_Earn_V1beta1_QueryTotalSupplyRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// TotalSupplyResponse defines the response type for the Query/TotalSupply method.
struct Kava_Earn_V1beta1_QueryTotalSupplyResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Height is the block height at which these totals apply
  var height: Int64 = 0

  /// Result is a list of coins supplied to earn
  var result: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Kava_Earn_V1beta1_QueryParamsRequest: @unchecked Sendable {}
extension Kava_Earn_V1beta1_QueryParamsResponse: @unchecked Sendable {}
extension Kava_Earn_V1beta1_QueryVaultsRequest: @unchecked Sendable {}
extension Kava_Earn_V1beta1_QueryVaultsResponse: @unchecked Sendable {}
extension Kava_Earn_V1beta1_QueryVaultRequest: @unchecked Sendable {}
extension Kava_Earn_V1beta1_QueryVaultResponse: @unchecked Sendable {}
extension Kava_Earn_V1beta1_VaultResponse: @unchecked Sendable {}
extension Kava_Earn_V1beta1_QueryDepositsRequest: @unchecked Sendable {}
extension Kava_Earn_V1beta1_QueryDepositsResponse: @unchecked Sendable {}
extension Kava_Earn_V1beta1_DepositResponse: @unchecked Sendable {}
extension Kava_Earn_V1beta1_QueryTotalSupplyRequest: @unchecked Sendable {}
extension Kava_Earn_V1beta1_QueryTotalSupplyResponse: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "kava.earn.v1beta1"

extension Kava_Earn_V1beta1_QueryParamsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryParamsRequest"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Earn_V1beta1_QueryParamsRequest, rhs: Kava_Earn_V1beta1_QueryParamsRequest) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Earn_V1beta1_QueryParamsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryParamsResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "params"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._params) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._params {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Earn_V1beta1_QueryParamsResponse, rhs: Kava_Earn_V1beta1_QueryParamsResponse) -> Bool {
    if lhs._params != rhs._params {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Earn_V1beta1_QueryVaultsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryVaultsRequest"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Earn_V1beta1_QueryVaultsRequest, rhs: Kava_Earn_V1beta1_QueryVaultsRequest) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Earn_V1beta1_QueryVaultsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryVaultsResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "vaults"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.vaults) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.vaults.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.vaults, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Earn_V1beta1_QueryVaultsResponse, rhs: Kava_Earn_V1beta1_QueryVaultsResponse) -> Bool {
    if lhs.vaults != rhs.vaults {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Earn_V1beta1_QueryVaultRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryVaultRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "denom"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.denom) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.denom.isEmpty {
      try visitor.visitSingularStringField(value: self.denom, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Earn_V1beta1_QueryVaultRequest, rhs: Kava_Earn_V1beta1_QueryVaultRequest) -> Bool {
    if lhs.denom != rhs.denom {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Earn_V1beta1_QueryVaultResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryVaultResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "vault"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._vault) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._vault {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Earn_V1beta1_QueryVaultResponse, rhs: Kava_Earn_V1beta1_QueryVaultResponse) -> Bool {
    if lhs._vault != rhs._vault {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Earn_V1beta1_VaultResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".VaultResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "denom"),
    2: .same(proto: "strategies"),
    3: .standard(proto: "is_private_vault"),
    4: .standard(proto: "allowed_depositors"),
    5: .standard(proto: "total_shares"),
    6: .standard(proto: "total_value"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.denom) }()
      case 2: try { try decoder.decodeRepeatedEnumField(value: &self.strategies) }()
      case 3: try { try decoder.decodeSingularBoolField(value: &self.isPrivateVault) }()
      case 4: try { try decoder.decodeRepeatedStringField(value: &self.allowedDepositors) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.totalShares) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.totalValue) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.denom.isEmpty {
      try visitor.visitSingularStringField(value: self.denom, fieldNumber: 1)
    }
    if !self.strategies.isEmpty {
      try visitor.visitPackedEnumField(value: self.strategies, fieldNumber: 2)
    }
    if self.isPrivateVault != false {
      try visitor.visitSingularBoolField(value: self.isPrivateVault, fieldNumber: 3)
    }
    if !self.allowedDepositors.isEmpty {
      try visitor.visitRepeatedStringField(value: self.allowedDepositors, fieldNumber: 4)
    }
    if !self.totalShares.isEmpty {
      try visitor.visitSingularStringField(value: self.totalShares, fieldNumber: 5)
    }
    if !self.totalValue.isEmpty {
      try visitor.visitSingularStringField(value: self.totalValue, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Earn_V1beta1_VaultResponse, rhs: Kava_Earn_V1beta1_VaultResponse) -> Bool {
    if lhs.denom != rhs.denom {return false}
    if lhs.strategies != rhs.strategies {return false}
    if lhs.isPrivateVault != rhs.isPrivateVault {return false}
    if lhs.allowedDepositors != rhs.allowedDepositors {return false}
    if lhs.totalShares != rhs.totalShares {return false}
    if lhs.totalValue != rhs.totalValue {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Earn_V1beta1_QueryDepositsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryDepositsRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "depositor"),
    2: .same(proto: "denom"),
    3: .standard(proto: "value_in_staked_tokens"),
    4: .same(proto: "pagination"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.depositor) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.denom) }()
      case 3: try { try decoder.decodeSingularBoolField(value: &self.valueInStakedTokens) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._pagination) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.depositor.isEmpty {
      try visitor.visitSingularStringField(value: self.depositor, fieldNumber: 1)
    }
    if !self.denom.isEmpty {
      try visitor.visitSingularStringField(value: self.denom, fieldNumber: 2)
    }
    if self.valueInStakedTokens != false {
      try visitor.visitSingularBoolField(value: self.valueInStakedTokens, fieldNumber: 3)
    }
    try { if let v = self._pagination {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Earn_V1beta1_QueryDepositsRequest, rhs: Kava_Earn_V1beta1_QueryDepositsRequest) -> Bool {
    if lhs.depositor != rhs.depositor {return false}
    if lhs.denom != rhs.denom {return false}
    if lhs.valueInStakedTokens != rhs.valueInStakedTokens {return false}
    if lhs._pagination != rhs._pagination {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Earn_V1beta1_QueryDepositsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryDepositsResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "deposits"),
    2: .same(proto: "pagination"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.deposits) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._pagination) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.deposits.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.deposits, fieldNumber: 1)
    }
    try { if let v = self._pagination {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Earn_V1beta1_QueryDepositsResponse, rhs: Kava_Earn_V1beta1_QueryDepositsResponse) -> Bool {
    if lhs.deposits != rhs.deposits {return false}
    if lhs._pagination != rhs._pagination {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Earn_V1beta1_DepositResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DepositResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "depositor"),
    2: .same(proto: "shares"),
    3: .same(proto: "value"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.depositor) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.shares) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.value) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.depositor.isEmpty {
      try visitor.visitSingularStringField(value: self.depositor, fieldNumber: 1)
    }
    if !self.shares.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.shares, fieldNumber: 2)
    }
    if !self.value.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.value, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Earn_V1beta1_DepositResponse, rhs: Kava_Earn_V1beta1_DepositResponse) -> Bool {
    if lhs.depositor != rhs.depositor {return false}
    if lhs.shares != rhs.shares {return false}
    if lhs.value != rhs.value {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Earn_V1beta1_QueryTotalSupplyRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryTotalSupplyRequest"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Earn_V1beta1_QueryTotalSupplyRequest, rhs: Kava_Earn_V1beta1_QueryTotalSupplyRequest) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Earn_V1beta1_QueryTotalSupplyResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryTotalSupplyResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "height"),
    2: .same(proto: "result"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularInt64Field(value: &self.height) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.result) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.height != 0 {
      try visitor.visitSingularInt64Field(value: self.height, fieldNumber: 1)
    }
    if !self.result.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.result, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Earn_V1beta1_QueryTotalSupplyResponse, rhs: Kava_Earn_V1beta1_QueryTotalSupplyResponse) -> Bool {
    if lhs.height != rhs.height {return false}
    if lhs.result != rhs.result {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
