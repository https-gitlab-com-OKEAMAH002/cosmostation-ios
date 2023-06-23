// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/staking/module/v1/module.proto
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

/// Module is the config object of the staking module.
struct Cosmos_Staking_Module_V1_Module {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// hooks_order specifies the order of staking hooks and should be a list
  /// of module names which provide a staking hooks instance. If no order is
  /// provided, then hooks will be applied in alphabetical order of module names.
  var hooksOrder: [String] = []

  /// authority defines the custom module authority. If not set, defaults to the governance module.
  var authority: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Cosmos_Staking_Module_V1_Module: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.staking.module.v1"

extension Cosmos_Staking_Module_V1_Module: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Module"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "hooks_order"),
    2: .same(proto: "authority"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedStringField(value: &self.hooksOrder) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.authority) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.hooksOrder.isEmpty {
      try visitor.visitRepeatedStringField(value: self.hooksOrder, fieldNumber: 1)
    }
    if !self.authority.isEmpty {
      try visitor.visitSingularStringField(value: self.authority, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Staking_Module_V1_Module, rhs: Cosmos_Staking_Module_V1_Module) -> Bool {
    if lhs.hooksOrder != rhs.hooksOrder {return false}
    if lhs.authority != rhs.authority {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
