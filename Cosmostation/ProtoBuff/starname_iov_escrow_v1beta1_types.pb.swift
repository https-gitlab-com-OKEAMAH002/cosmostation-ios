// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: starname/iov/escrow/v1beta1/types.proto
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

/// EscrowState defines the state of an escrow
enum Starnamed_X_Escrow_V1beta1_EscrowState: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// ESCROW_STATE_OPEN defines an open state.
  case `open` // = 0

  /// ESCROW_STATE_COMPLETED defines a completed state.
  case completed // = 1

  /// ESCROW_STATE_REFUNDED defines a refunded state.
  case refunded // = 2

  /// ESCROW_STATE_REFUNDED defines an expired state.
  case expired // = 3
  case UNRECOGNIZED(Int)

  init() {
    self = .open
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .open
    case 1: self = .completed
    case 2: self = .refunded
    case 3: self = .expired
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .open: return 0
    case .completed: return 1
    case .refunded: return 2
    case .expired: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Starnamed_X_Escrow_V1beta1_EscrowState: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Starnamed_X_Escrow_V1beta1_EscrowState] = [
    .open,
    .completed,
    .refunded,
    .expired,
  ]
}

#endif  // swift(>=4.2)

/// Escrow defines the struct of an escrow
struct Starnamed_X_Escrow_V1beta1_Escrow {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String = String()

  var seller: String = String()

  var object: Google_Protobuf_Any {
    get {return _object ?? Google_Protobuf_Any()}
    set {_object = newValue}
  }
  /// Returns true if `object` has been explicitly set.
  var hasObject: Bool {return self._object != nil}
  /// Clears the value of `object`. Subsequent reads from it will return its default value.
  mutating func clearObject() {self._object = nil}

  ///TODO: refactor this to use sdk.Coin instead of sdk.Coins
  /// Although the price contains multiple coins, for now we enforce a specific denomination, so there will be only
  /// one coin type in a valid escrow
  var price: [Cosmos_Base_V1beta1_Coin] = []

  var state: Starnamed_X_Escrow_V1beta1_EscrowState = .open

  var deadline: UInt64 = 0

  var brokerAddress: String = String()

  var brokerCommission: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _object: Google_Protobuf_Any? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "starnamed.x.escrow.v1beta1"

extension Starnamed_X_Escrow_V1beta1_EscrowState: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "ESCROW_STATE_OPEN"),
    1: .same(proto: "ESCROW_STATE_COMPLETED"),
    2: .same(proto: "ESCROW_STATE_REFUNDED"),
    3: .same(proto: "ESCROW_STATE_EXPIRED"),
  ]
}

extension Starnamed_X_Escrow_V1beta1_Escrow: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Escrow"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "seller"),
    3: .same(proto: "object"),
    4: .same(proto: "price"),
    5: .same(proto: "state"),
    6: .same(proto: "deadline"),
    7: .standard(proto: "broker_address"),
    8: .standard(proto: "broker_commission"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.id) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.seller) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._object) }()
      case 4: try { try decoder.decodeRepeatedMessageField(value: &self.price) }()
      case 5: try { try decoder.decodeSingularEnumField(value: &self.state) }()
      case 6: try { try decoder.decodeSingularUInt64Field(value: &self.deadline) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.brokerAddress) }()
      case 8: try { try decoder.decodeSingularStringField(value: &self.brokerCommission) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.seller.isEmpty {
      try visitor.visitSingularStringField(value: self.seller, fieldNumber: 2)
    }
    if let v = self._object {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    if !self.price.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.price, fieldNumber: 4)
    }
    if self.state != .open {
      try visitor.visitSingularEnumField(value: self.state, fieldNumber: 5)
    }
    if self.deadline != 0 {
      try visitor.visitSingularUInt64Field(value: self.deadline, fieldNumber: 6)
    }
    if !self.brokerAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.brokerAddress, fieldNumber: 7)
    }
    if !self.brokerCommission.isEmpty {
      try visitor.visitSingularStringField(value: self.brokerCommission, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Escrow_V1beta1_Escrow, rhs: Starnamed_X_Escrow_V1beta1_Escrow) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.seller != rhs.seller {return false}
    if lhs._object != rhs._object {return false}
    if lhs.price != rhs.price {return false}
    if lhs.state != rhs.state {return false}
    if lhs.deadline != rhs.deadline {return false}
    if lhs.brokerAddress != rhs.brokerAddress {return false}
    if lhs.brokerCommission != rhs.brokerCommission {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}