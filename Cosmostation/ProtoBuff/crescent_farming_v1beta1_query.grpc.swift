//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: crescent/farming/v1beta1/query.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import SwiftProtobuf


/// Query defines the gRPC query service for the farming module.
///
/// Usage: instantiate `Crescent_Farming_V1beta1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Crescent_Farming_V1beta1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Crescent_Farming_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func params(
    _ request: Crescent_Farming_V1beta1_QueryParamsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Crescent_Farming_V1beta1_QueryParamsRequest, Crescent_Farming_V1beta1_QueryParamsResponse>

  func plans(
    _ request: Crescent_Farming_V1beta1_QueryPlansRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Crescent_Farming_V1beta1_QueryPlansRequest, Crescent_Farming_V1beta1_QueryPlansResponse>

  func plan(
    _ request: Crescent_Farming_V1beta1_QueryPlanRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Crescent_Farming_V1beta1_QueryPlanRequest, Crescent_Farming_V1beta1_QueryPlanResponse>

  func stakings(
    _ request: Crescent_Farming_V1beta1_QueryStakingsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Crescent_Farming_V1beta1_QueryStakingsRequest, Crescent_Farming_V1beta1_QueryStakingsResponse>

  func totalStakings(
    _ request: Crescent_Farming_V1beta1_QueryTotalStakingsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Crescent_Farming_V1beta1_QueryTotalStakingsRequest, Crescent_Farming_V1beta1_QueryTotalStakingsResponse>

  func rewards(
    _ request: Crescent_Farming_V1beta1_QueryRewardsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Crescent_Farming_V1beta1_QueryRewardsRequest, Crescent_Farming_V1beta1_QueryRewardsResponse>

  func currentEpochDays(
    _ request: Crescent_Farming_V1beta1_QueryCurrentEpochDaysRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Crescent_Farming_V1beta1_QueryCurrentEpochDaysRequest, Crescent_Farming_V1beta1_QueryCurrentEpochDaysResponse>
}

extension Crescent_Farming_V1beta1_QueryClientProtocol {
  internal var serviceName: String {
    return "crescent.farming.v1beta1.Query"
  }

  /// Params returns parameters of the farming module.
  ///
  /// - Parameters:
  ///   - request: Request to send to Params.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func params(
    _ request: Crescent_Farming_V1beta1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Crescent_Farming_V1beta1_QueryParamsRequest, Crescent_Farming_V1beta1_QueryParamsResponse> {
    return self.makeUnaryCall(
      path: "/crescent.farming.v1beta1.Query/Params",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeParamsInterceptors() ?? []
    )
  }

  /// Plans returns all plans.
  ///
  /// - Parameters:
  ///   - request: Request to send to Plans.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func plans(
    _ request: Crescent_Farming_V1beta1_QueryPlansRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Crescent_Farming_V1beta1_QueryPlansRequest, Crescent_Farming_V1beta1_QueryPlansResponse> {
    return self.makeUnaryCall(
      path: "/crescent.farming.v1beta1.Query/Plans",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePlansInterceptors() ?? []
    )
  }

  /// Plan returns a specific plan.
  ///
  /// - Parameters:
  ///   - request: Request to send to Plan.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func plan(
    _ request: Crescent_Farming_V1beta1_QueryPlanRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Crescent_Farming_V1beta1_QueryPlanRequest, Crescent_Farming_V1beta1_QueryPlanResponse> {
    return self.makeUnaryCall(
      path: "/crescent.farming.v1beta1.Query/Plan",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePlanInterceptors() ?? []
    )
  }

  /// Stakings returns all stakings by a farmer.
  ///
  /// - Parameters:
  ///   - request: Request to send to Stakings.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func stakings(
    _ request: Crescent_Farming_V1beta1_QueryStakingsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Crescent_Farming_V1beta1_QueryStakingsRequest, Crescent_Farming_V1beta1_QueryStakingsResponse> {
    return self.makeUnaryCall(
      path: "/crescent.farming.v1beta1.Query/Stakings",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeStakingsInterceptors() ?? []
    )
  }

  /// TotalStakings returns total staking amount for a staking coin denom
  ///
  /// - Parameters:
  ///   - request: Request to send to TotalStakings.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func totalStakings(
    _ request: Crescent_Farming_V1beta1_QueryTotalStakingsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Crescent_Farming_V1beta1_QueryTotalStakingsRequest, Crescent_Farming_V1beta1_QueryTotalStakingsResponse> {
    return self.makeUnaryCall(
      path: "/crescent.farming.v1beta1.Query/TotalStakings",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeTotalStakingsInterceptors() ?? []
    )
  }

  /// Rewards returns rewards for a farmer
  ///
  /// - Parameters:
  ///   - request: Request to send to Rewards.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func rewards(
    _ request: Crescent_Farming_V1beta1_QueryRewardsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Crescent_Farming_V1beta1_QueryRewardsRequest, Crescent_Farming_V1beta1_QueryRewardsResponse> {
    return self.makeUnaryCall(
      path: "/crescent.farming.v1beta1.Query/Rewards",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRewardsInterceptors() ?? []
    )
  }

  /// CurrentEpochDays returns current epoch days.
  ///
  /// - Parameters:
  ///   - request: Request to send to CurrentEpochDays.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func currentEpochDays(
    _ request: Crescent_Farming_V1beta1_QueryCurrentEpochDaysRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Crescent_Farming_V1beta1_QueryCurrentEpochDaysRequest, Crescent_Farming_V1beta1_QueryCurrentEpochDaysResponse> {
    return self.makeUnaryCall(
      path: "/crescent.farming.v1beta1.Query/CurrentEpochDays",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCurrentEpochDaysInterceptors() ?? []
    )
  }
}

internal protocol Crescent_Farming_V1beta1_QueryClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'params'.
  func makeParamsInterceptors() -> [ClientInterceptor<Crescent_Farming_V1beta1_QueryParamsRequest, Crescent_Farming_V1beta1_QueryParamsResponse>]

  /// - Returns: Interceptors to use when invoking 'plans'.
  func makePlansInterceptors() -> [ClientInterceptor<Crescent_Farming_V1beta1_QueryPlansRequest, Crescent_Farming_V1beta1_QueryPlansResponse>]

  /// - Returns: Interceptors to use when invoking 'plan'.
  func makePlanInterceptors() -> [ClientInterceptor<Crescent_Farming_V1beta1_QueryPlanRequest, Crescent_Farming_V1beta1_QueryPlanResponse>]

  /// - Returns: Interceptors to use when invoking 'stakings'.
  func makeStakingsInterceptors() -> [ClientInterceptor<Crescent_Farming_V1beta1_QueryStakingsRequest, Crescent_Farming_V1beta1_QueryStakingsResponse>]

  /// - Returns: Interceptors to use when invoking 'totalStakings'.
  func makeTotalStakingsInterceptors() -> [ClientInterceptor<Crescent_Farming_V1beta1_QueryTotalStakingsRequest, Crescent_Farming_V1beta1_QueryTotalStakingsResponse>]

  /// - Returns: Interceptors to use when invoking 'rewards'.
  func makeRewardsInterceptors() -> [ClientInterceptor<Crescent_Farming_V1beta1_QueryRewardsRequest, Crescent_Farming_V1beta1_QueryRewardsResponse>]

  /// - Returns: Interceptors to use when invoking 'currentEpochDays'.
  func makeCurrentEpochDaysInterceptors() -> [ClientInterceptor<Crescent_Farming_V1beta1_QueryCurrentEpochDaysRequest, Crescent_Farming_V1beta1_QueryCurrentEpochDaysResponse>]
}

internal final class Crescent_Farming_V1beta1_QueryClient: Crescent_Farming_V1beta1_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Crescent_Farming_V1beta1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the crescent.farming.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Crescent_Farming_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query defines the gRPC query service for the farming module.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Crescent_Farming_V1beta1_QueryProvider: CallHandlerProvider {
  var interceptors: Crescent_Farming_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  /// Params returns parameters of the farming module.
  func params(request: Crescent_Farming_V1beta1_QueryParamsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Crescent_Farming_V1beta1_QueryParamsResponse>

  /// Plans returns all plans.
  func plans(request: Crescent_Farming_V1beta1_QueryPlansRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Crescent_Farming_V1beta1_QueryPlansResponse>

  /// Plan returns a specific plan.
  func plan(request: Crescent_Farming_V1beta1_QueryPlanRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Crescent_Farming_V1beta1_QueryPlanResponse>

  /// Stakings returns all stakings by a farmer.
  func stakings(request: Crescent_Farming_V1beta1_QueryStakingsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Crescent_Farming_V1beta1_QueryStakingsResponse>

  /// TotalStakings returns total staking amount for a staking coin denom
  func totalStakings(request: Crescent_Farming_V1beta1_QueryTotalStakingsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Crescent_Farming_V1beta1_QueryTotalStakingsResponse>

  /// Rewards returns rewards for a farmer
  func rewards(request: Crescent_Farming_V1beta1_QueryRewardsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Crescent_Farming_V1beta1_QueryRewardsResponse>

  /// CurrentEpochDays returns current epoch days.
  func currentEpochDays(request: Crescent_Farming_V1beta1_QueryCurrentEpochDaysRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Crescent_Farming_V1beta1_QueryCurrentEpochDaysResponse>
}

extension Crescent_Farming_V1beta1_QueryProvider {
  internal var serviceName: Substring { return "crescent.farming.v1beta1.Query" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Params":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Farming_V1beta1_QueryParamsRequest>(),
        responseSerializer: ProtobufSerializer<Crescent_Farming_V1beta1_QueryParamsResponse>(),
        interceptors: self.interceptors?.makeParamsInterceptors() ?? [],
        userFunction: self.params(request:context:)
      )

    case "Plans":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Farming_V1beta1_QueryPlansRequest>(),
        responseSerializer: ProtobufSerializer<Crescent_Farming_V1beta1_QueryPlansResponse>(),
        interceptors: self.interceptors?.makePlansInterceptors() ?? [],
        userFunction: self.plans(request:context:)
      )

    case "Plan":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Farming_V1beta1_QueryPlanRequest>(),
        responseSerializer: ProtobufSerializer<Crescent_Farming_V1beta1_QueryPlanResponse>(),
        interceptors: self.interceptors?.makePlanInterceptors() ?? [],
        userFunction: self.plan(request:context:)
      )

    case "Stakings":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Farming_V1beta1_QueryStakingsRequest>(),
        responseSerializer: ProtobufSerializer<Crescent_Farming_V1beta1_QueryStakingsResponse>(),
        interceptors: self.interceptors?.makeStakingsInterceptors() ?? [],
        userFunction: self.stakings(request:context:)
      )

    case "TotalStakings":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Farming_V1beta1_QueryTotalStakingsRequest>(),
        responseSerializer: ProtobufSerializer<Crescent_Farming_V1beta1_QueryTotalStakingsResponse>(),
        interceptors: self.interceptors?.makeTotalStakingsInterceptors() ?? [],
        userFunction: self.totalStakings(request:context:)
      )

    case "Rewards":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Farming_V1beta1_QueryRewardsRequest>(),
        responseSerializer: ProtobufSerializer<Crescent_Farming_V1beta1_QueryRewardsResponse>(),
        interceptors: self.interceptors?.makeRewardsInterceptors() ?? [],
        userFunction: self.rewards(request:context:)
      )

    case "CurrentEpochDays":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Crescent_Farming_V1beta1_QueryCurrentEpochDaysRequest>(),
        responseSerializer: ProtobufSerializer<Crescent_Farming_V1beta1_QueryCurrentEpochDaysResponse>(),
        interceptors: self.interceptors?.makeCurrentEpochDaysInterceptors() ?? [],
        userFunction: self.currentEpochDays(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Crescent_Farming_V1beta1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'params'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeParamsInterceptors() -> [ServerInterceptor<Crescent_Farming_V1beta1_QueryParamsRequest, Crescent_Farming_V1beta1_QueryParamsResponse>]

  /// - Returns: Interceptors to use when handling 'plans'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makePlansInterceptors() -> [ServerInterceptor<Crescent_Farming_V1beta1_QueryPlansRequest, Crescent_Farming_V1beta1_QueryPlansResponse>]

  /// - Returns: Interceptors to use when handling 'plan'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makePlanInterceptors() -> [ServerInterceptor<Crescent_Farming_V1beta1_QueryPlanRequest, Crescent_Farming_V1beta1_QueryPlanResponse>]

  /// - Returns: Interceptors to use when handling 'stakings'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeStakingsInterceptors() -> [ServerInterceptor<Crescent_Farming_V1beta1_QueryStakingsRequest, Crescent_Farming_V1beta1_QueryStakingsResponse>]

  /// - Returns: Interceptors to use when handling 'totalStakings'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeTotalStakingsInterceptors() -> [ServerInterceptor<Crescent_Farming_V1beta1_QueryTotalStakingsRequest, Crescent_Farming_V1beta1_QueryTotalStakingsResponse>]

  /// - Returns: Interceptors to use when handling 'rewards'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRewardsInterceptors() -> [ServerInterceptor<Crescent_Farming_V1beta1_QueryRewardsRequest, Crescent_Farming_V1beta1_QueryRewardsResponse>]

  /// - Returns: Interceptors to use when handling 'currentEpochDays'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCurrentEpochDaysInterceptors() -> [ServerInterceptor<Crescent_Farming_V1beta1_QueryCurrentEpochDaysRequest, Crescent_Farming_V1beta1_QueryCurrentEpochDaysResponse>]
}