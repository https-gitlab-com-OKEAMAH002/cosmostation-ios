// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: crescent/lpfarm/v1beta1/lpfarm.proto
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

struct Crescent_Lpfarm_V1beta1_Params {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var privatePlanCreationFee: [Cosmos_Base_V1beta1_Coin] = []

  var feeCollector: String = String()

  var maxNumPrivatePlans: UInt32 = 0

  var maxBlockDuration: SwiftProtobuf.Google_Protobuf_Duration {
    get {return _maxBlockDuration ?? SwiftProtobuf.Google_Protobuf_Duration()}
    set {_maxBlockDuration = newValue}
  }
  /// Returns true if `maxBlockDuration` has been explicitly set.
  var hasMaxBlockDuration: Bool {return self._maxBlockDuration != nil}
  /// Clears the value of `maxBlockDuration`. Subsequent reads from it will return its default value.
  mutating func clearMaxBlockDuration() {self._maxBlockDuration = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _maxBlockDuration: SwiftProtobuf.Google_Protobuf_Duration? = nil
}

struct Crescent_Lpfarm_V1beta1_Plan {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: UInt64 = 0

  var description_p: String = String()

  var farmingPoolAddress: String = String()

  var terminationAddress: String = String()

  var rewardAllocations: [Crescent_Lpfarm_V1beta1_RewardAllocation] = []

  var startTime: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _startTime ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_startTime = newValue}
  }
  /// Returns true if `startTime` has been explicitly set.
  var hasStartTime: Bool {return self._startTime != nil}
  /// Clears the value of `startTime`. Subsequent reads from it will return its default value.
  mutating func clearStartTime() {self._startTime = nil}

  var endTime: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _endTime ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_endTime = newValue}
  }
  /// Returns true if `endTime` has been explicitly set.
  var hasEndTime: Bool {return self._endTime != nil}
  /// Clears the value of `endTime`. Subsequent reads from it will return its default value.
  mutating func clearEndTime() {self._endTime = nil}

  var isPrivate: Bool = false

  var isTerminated: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _startTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
  fileprivate var _endTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

struct Crescent_Lpfarm_V1beta1_RewardAllocation {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var denom: String = String()

  var pairID: UInt64 = 0

  var rewardsPerDay: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Crescent_Lpfarm_V1beta1_Farm {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var totalFarmingAmount: String = String()

  var currentRewards: [Cosmos_Base_V1beta1_DecCoin] = []

  var outstandingRewards: [Cosmos_Base_V1beta1_DecCoin] = []

  var period: UInt64 = 0

  var previousShare: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Crescent_Lpfarm_V1beta1_Position {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var farmer: String = String()

  var denom: String = String()

  var farmingAmount: String = String()

  var previousPeriod: UInt64 = 0

  var startingBlockHeight: Int64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Crescent_Lpfarm_V1beta1_HistoricalRewards {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var cumulativeUnitRewards: [Cosmos_Base_V1beta1_DecCoin] = []

  var referenceCount: UInt32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Crescent_Lpfarm_V1beta1_Params: @unchecked Sendable {}
extension Crescent_Lpfarm_V1beta1_Plan: @unchecked Sendable {}
extension Crescent_Lpfarm_V1beta1_RewardAllocation: @unchecked Sendable {}
extension Crescent_Lpfarm_V1beta1_Farm: @unchecked Sendable {}
extension Crescent_Lpfarm_V1beta1_Position: @unchecked Sendable {}
extension Crescent_Lpfarm_V1beta1_HistoricalRewards: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "crescent.lpfarm.v1beta1"

extension Crescent_Lpfarm_V1beta1_Params: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Params"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "private_plan_creation_fee"),
    2: .standard(proto: "fee_collector"),
    3: .standard(proto: "max_num_private_plans"),
    4: .standard(proto: "max_block_duration"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.privatePlanCreationFee) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.feeCollector) }()
      case 3: try { try decoder.decodeSingularUInt32Field(value: &self.maxNumPrivatePlans) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._maxBlockDuration) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.privatePlanCreationFee.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.privatePlanCreationFee, fieldNumber: 1)
    }
    if !self.feeCollector.isEmpty {
      try visitor.visitSingularStringField(value: self.feeCollector, fieldNumber: 2)
    }
    if self.maxNumPrivatePlans != 0 {
      try visitor.visitSingularUInt32Field(value: self.maxNumPrivatePlans, fieldNumber: 3)
    }
    try { if let v = self._maxBlockDuration {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Crescent_Lpfarm_V1beta1_Params, rhs: Crescent_Lpfarm_V1beta1_Params) -> Bool {
    if lhs.privatePlanCreationFee != rhs.privatePlanCreationFee {return false}
    if lhs.feeCollector != rhs.feeCollector {return false}
    if lhs.maxNumPrivatePlans != rhs.maxNumPrivatePlans {return false}
    if lhs._maxBlockDuration != rhs._maxBlockDuration {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Crescent_Lpfarm_V1beta1_Plan: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Plan"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "description"),
    3: .standard(proto: "farming_pool_address"),
    4: .standard(proto: "termination_address"),
    5: .standard(proto: "reward_allocations"),
    6: .standard(proto: "start_time"),
    7: .standard(proto: "end_time"),
    8: .standard(proto: "is_private"),
    9: .standard(proto: "is_terminated"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.id) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.description_p) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.farmingPoolAddress) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.terminationAddress) }()
      case 5: try { try decoder.decodeRepeatedMessageField(value: &self.rewardAllocations) }()
      case 6: try { try decoder.decodeSingularMessageField(value: &self._startTime) }()
      case 7: try { try decoder.decodeSingularMessageField(value: &self._endTime) }()
      case 8: try { try decoder.decodeSingularBoolField(value: &self.isPrivate) }()
      case 9: try { try decoder.decodeSingularBoolField(value: &self.isTerminated) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if self.id != 0 {
      try visitor.visitSingularUInt64Field(value: self.id, fieldNumber: 1)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    if !self.farmingPoolAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.farmingPoolAddress, fieldNumber: 3)
    }
    if !self.terminationAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.terminationAddress, fieldNumber: 4)
    }
    if !self.rewardAllocations.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.rewardAllocations, fieldNumber: 5)
    }
    try { if let v = self._startTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
    } }()
    try { if let v = self._endTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    } }()
    if self.isPrivate != false {
      try visitor.visitSingularBoolField(value: self.isPrivate, fieldNumber: 8)
    }
    if self.isTerminated != false {
      try visitor.visitSingularBoolField(value: self.isTerminated, fieldNumber: 9)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Crescent_Lpfarm_V1beta1_Plan, rhs: Crescent_Lpfarm_V1beta1_Plan) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.farmingPoolAddress != rhs.farmingPoolAddress {return false}
    if lhs.terminationAddress != rhs.terminationAddress {return false}
    if lhs.rewardAllocations != rhs.rewardAllocations {return false}
    if lhs._startTime != rhs._startTime {return false}
    if lhs._endTime != rhs._endTime {return false}
    if lhs.isPrivate != rhs.isPrivate {return false}
    if lhs.isTerminated != rhs.isTerminated {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Crescent_Lpfarm_V1beta1_RewardAllocation: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RewardAllocation"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "denom"),
    2: .standard(proto: "pair_id"),
    3: .standard(proto: "rewards_per_day"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.denom) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.pairID) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.rewardsPerDay) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.denom.isEmpty {
      try visitor.visitSingularStringField(value: self.denom, fieldNumber: 1)
    }
    if self.pairID != 0 {
      try visitor.visitSingularUInt64Field(value: self.pairID, fieldNumber: 2)
    }
    if !self.rewardsPerDay.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.rewardsPerDay, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Crescent_Lpfarm_V1beta1_RewardAllocation, rhs: Crescent_Lpfarm_V1beta1_RewardAllocation) -> Bool {
    if lhs.denom != rhs.denom {return false}
    if lhs.pairID != rhs.pairID {return false}
    if lhs.rewardsPerDay != rhs.rewardsPerDay {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Crescent_Lpfarm_V1beta1_Farm: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Farm"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "total_farming_amount"),
    2: .standard(proto: "current_rewards"),
    3: .standard(proto: "outstanding_rewards"),
    4: .same(proto: "period"),
    5: .standard(proto: "previous_share"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.totalFarmingAmount) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.currentRewards) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.outstandingRewards) }()
      case 4: try { try decoder.decodeSingularUInt64Field(value: &self.period) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.previousShare) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.totalFarmingAmount.isEmpty {
      try visitor.visitSingularStringField(value: self.totalFarmingAmount, fieldNumber: 1)
    }
    if !self.currentRewards.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.currentRewards, fieldNumber: 2)
    }
    if !self.outstandingRewards.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.outstandingRewards, fieldNumber: 3)
    }
    if self.period != 0 {
      try visitor.visitSingularUInt64Field(value: self.period, fieldNumber: 4)
    }
    if !self.previousShare.isEmpty {
      try visitor.visitSingularStringField(value: self.previousShare, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Crescent_Lpfarm_V1beta1_Farm, rhs: Crescent_Lpfarm_V1beta1_Farm) -> Bool {
    if lhs.totalFarmingAmount != rhs.totalFarmingAmount {return false}
    if lhs.currentRewards != rhs.currentRewards {return false}
    if lhs.outstandingRewards != rhs.outstandingRewards {return false}
    if lhs.period != rhs.period {return false}
    if lhs.previousShare != rhs.previousShare {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Crescent_Lpfarm_V1beta1_Position: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Position"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "farmer"),
    2: .same(proto: "denom"),
    3: .standard(proto: "farming_amount"),
    4: .standard(proto: "previous_period"),
    5: .standard(proto: "starting_block_height"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.farmer) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.denom) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.farmingAmount) }()
      case 4: try { try decoder.decodeSingularUInt64Field(value: &self.previousPeriod) }()
      case 5: try { try decoder.decodeSingularInt64Field(value: &self.startingBlockHeight) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.farmer.isEmpty {
      try visitor.visitSingularStringField(value: self.farmer, fieldNumber: 1)
    }
    if !self.denom.isEmpty {
      try visitor.visitSingularStringField(value: self.denom, fieldNumber: 2)
    }
    if !self.farmingAmount.isEmpty {
      try visitor.visitSingularStringField(value: self.farmingAmount, fieldNumber: 3)
    }
    if self.previousPeriod != 0 {
      try visitor.visitSingularUInt64Field(value: self.previousPeriod, fieldNumber: 4)
    }
    if self.startingBlockHeight != 0 {
      try visitor.visitSingularInt64Field(value: self.startingBlockHeight, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Crescent_Lpfarm_V1beta1_Position, rhs: Crescent_Lpfarm_V1beta1_Position) -> Bool {
    if lhs.farmer != rhs.farmer {return false}
    if lhs.denom != rhs.denom {return false}
    if lhs.farmingAmount != rhs.farmingAmount {return false}
    if lhs.previousPeriod != rhs.previousPeriod {return false}
    if lhs.startingBlockHeight != rhs.startingBlockHeight {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Crescent_Lpfarm_V1beta1_HistoricalRewards: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".HistoricalRewards"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "cumulative_unit_rewards"),
    2: .standard(proto: "reference_count"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.cumulativeUnitRewards) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.referenceCount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.cumulativeUnitRewards.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.cumulativeUnitRewards, fieldNumber: 1)
    }
    if self.referenceCount != 0 {
      try visitor.visitSingularUInt32Field(value: self.referenceCount, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Crescent_Lpfarm_V1beta1_HistoricalRewards, rhs: Crescent_Lpfarm_V1beta1_HistoricalRewards) -> Bool {
    if lhs.cumulativeUnitRewards != rhs.cumulativeUnitRewards {return false}
    if lhs.referenceCount != rhs.referenceCount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
