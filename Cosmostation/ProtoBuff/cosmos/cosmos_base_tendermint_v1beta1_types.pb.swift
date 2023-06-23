// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/base/tendermint/v1beta1/types.proto
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

/// Block is tendermint type Block, with the Header proposer address
/// field converted to bech32 string.
struct Cosmos_Base_Tendermint_V1beta1_Block {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var header: Cosmos_Base_Tendermint_V1beta1_Header {
    get {return _header ?? Cosmos_Base_Tendermint_V1beta1_Header()}
    set {_header = newValue}
  }
  /// Returns true if `header` has been explicitly set.
  var hasHeader: Bool {return self._header != nil}
  /// Clears the value of `header`. Subsequent reads from it will return its default value.
  mutating func clearHeader() {self._header = nil}

  var data: Tendermint_Types_Data {
    get {return _data ?? Tendermint_Types_Data()}
    set {_data = newValue}
  }
  /// Returns true if `data` has been explicitly set.
  var hasData: Bool {return self._data != nil}
  /// Clears the value of `data`. Subsequent reads from it will return its default value.
  mutating func clearData() {self._data = nil}

  var evidence: Tendermint_Types_EvidenceList {
    get {return _evidence ?? Tendermint_Types_EvidenceList()}
    set {_evidence = newValue}
  }
  /// Returns true if `evidence` has been explicitly set.
  var hasEvidence: Bool {return self._evidence != nil}
  /// Clears the value of `evidence`. Subsequent reads from it will return its default value.
  mutating func clearEvidence() {self._evidence = nil}

  var lastCommit: Tendermint_Types_Commit {
    get {return _lastCommit ?? Tendermint_Types_Commit()}
    set {_lastCommit = newValue}
  }
  /// Returns true if `lastCommit` has been explicitly set.
  var hasLastCommit: Bool {return self._lastCommit != nil}
  /// Clears the value of `lastCommit`. Subsequent reads from it will return its default value.
  mutating func clearLastCommit() {self._lastCommit = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _header: Cosmos_Base_Tendermint_V1beta1_Header? = nil
  fileprivate var _data: Tendermint_Types_Data? = nil
  fileprivate var _evidence: Tendermint_Types_EvidenceList? = nil
  fileprivate var _lastCommit: Tendermint_Types_Commit? = nil
}

/// Header defines the structure of a Tendermint block header.
struct Cosmos_Base_Tendermint_V1beta1_Header {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// basic block info
  var version: Tendermint_Version_Consensus {
    get {return _storage._version ?? Tendermint_Version_Consensus()}
    set {_uniqueStorage()._version = newValue}
  }
  /// Returns true if `version` has been explicitly set.
  var hasVersion: Bool {return _storage._version != nil}
  /// Clears the value of `version`. Subsequent reads from it will return its default value.
  mutating func clearVersion() {_uniqueStorage()._version = nil}

  var chainID: String {
    get {return _storage._chainID}
    set {_uniqueStorage()._chainID = newValue}
  }

  var height: Int64 {
    get {return _storage._height}
    set {_uniqueStorage()._height = newValue}
  }

  var time: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _storage._time ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_uniqueStorage()._time = newValue}
  }
  /// Returns true if `time` has been explicitly set.
  var hasTime: Bool {return _storage._time != nil}
  /// Clears the value of `time`. Subsequent reads from it will return its default value.
  mutating func clearTime() {_uniqueStorage()._time = nil}

  /// prev block info
  var lastBlockID: Tendermint_Types_BlockID {
    get {return _storage._lastBlockID ?? Tendermint_Types_BlockID()}
    set {_uniqueStorage()._lastBlockID = newValue}
  }
  /// Returns true if `lastBlockID` has been explicitly set.
  var hasLastBlockID: Bool {return _storage._lastBlockID != nil}
  /// Clears the value of `lastBlockID`. Subsequent reads from it will return its default value.
  mutating func clearLastBlockID() {_uniqueStorage()._lastBlockID = nil}

  /// hashes of block data
  var lastCommitHash: Data {
    get {return _storage._lastCommitHash}
    set {_uniqueStorage()._lastCommitHash = newValue}
  }

  /// transactions
  var dataHash: Data {
    get {return _storage._dataHash}
    set {_uniqueStorage()._dataHash = newValue}
  }

  /// hashes from the app output from the prev block
  var validatorsHash: Data {
    get {return _storage._validatorsHash}
    set {_uniqueStorage()._validatorsHash = newValue}
  }

  /// validators for the next block
  var nextValidatorsHash: Data {
    get {return _storage._nextValidatorsHash}
    set {_uniqueStorage()._nextValidatorsHash = newValue}
  }

  /// consensus params for current block
  var consensusHash: Data {
    get {return _storage._consensusHash}
    set {_uniqueStorage()._consensusHash = newValue}
  }

  /// state after txs from the previous block
  var appHash: Data {
    get {return _storage._appHash}
    set {_uniqueStorage()._appHash = newValue}
  }

  /// root hash of all results from the txs from the previous block
  var lastResultsHash: Data {
    get {return _storage._lastResultsHash}
    set {_uniqueStorage()._lastResultsHash = newValue}
  }

  /// consensus info
  var evidenceHash: Data {
    get {return _storage._evidenceHash}
    set {_uniqueStorage()._evidenceHash = newValue}
  }

  /// proposer_address is the original block proposer address, formatted as a Bech32 string.
  /// In Tendermint, this type is `bytes`, but in the SDK, we convert it to a Bech32 string
  /// for better UX.
  var proposerAddress: String {
    get {return _storage._proposerAddress}
    set {_uniqueStorage()._proposerAddress = newValue}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Cosmos_Base_Tendermint_V1beta1_Block: @unchecked Sendable {}
extension Cosmos_Base_Tendermint_V1beta1_Header: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.base.tendermint.v1beta1"

extension Cosmos_Base_Tendermint_V1beta1_Block: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Block"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "header"),
    2: .same(proto: "data"),
    3: .same(proto: "evidence"),
    4: .standard(proto: "last_commit"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._header) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._data) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._evidence) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._lastCommit) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._header {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._data {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try { if let v = self._evidence {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try { if let v = self._lastCommit {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Base_Tendermint_V1beta1_Block, rhs: Cosmos_Base_Tendermint_V1beta1_Block) -> Bool {
    if lhs._header != rhs._header {return false}
    if lhs._data != rhs._data {return false}
    if lhs._evidence != rhs._evidence {return false}
    if lhs._lastCommit != rhs._lastCommit {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Base_Tendermint_V1beta1_Header: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Header"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "version"),
    2: .standard(proto: "chain_id"),
    3: .same(proto: "height"),
    4: .same(proto: "time"),
    5: .standard(proto: "last_block_id"),
    6: .standard(proto: "last_commit_hash"),
    7: .standard(proto: "data_hash"),
    8: .standard(proto: "validators_hash"),
    9: .standard(proto: "next_validators_hash"),
    10: .standard(proto: "consensus_hash"),
    11: .standard(proto: "app_hash"),
    12: .standard(proto: "last_results_hash"),
    13: .standard(proto: "evidence_hash"),
    14: .standard(proto: "proposer_address"),
  ]

  fileprivate class _StorageClass {
    var _version: Tendermint_Version_Consensus? = nil
    var _chainID: String = String()
    var _height: Int64 = 0
    var _time: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
    var _lastBlockID: Tendermint_Types_BlockID? = nil
    var _lastCommitHash: Data = Data()
    var _dataHash: Data = Data()
    var _validatorsHash: Data = Data()
    var _nextValidatorsHash: Data = Data()
    var _consensusHash: Data = Data()
    var _appHash: Data = Data()
    var _lastResultsHash: Data = Data()
    var _evidenceHash: Data = Data()
    var _proposerAddress: String = String()

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _version = source._version
      _chainID = source._chainID
      _height = source._height
      _time = source._time
      _lastBlockID = source._lastBlockID
      _lastCommitHash = source._lastCommitHash
      _dataHash = source._dataHash
      _validatorsHash = source._validatorsHash
      _nextValidatorsHash = source._nextValidatorsHash
      _consensusHash = source._consensusHash
      _appHash = source._appHash
      _lastResultsHash = source._lastResultsHash
      _evidenceHash = source._evidenceHash
      _proposerAddress = source._proposerAddress
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every case branch when no optimizations are
        // enabled. https://github.com/apple/swift-protobuf/issues/1034
        switch fieldNumber {
        case 1: try { try decoder.decodeSingularMessageField(value: &_storage._version) }()
        case 2: try { try decoder.decodeSingularStringField(value: &_storage._chainID) }()
        case 3: try { try decoder.decodeSingularInt64Field(value: &_storage._height) }()
        case 4: try { try decoder.decodeSingularMessageField(value: &_storage._time) }()
        case 5: try { try decoder.decodeSingularMessageField(value: &_storage._lastBlockID) }()
        case 6: try { try decoder.decodeSingularBytesField(value: &_storage._lastCommitHash) }()
        case 7: try { try decoder.decodeSingularBytesField(value: &_storage._dataHash) }()
        case 8: try { try decoder.decodeSingularBytesField(value: &_storage._validatorsHash) }()
        case 9: try { try decoder.decodeSingularBytesField(value: &_storage._nextValidatorsHash) }()
        case 10: try { try decoder.decodeSingularBytesField(value: &_storage._consensusHash) }()
        case 11: try { try decoder.decodeSingularBytesField(value: &_storage._appHash) }()
        case 12: try { try decoder.decodeSingularBytesField(value: &_storage._lastResultsHash) }()
        case 13: try { try decoder.decodeSingularBytesField(value: &_storage._evidenceHash) }()
        case 14: try { try decoder.decodeSingularStringField(value: &_storage._proposerAddress) }()
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every if/case branch local when no optimizations
      // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
      // https://github.com/apple/swift-protobuf/issues/1182
      try { if let v = _storage._version {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      } }()
      if !_storage._chainID.isEmpty {
        try visitor.visitSingularStringField(value: _storage._chainID, fieldNumber: 2)
      }
      if _storage._height != 0 {
        try visitor.visitSingularInt64Field(value: _storage._height, fieldNumber: 3)
      }
      try { if let v = _storage._time {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      } }()
      try { if let v = _storage._lastBlockID {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      } }()
      if !_storage._lastCommitHash.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._lastCommitHash, fieldNumber: 6)
      }
      if !_storage._dataHash.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._dataHash, fieldNumber: 7)
      }
      if !_storage._validatorsHash.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._validatorsHash, fieldNumber: 8)
      }
      if !_storage._nextValidatorsHash.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._nextValidatorsHash, fieldNumber: 9)
      }
      if !_storage._consensusHash.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._consensusHash, fieldNumber: 10)
      }
      if !_storage._appHash.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._appHash, fieldNumber: 11)
      }
      if !_storage._lastResultsHash.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._lastResultsHash, fieldNumber: 12)
      }
      if !_storage._evidenceHash.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._evidenceHash, fieldNumber: 13)
      }
      if !_storage._proposerAddress.isEmpty {
        try visitor.visitSingularStringField(value: _storage._proposerAddress, fieldNumber: 14)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Base_Tendermint_V1beta1_Header, rhs: Cosmos_Base_Tendermint_V1beta1_Header) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._version != rhs_storage._version {return false}
        if _storage._chainID != rhs_storage._chainID {return false}
        if _storage._height != rhs_storage._height {return false}
        if _storage._time != rhs_storage._time {return false}
        if _storage._lastBlockID != rhs_storage._lastBlockID {return false}
        if _storage._lastCommitHash != rhs_storage._lastCommitHash {return false}
        if _storage._dataHash != rhs_storage._dataHash {return false}
        if _storage._validatorsHash != rhs_storage._validatorsHash {return false}
        if _storage._nextValidatorsHash != rhs_storage._nextValidatorsHash {return false}
        if _storage._consensusHash != rhs_storage._consensusHash {return false}
        if _storage._appHash != rhs_storage._appHash {return false}
        if _storage._lastResultsHash != rhs_storage._lastResultsHash {return false}
        if _storage._evidenceHash != rhs_storage._evidenceHash {return false}
        if _storage._proposerAddress != rhs_storage._proposerAddress {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
