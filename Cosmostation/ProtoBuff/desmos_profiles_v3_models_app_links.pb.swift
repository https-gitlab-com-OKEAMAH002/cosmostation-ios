// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: desmos/profiles/v3/models_app_links.proto
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

/// ApplicationLinkState defines if an application link is in the following
/// states: STARTED, ERRORED, SUCCESSFUL, TIMED_OUT
enum Desmos_Profiles_V3_ApplicationLinkState: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// A link has just been initialized
  case initializedUnspecified // = 0

  /// A link has just started being verified
  case verificationStarted // = 1

  /// A link has errored during the verification process
  case verificationError // = 2

  /// A link has being verified successfully
  case verificationSuccess // = 3

  /// A link has timed out while waiting for the verification
  case timedOut // = 4
  case UNRECOGNIZED(Int)

  init() {
    self = .initializedUnspecified
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .initializedUnspecified
    case 1: self = .verificationStarted
    case 2: self = .verificationError
    case 3: self = .verificationSuccess
    case 4: self = .timedOut
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .initializedUnspecified: return 0
    case .verificationStarted: return 1
    case .verificationError: return 2
    case .verificationSuccess: return 3
    case .timedOut: return 4
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Desmos_Profiles_V3_ApplicationLinkState: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Desmos_Profiles_V3_ApplicationLinkState] = [
    .initializedUnspecified,
    .verificationStarted,
    .verificationError,
    .verificationSuccess,
    .timedOut,
  ]
}

#endif  // swift(>=4.2)

/// ApplicationLink contains the data of a link to a centralized application
struct Desmos_Profiles_V3_ApplicationLink {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///  User to which the link is associated
  var user: String = String()

  /// Data contains the details of this specific link
  var data: Desmos_Profiles_V3_Data {
    get {return _data ?? Desmos_Profiles_V3_Data()}
    set {_data = newValue}
  }
  /// Returns true if `data` has been explicitly set.
  var hasData: Bool {return self._data != nil}
  /// Clears the value of `data`. Subsequent reads from it will return its default value.
  mutating func clearData() {self._data = nil}

  /// State of the link
  var state: Desmos_Profiles_V3_ApplicationLinkState = .initializedUnspecified

  /// OracleRequest represents the request that has been made to the oracle
  var oracleRequest: Desmos_Profiles_V3_OracleRequest {
    get {return _oracleRequest ?? Desmos_Profiles_V3_OracleRequest()}
    set {_oracleRequest = newValue}
  }
  /// Returns true if `oracleRequest` has been explicitly set.
  var hasOracleRequest: Bool {return self._oracleRequest != nil}
  /// Clears the value of `oracleRequest`. Subsequent reads from it will return its default value.
  mutating func clearOracleRequest() {self._oracleRequest = nil}

  /// Data coming from the result of the verification.
  /// Only available when the state is STATE_SUCCESS
  var result: Desmos_Profiles_V3_Result {
    get {return _result ?? Desmos_Profiles_V3_Result()}
    set {_result = newValue}
  }
  /// Returns true if `result` has been explicitly set.
  var hasResult: Bool {return self._result != nil}
  /// Clears the value of `result`. Subsequent reads from it will return its default value.
  mutating func clearResult() {self._result = nil}

  /// CreationTime represents the time in which the link was created
  var creationTime: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _creationTime ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_creationTime = newValue}
  }
  /// Returns true if `creationTime` has been explicitly set.
  var hasCreationTime: Bool {return self._creationTime != nil}
  /// Clears the value of `creationTime`. Subsequent reads from it will return its default value.
  mutating func clearCreationTime() {self._creationTime = nil}

  /// ExpirationTime represents the time in which the link will expire
  var expirationTime: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _expirationTime ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_expirationTime = newValue}
  }
  /// Returns true if `expirationTime` has been explicitly set.
  var hasExpirationTime: Bool {return self._expirationTime != nil}
  /// Clears the value of `expirationTime`. Subsequent reads from it will return its default value.
  mutating func clearExpirationTime() {self._expirationTime = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _data: Desmos_Profiles_V3_Data? = nil
  fileprivate var _oracleRequest: Desmos_Profiles_V3_OracleRequest? = nil
  fileprivate var _result: Desmos_Profiles_V3_Result? = nil
  fileprivate var _creationTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
  fileprivate var _expirationTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

/// Data contains the data associated to a specific user of a
/// generic centralized application
struct Desmos_Profiles_V3_Data {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The application name (eg. Twitter, GitHub, etc)
  var application: String = String()

  /// Username on the application (eg. Twitter tag, GitHub profile, etc)
  var username: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// OracleRequest represents a generic oracle request used to
/// verify the ownership of a centralized application account
struct Desmos_Profiles_V3_OracleRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// ID is the ID of the request
  var id: UInt64 = 0

  /// OracleScriptID is ID of an oracle script
  var oracleScriptID: UInt64 = 0

  /// CallData contains the data used to perform the oracle request
  var callData: Desmos_Profiles_V3_OracleRequest.CallData {
    get {return _callData ?? Desmos_Profiles_V3_OracleRequest.CallData()}
    set {_callData = newValue}
  }
  /// Returns true if `callData` has been explicitly set.
  var hasCallData: Bool {return self._callData != nil}
  /// Clears the value of `callData`. Subsequent reads from it will return its default value.
  mutating func clearCallData() {self._callData = nil}

  /// ClientID represents the ID of the client that has called the oracle script
  var clientID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  /// CallData contains the data sent to a single oracle request in order to
  /// verify the ownership of a centralized application by a Desmos profile
  struct CallData {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// The application for which the ownership should be verified
    var application: String = String()

    /// The hex encoded call data that should be used to verify the application
    /// account ownership
    var callData: String = String()

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  init() {}

  fileprivate var _callData: Desmos_Profiles_V3_OracleRequest.CallData? = nil
}

/// Result represents a verification result
struct Desmos_Profiles_V3_Result {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// sum is the oneof that specifies whether this represents a success or
  /// failure result
  var sum: Desmos_Profiles_V3_Result.OneOf_Sum? = nil

  /// Success represents a successful verification
  var success: Desmos_Profiles_V3_Result.Success {
    get {
      if case .success(let v)? = sum {return v}
      return Desmos_Profiles_V3_Result.Success()
    }
    set {sum = .success(newValue)}
  }

  /// Failed represents a failed verification
  var failed: Desmos_Profiles_V3_Result.Failed {
    get {
      if case .failed(let v)? = sum {return v}
      return Desmos_Profiles_V3_Result.Failed()
    }
    set {sum = .failed(newValue)}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  /// sum is the oneof that specifies whether this represents a success or
  /// failure result
  enum OneOf_Sum: Equatable {
    /// Success represents a successful verification
    case success(Desmos_Profiles_V3_Result.Success)
    /// Failed represents a failed verification
    case failed(Desmos_Profiles_V3_Result.Failed)

  #if !swift(>=4.1)
    static func ==(lhs: Desmos_Profiles_V3_Result.OneOf_Sum, rhs: Desmos_Profiles_V3_Result.OneOf_Sum) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.success, .success): return {
        guard case .success(let l) = lhs, case .success(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.failed, .failed): return {
        guard case .failed(let l) = lhs, case .failed(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  /// Success is the result of an application link that has been successfully
  /// verified
  struct Success {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Hex-encoded value that has be signed by the profile
    var value: String = String()

    /// Hex-encoded signature that has been produced by signing the value
    var signature: String = String()

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  /// Failed is the result of an application link that has not been verified
  /// successfully
  struct Failed {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Error that is associated with the failure
    var error: String = String()

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "desmos.profiles.v3"

extension Desmos_Profiles_V3_ApplicationLinkState: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "APPLICATION_LINK_STATE_INITIALIZED_UNSPECIFIED"),
    1: .same(proto: "APPLICATION_LINK_STATE_VERIFICATION_STARTED"),
    2: .same(proto: "APPLICATION_LINK_STATE_VERIFICATION_ERROR"),
    3: .same(proto: "APPLICATION_LINK_STATE_VERIFICATION_SUCCESS"),
    4: .same(proto: "APPLICATION_LINK_STATE_TIMED_OUT"),
  ]
}

extension Desmos_Profiles_V3_ApplicationLink: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ApplicationLink"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "user"),
    2: .same(proto: "data"),
    3: .same(proto: "state"),
    4: .standard(proto: "oracle_request"),
    5: .same(proto: "result"),
    6: .standard(proto: "creation_time"),
    7: .standard(proto: "expiration_time"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.user) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._data) }()
      case 3: try { try decoder.decodeSingularEnumField(value: &self.state) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._oracleRequest) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._result) }()
      case 6: try { try decoder.decodeSingularMessageField(value: &self._creationTime) }()
      case 7: try { try decoder.decodeSingularMessageField(value: &self._expirationTime) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.user.isEmpty {
      try visitor.visitSingularStringField(value: self.user, fieldNumber: 1)
    }
    if let v = self._data {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    if self.state != .initializedUnspecified {
      try visitor.visitSingularEnumField(value: self.state, fieldNumber: 3)
    }
    if let v = self._oracleRequest {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    if let v = self._result {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }
    if let v = self._creationTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
    }
    if let v = self._expirationTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V3_ApplicationLink, rhs: Desmos_Profiles_V3_ApplicationLink) -> Bool {
    if lhs.user != rhs.user {return false}
    if lhs._data != rhs._data {return false}
    if lhs.state != rhs.state {return false}
    if lhs._oracleRequest != rhs._oracleRequest {return false}
    if lhs._result != rhs._result {return false}
    if lhs._creationTime != rhs._creationTime {return false}
    if lhs._expirationTime != rhs._expirationTime {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V3_Data: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Data"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "application"),
    2: .same(proto: "username"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.application) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.username) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.application.isEmpty {
      try visitor.visitSingularStringField(value: self.application, fieldNumber: 1)
    }
    if !self.username.isEmpty {
      try visitor.visitSingularStringField(value: self.username, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V3_Data, rhs: Desmos_Profiles_V3_Data) -> Bool {
    if lhs.application != rhs.application {return false}
    if lhs.username != rhs.username {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V3_OracleRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".OracleRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .standard(proto: "oracle_script_id"),
    3: .standard(proto: "call_data"),
    4: .standard(proto: "client_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.id) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.oracleScriptID) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._callData) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.clientID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularUInt64Field(value: self.id, fieldNumber: 1)
    }
    if self.oracleScriptID != 0 {
      try visitor.visitSingularUInt64Field(value: self.oracleScriptID, fieldNumber: 2)
    }
    if let v = self._callData {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    if !self.clientID.isEmpty {
      try visitor.visitSingularStringField(value: self.clientID, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V3_OracleRequest, rhs: Desmos_Profiles_V3_OracleRequest) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.oracleScriptID != rhs.oracleScriptID {return false}
    if lhs._callData != rhs._callData {return false}
    if lhs.clientID != rhs.clientID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V3_OracleRequest.CallData: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Desmos_Profiles_V3_OracleRequest.protoMessageName + ".CallData"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "application"),
    2: .standard(proto: "call_data"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.application) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.callData) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.application.isEmpty {
      try visitor.visitSingularStringField(value: self.application, fieldNumber: 1)
    }
    if !self.callData.isEmpty {
      try visitor.visitSingularStringField(value: self.callData, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V3_OracleRequest.CallData, rhs: Desmos_Profiles_V3_OracleRequest.CallData) -> Bool {
    if lhs.application != rhs.application {return false}
    if lhs.callData != rhs.callData {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V3_Result: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Result"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "success"),
    2: .same(proto: "failed"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try {
        var v: Desmos_Profiles_V3_Result.Success?
        var hadOneofValue = false
        if let current = self.sum {
          hadOneofValue = true
          if case .success(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.sum = .success(v)
        }
      }()
      case 2: try {
        var v: Desmos_Profiles_V3_Result.Failed?
        var hadOneofValue = false
        if let current = self.sum {
          hadOneofValue = true
          if case .failed(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.sum = .failed(v)
        }
      }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every case branch when no optimizations are
    // enabled. https://github.com/apple/swift-protobuf/issues/1034
    switch self.sum {
    case .success?: try {
      guard case .success(let v)? = self.sum else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }()
    case .failed?: try {
      guard case .failed(let v)? = self.sum else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }()
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V3_Result, rhs: Desmos_Profiles_V3_Result) -> Bool {
    if lhs.sum != rhs.sum {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V3_Result.Success: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Desmos_Profiles_V3_Result.protoMessageName + ".Success"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "value"),
    2: .same(proto: "signature"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.value) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.signature) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.value.isEmpty {
      try visitor.visitSingularStringField(value: self.value, fieldNumber: 1)
    }
    if !self.signature.isEmpty {
      try visitor.visitSingularStringField(value: self.signature, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V3_Result.Success, rhs: Desmos_Profiles_V3_Result.Success) -> Bool {
    if lhs.value != rhs.value {return false}
    if lhs.signature != rhs.signature {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Desmos_Profiles_V3_Result.Failed: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Desmos_Profiles_V3_Result.protoMessageName + ".Failed"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "error"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.error) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.error.isEmpty {
      try visitor.visitSingularStringField(value: self.error, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Desmos_Profiles_V3_Result.Failed, rhs: Desmos_Profiles_V3_Result.Failed) -> Bool {
    if lhs.error != rhs.error {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}