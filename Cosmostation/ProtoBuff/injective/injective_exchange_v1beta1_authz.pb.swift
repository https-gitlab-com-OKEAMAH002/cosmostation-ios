// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: injective/exchange/v1beta1/authz.proto
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

/// spot authz messages
struct Injective_Exchange_V1beta1_CreateSpotLimitOrderAuthz {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var subaccountID: String = String()

  var marketIds: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Exchange_V1beta1_CreateSpotMarketOrderAuthz {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var subaccountID: String = String()

  var marketIds: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Exchange_V1beta1_BatchCreateSpotLimitOrdersAuthz {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var subaccountID: String = String()

  var marketIds: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Exchange_V1beta1_CancelSpotOrderAuthz {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var subaccountID: String = String()

  var marketIds: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Exchange_V1beta1_BatchCancelSpotOrdersAuthz {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var subaccountID: String = String()

  var marketIds: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// derivative authz messages
struct Injective_Exchange_V1beta1_CreateDerivativeLimitOrderAuthz {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var subaccountID: String = String()

  var marketIds: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Exchange_V1beta1_CreateDerivativeMarketOrderAuthz {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var subaccountID: String = String()

  var marketIds: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Exchange_V1beta1_BatchCreateDerivativeLimitOrdersAuthz {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var subaccountID: String = String()

  var marketIds: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Exchange_V1beta1_CancelDerivativeOrderAuthz {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var subaccountID: String = String()

  var marketIds: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Injective_Exchange_V1beta1_BatchCancelDerivativeOrdersAuthz {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var subaccountID: String = String()

  var marketIds: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// common authz message used in both spot & derivative markets
struct Injective_Exchange_V1beta1_BatchUpdateOrdersAuthz {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var subaccountID: String = String()

  var spotMarkets: [String] = []

  var derivativeMarkets: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Injective_Exchange_V1beta1_CreateSpotLimitOrderAuthz: @unchecked Sendable {}
extension Injective_Exchange_V1beta1_CreateSpotMarketOrderAuthz: @unchecked Sendable {}
extension Injective_Exchange_V1beta1_BatchCreateSpotLimitOrdersAuthz: @unchecked Sendable {}
extension Injective_Exchange_V1beta1_CancelSpotOrderAuthz: @unchecked Sendable {}
extension Injective_Exchange_V1beta1_BatchCancelSpotOrdersAuthz: @unchecked Sendable {}
extension Injective_Exchange_V1beta1_CreateDerivativeLimitOrderAuthz: @unchecked Sendable {}
extension Injective_Exchange_V1beta1_CreateDerivativeMarketOrderAuthz: @unchecked Sendable {}
extension Injective_Exchange_V1beta1_BatchCreateDerivativeLimitOrdersAuthz: @unchecked Sendable {}
extension Injective_Exchange_V1beta1_CancelDerivativeOrderAuthz: @unchecked Sendable {}
extension Injective_Exchange_V1beta1_BatchCancelDerivativeOrdersAuthz: @unchecked Sendable {}
extension Injective_Exchange_V1beta1_BatchUpdateOrdersAuthz: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "injective.exchange.v1beta1"

extension Injective_Exchange_V1beta1_CreateSpotLimitOrderAuthz: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CreateSpotLimitOrderAuthz"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subaccount_id"),
    2: .standard(proto: "market_ids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.subaccountID) }()
      case 2: try { try decoder.decodeRepeatedStringField(value: &self.marketIds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.subaccountID.isEmpty {
      try visitor.visitSingularStringField(value: self.subaccountID, fieldNumber: 1)
    }
    if !self.marketIds.isEmpty {
      try visitor.visitRepeatedStringField(value: self.marketIds, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Exchange_V1beta1_CreateSpotLimitOrderAuthz, rhs: Injective_Exchange_V1beta1_CreateSpotLimitOrderAuthz) -> Bool {
    if lhs.subaccountID != rhs.subaccountID {return false}
    if lhs.marketIds != rhs.marketIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Exchange_V1beta1_CreateSpotMarketOrderAuthz: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CreateSpotMarketOrderAuthz"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subaccount_id"),
    2: .standard(proto: "market_ids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.subaccountID) }()
      case 2: try { try decoder.decodeRepeatedStringField(value: &self.marketIds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.subaccountID.isEmpty {
      try visitor.visitSingularStringField(value: self.subaccountID, fieldNumber: 1)
    }
    if !self.marketIds.isEmpty {
      try visitor.visitRepeatedStringField(value: self.marketIds, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Exchange_V1beta1_CreateSpotMarketOrderAuthz, rhs: Injective_Exchange_V1beta1_CreateSpotMarketOrderAuthz) -> Bool {
    if lhs.subaccountID != rhs.subaccountID {return false}
    if lhs.marketIds != rhs.marketIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Exchange_V1beta1_BatchCreateSpotLimitOrdersAuthz: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".BatchCreateSpotLimitOrdersAuthz"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subaccount_id"),
    2: .standard(proto: "market_ids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.subaccountID) }()
      case 2: try { try decoder.decodeRepeatedStringField(value: &self.marketIds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.subaccountID.isEmpty {
      try visitor.visitSingularStringField(value: self.subaccountID, fieldNumber: 1)
    }
    if !self.marketIds.isEmpty {
      try visitor.visitRepeatedStringField(value: self.marketIds, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Exchange_V1beta1_BatchCreateSpotLimitOrdersAuthz, rhs: Injective_Exchange_V1beta1_BatchCreateSpotLimitOrdersAuthz) -> Bool {
    if lhs.subaccountID != rhs.subaccountID {return false}
    if lhs.marketIds != rhs.marketIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Exchange_V1beta1_CancelSpotOrderAuthz: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CancelSpotOrderAuthz"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subaccount_id"),
    2: .standard(proto: "market_ids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.subaccountID) }()
      case 2: try { try decoder.decodeRepeatedStringField(value: &self.marketIds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.subaccountID.isEmpty {
      try visitor.visitSingularStringField(value: self.subaccountID, fieldNumber: 1)
    }
    if !self.marketIds.isEmpty {
      try visitor.visitRepeatedStringField(value: self.marketIds, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Exchange_V1beta1_CancelSpotOrderAuthz, rhs: Injective_Exchange_V1beta1_CancelSpotOrderAuthz) -> Bool {
    if lhs.subaccountID != rhs.subaccountID {return false}
    if lhs.marketIds != rhs.marketIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Exchange_V1beta1_BatchCancelSpotOrdersAuthz: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".BatchCancelSpotOrdersAuthz"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subaccount_id"),
    2: .standard(proto: "market_ids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.subaccountID) }()
      case 2: try { try decoder.decodeRepeatedStringField(value: &self.marketIds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.subaccountID.isEmpty {
      try visitor.visitSingularStringField(value: self.subaccountID, fieldNumber: 1)
    }
    if !self.marketIds.isEmpty {
      try visitor.visitRepeatedStringField(value: self.marketIds, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Exchange_V1beta1_BatchCancelSpotOrdersAuthz, rhs: Injective_Exchange_V1beta1_BatchCancelSpotOrdersAuthz) -> Bool {
    if lhs.subaccountID != rhs.subaccountID {return false}
    if lhs.marketIds != rhs.marketIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Exchange_V1beta1_CreateDerivativeLimitOrderAuthz: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CreateDerivativeLimitOrderAuthz"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subaccount_id"),
    2: .standard(proto: "market_ids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.subaccountID) }()
      case 2: try { try decoder.decodeRepeatedStringField(value: &self.marketIds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.subaccountID.isEmpty {
      try visitor.visitSingularStringField(value: self.subaccountID, fieldNumber: 1)
    }
    if !self.marketIds.isEmpty {
      try visitor.visitRepeatedStringField(value: self.marketIds, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Exchange_V1beta1_CreateDerivativeLimitOrderAuthz, rhs: Injective_Exchange_V1beta1_CreateDerivativeLimitOrderAuthz) -> Bool {
    if lhs.subaccountID != rhs.subaccountID {return false}
    if lhs.marketIds != rhs.marketIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Exchange_V1beta1_CreateDerivativeMarketOrderAuthz: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CreateDerivativeMarketOrderAuthz"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subaccount_id"),
    2: .standard(proto: "market_ids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.subaccountID) }()
      case 2: try { try decoder.decodeRepeatedStringField(value: &self.marketIds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.subaccountID.isEmpty {
      try visitor.visitSingularStringField(value: self.subaccountID, fieldNumber: 1)
    }
    if !self.marketIds.isEmpty {
      try visitor.visitRepeatedStringField(value: self.marketIds, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Exchange_V1beta1_CreateDerivativeMarketOrderAuthz, rhs: Injective_Exchange_V1beta1_CreateDerivativeMarketOrderAuthz) -> Bool {
    if lhs.subaccountID != rhs.subaccountID {return false}
    if lhs.marketIds != rhs.marketIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Exchange_V1beta1_BatchCreateDerivativeLimitOrdersAuthz: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".BatchCreateDerivativeLimitOrdersAuthz"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subaccount_id"),
    2: .standard(proto: "market_ids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.subaccountID) }()
      case 2: try { try decoder.decodeRepeatedStringField(value: &self.marketIds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.subaccountID.isEmpty {
      try visitor.visitSingularStringField(value: self.subaccountID, fieldNumber: 1)
    }
    if !self.marketIds.isEmpty {
      try visitor.visitRepeatedStringField(value: self.marketIds, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Exchange_V1beta1_BatchCreateDerivativeLimitOrdersAuthz, rhs: Injective_Exchange_V1beta1_BatchCreateDerivativeLimitOrdersAuthz) -> Bool {
    if lhs.subaccountID != rhs.subaccountID {return false}
    if lhs.marketIds != rhs.marketIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Exchange_V1beta1_CancelDerivativeOrderAuthz: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CancelDerivativeOrderAuthz"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subaccount_id"),
    2: .standard(proto: "market_ids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.subaccountID) }()
      case 2: try { try decoder.decodeRepeatedStringField(value: &self.marketIds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.subaccountID.isEmpty {
      try visitor.visitSingularStringField(value: self.subaccountID, fieldNumber: 1)
    }
    if !self.marketIds.isEmpty {
      try visitor.visitRepeatedStringField(value: self.marketIds, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Exchange_V1beta1_CancelDerivativeOrderAuthz, rhs: Injective_Exchange_V1beta1_CancelDerivativeOrderAuthz) -> Bool {
    if lhs.subaccountID != rhs.subaccountID {return false}
    if lhs.marketIds != rhs.marketIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Exchange_V1beta1_BatchCancelDerivativeOrdersAuthz: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".BatchCancelDerivativeOrdersAuthz"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subaccount_id"),
    2: .standard(proto: "market_ids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.subaccountID) }()
      case 2: try { try decoder.decodeRepeatedStringField(value: &self.marketIds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.subaccountID.isEmpty {
      try visitor.visitSingularStringField(value: self.subaccountID, fieldNumber: 1)
    }
    if !self.marketIds.isEmpty {
      try visitor.visitRepeatedStringField(value: self.marketIds, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Exchange_V1beta1_BatchCancelDerivativeOrdersAuthz, rhs: Injective_Exchange_V1beta1_BatchCancelDerivativeOrdersAuthz) -> Bool {
    if lhs.subaccountID != rhs.subaccountID {return false}
    if lhs.marketIds != rhs.marketIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Injective_Exchange_V1beta1_BatchUpdateOrdersAuthz: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".BatchUpdateOrdersAuthz"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subaccount_id"),
    2: .standard(proto: "spot_markets"),
    3: .standard(proto: "derivative_markets"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.subaccountID) }()
      case 2: try { try decoder.decodeRepeatedStringField(value: &self.spotMarkets) }()
      case 3: try { try decoder.decodeRepeatedStringField(value: &self.derivativeMarkets) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.subaccountID.isEmpty {
      try visitor.visitSingularStringField(value: self.subaccountID, fieldNumber: 1)
    }
    if !self.spotMarkets.isEmpty {
      try visitor.visitRepeatedStringField(value: self.spotMarkets, fieldNumber: 2)
    }
    if !self.derivativeMarkets.isEmpty {
      try visitor.visitRepeatedStringField(value: self.derivativeMarkets, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Injective_Exchange_V1beta1_BatchUpdateOrdersAuthz, rhs: Injective_Exchange_V1beta1_BatchUpdateOrdersAuthz) -> Bool {
    if lhs.subaccountID != rhs.subaccountID {return false}
    if lhs.spotMarkets != rhs.spotMarkets {return false}
    if lhs.derivativeMarkets != rhs.derivativeMarkets {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
