// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: desmos/subspaces/v3/models_feegrant.proto
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

/// Grant represents a grant to a user or a group
struct Desmos_Subspaces_V3_Grant {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Id of the subspace inside which the user was granted the allowance
  var subspaceID: UInt64 = 0

  /// Address of the user that granted the allowance
  var granter: String = String()

  /// Target to which the allowance has been granted
  var grantee: SwiftProtobuf.Google_Protobuf_Any {
    get {return _grantee ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_grantee = newValue}
  }
  /// Returns true if `grantee` has been explicitly set.
  var hasGrantee: Bool {return self._grantee != nil}
  /// Clears the value of `grantee`. Subsequent reads from it will return its default value.
  mutating func clearGrantee() {self._grantee = nil}

  /// Allowance can be any allowance type implementing the FeeAllowanceI
  /// interface
  var allowance: SwiftProtobuf.Google_Protobuf_Any {
    get {return _allowance ?? SwiftProtobuf.Google_Protobuf_Any()}
    set {_allowance = newValue}
  }
  /// Returns true if `allowance` has been explicitly set.
  var hasAllowance: Bool {return self._allowance != nil}
  /// Clears the value of `allowance`. Subsequent reads from it will return its default value.
  mutating func clearAllowance() {self._allowance = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _grantee: SwiftProtobuf.Google_Protobuf_Any? = nil
  fileprivate var _allowance: SwiftProtobuf.Google_Protobuf_Any? = nil
}

/// UserGrantee contains the target of a grant about a user
struct Desmos_Subspaces_V3_UserGrantee {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var user: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// GroupGrantee contains the target of a grant about a group
struct Desmos_Subspaces_V3_GroupGrantee {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var groupID: UInt32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Desmos_Subspaces_V3_Grant: @unchecked Sendable {}
extension Desmos_Subspaces_V3_UserGrantee: @unchecked Sendable {}
extension Desmos_Subspaces_V3_GroupGrantee: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "desmos.subspaces.v3"

extension Desmos_Subspaces_V3_Grant: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Grant"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "subspace_id"),
    2: .same(proto: "granter"),
    3: .same(proto: "grantee"),
    4: .same(proto: "allowance"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.subspaceID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.granter) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._grantee) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._allowance) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.subspaceID != 0 {
      try visitor.visitSingularUInt64Field(value: self.subspaceID, fieldNumber: 1)
    }
    if !self.granter.isEmpty {
      try visitor.visitSingularStringField(value: self.granter, fieldNumber: 2)
    }
    try { if let v = self._grantee {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try { if let v = self._allowance {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Subspaces_V3_Grant, rhs: Desmos_Subspaces_V3_Grant) -> Bool {
    if lhs.subspaceID != rhs.subspaceID {return false}
    if lhs.granter != rhs.granter {return false}
    if lhs._grantee != rhs._grantee {return false}
    if lhs._allowance != rhs._allowance {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Subspaces_V3_UserGrantee: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UserGrantee"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "user"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.user) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.user.isEmpty {
      try visitor.visitSingularStringField(value: self.user, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Subspaces_V3_UserGrantee, rhs: Desmos_Subspaces_V3_UserGrantee) -> Bool {
    if lhs.user != rhs.user {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Subspaces_V3_GroupGrantee: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GroupGrantee"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "group_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self.groupID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.groupID != 0 {
      try visitor.visitSingularUInt32Field(value: self.groupID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Subspaces_V3_GroupGrantee, rhs: Desmos_Subspaces_V3_GroupGrantee) -> Bool {
    if lhs.groupID != rhs.groupID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
