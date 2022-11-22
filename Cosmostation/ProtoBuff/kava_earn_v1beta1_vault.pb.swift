// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: kava/earn/v1beta1/vault.proto
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

/// AllowedVault is a vault that is allowed to be created. These can be
/// modified via parameter governance.
struct Kava_Earn_V1beta1_AllowedVault {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Denom is the only supported denomination of the vault for deposits and withdrawals.
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
  var allowedDepositors: [Data] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// VaultRecord is the state of a vault.
struct Kava_Earn_V1beta1_VaultRecord {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// TotalShares is the total distributed number of shares in the vault.
  var totalShares: Kava_Earn_V1beta1_VaultShare {
    get {return _totalShares ?? Kava_Earn_V1beta1_VaultShare()}
    set {_totalShares = newValue}
  }
  /// Returns true if `totalShares` has been explicitly set.
  var hasTotalShares: Bool {return self._totalShares != nil}
  /// Clears the value of `totalShares`. Subsequent reads from it will return its default value.
  mutating func clearTotalShares() {self._totalShares = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _totalShares: Kava_Earn_V1beta1_VaultShare? = nil
}

/// VaultShareRecord defines the vault shares owned by a depositor.
struct Kava_Earn_V1beta1_VaultShareRecord {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Depositor represents the owner of the shares
  var depositor: Data = Data()

  /// Shares represent the vault shares owned by the depositor.
  var shares: [Kava_Earn_V1beta1_VaultShare] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// VaultShare defines shares of a vault owned by a depositor.
struct Kava_Earn_V1beta1_VaultShare {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var denom: String = String()

  var amount: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "kava.earn.v1beta1"

extension Kava_Earn_V1beta1_AllowedVault: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".AllowedVault"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "denom"),
    2: .same(proto: "strategies"),
    3: .standard(proto: "is_private_vault"),
    4: .standard(proto: "allowed_depositors"),
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
      case 4: try { try decoder.decodeRepeatedBytesField(value: &self.allowedDepositors) }()
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
      try visitor.visitRepeatedBytesField(value: self.allowedDepositors, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Earn_V1beta1_AllowedVault, rhs: Kava_Earn_V1beta1_AllowedVault) -> Bool {
    if lhs.denom != rhs.denom {return false}
    if lhs.strategies != rhs.strategies {return false}
    if lhs.isPrivateVault != rhs.isPrivateVault {return false}
    if lhs.allowedDepositors != rhs.allowedDepositors {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Earn_V1beta1_VaultRecord: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".VaultRecord"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "total_shares"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._totalShares) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._totalShares {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Earn_V1beta1_VaultRecord, rhs: Kava_Earn_V1beta1_VaultRecord) -> Bool {
    if lhs._totalShares != rhs._totalShares {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Earn_V1beta1_VaultShareRecord: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".VaultShareRecord"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "depositor"),
    2: .same(proto: "shares"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.depositor) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.shares) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.depositor.isEmpty {
      try visitor.visitSingularBytesField(value: self.depositor, fieldNumber: 1)
    }
    if !self.shares.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.shares, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Earn_V1beta1_VaultShareRecord, rhs: Kava_Earn_V1beta1_VaultShareRecord) -> Bool {
    if lhs.depositor != rhs.depositor {return false}
    if lhs.shares != rhs.shares {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Earn_V1beta1_VaultShare: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".VaultShare"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "denom"),
    2: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.denom) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.denom.isEmpty {
      try visitor.visitSingularStringField(value: self.denom, fieldNumber: 1)
    }
    if !self.amount.isEmpty {
      try visitor.visitSingularStringField(value: self.amount, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Earn_V1beta1_VaultShare, rhs: Kava_Earn_V1beta1_VaultShare) -> Bool {
    if lhs.denom != rhs.denom {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}