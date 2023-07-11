//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: kava/savings/v1beta1/query.proto
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
import NIOConcurrencyHelpers
import SwiftProtobuf


/// Query defines the gRPC querier service for savings module
///
/// Usage: instantiate `Kava_Savings_V1beta1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Kava_Savings_V1beta1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Kava_Savings_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func params(
    _ request: Kava_Savings_V1beta1_QueryParamsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Savings_V1beta1_QueryParamsRequest, Kava_Savings_V1beta1_QueryParamsResponse>

  func deposits(
    _ request: Kava_Savings_V1beta1_QueryDepositsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Savings_V1beta1_QueryDepositsRequest, Kava_Savings_V1beta1_QueryDepositsResponse>

  func totalSupply(
    _ request: Kava_Savings_V1beta1_QueryTotalSupplyRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Savings_V1beta1_QueryTotalSupplyRequest, Kava_Savings_V1beta1_QueryTotalSupplyResponse>
}

extension Kava_Savings_V1beta1_QueryClientProtocol {
  internal var serviceName: String {
    return "kava.savings.v1beta1.Query"
  }

  /// Params queries all parameters of the savings module.
  ///
  /// - Parameters:
  ///   - request: Request to send to Params.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func params(
    _ request: Kava_Savings_V1beta1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Savings_V1beta1_QueryParamsRequest, Kava_Savings_V1beta1_QueryParamsResponse> {
    return self.makeUnaryCall(
      path: Kava_Savings_V1beta1_QueryClientMetadata.Methods.params.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeParamsInterceptors() ?? []
    )
  }

  /// Deposits queries savings deposits.
  ///
  /// - Parameters:
  ///   - request: Request to send to Deposits.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func deposits(
    _ request: Kava_Savings_V1beta1_QueryDepositsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Savings_V1beta1_QueryDepositsRequest, Kava_Savings_V1beta1_QueryDepositsResponse> {
    return self.makeUnaryCall(
      path: Kava_Savings_V1beta1_QueryClientMetadata.Methods.deposits.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDepositsInterceptors() ?? []
    )
  }

  /// TotalSupply returns the total sum of all coins currently locked into the savings module.
  ///
  /// - Parameters:
  ///   - request: Request to send to TotalSupply.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func totalSupply(
    _ request: Kava_Savings_V1beta1_QueryTotalSupplyRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Savings_V1beta1_QueryTotalSupplyRequest, Kava_Savings_V1beta1_QueryTotalSupplyResponse> {
    return self.makeUnaryCall(
      path: Kava_Savings_V1beta1_QueryClientMetadata.Methods.totalSupply.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeTotalSupplyInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Kava_Savings_V1beta1_QueryClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Kava_Savings_V1beta1_QueryNIOClient")
internal final class Kava_Savings_V1beta1_QueryClient: Kava_Savings_V1beta1_QueryClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Kava_Savings_V1beta1_QueryClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Kava_Savings_V1beta1_QueryClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the kava.savings.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Kava_Savings_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Kava_Savings_V1beta1_QueryNIOClient: Kava_Savings_V1beta1_QueryClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Kava_Savings_V1beta1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the kava.savings.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Kava_Savings_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query defines the gRPC querier service for savings module
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Kava_Savings_V1beta1_QueryAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Kava_Savings_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func makeParamsCall(
    _ request: Kava_Savings_V1beta1_QueryParamsRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Kava_Savings_V1beta1_QueryParamsRequest, Kava_Savings_V1beta1_QueryParamsResponse>

  func makeDepositsCall(
    _ request: Kava_Savings_V1beta1_QueryDepositsRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Kava_Savings_V1beta1_QueryDepositsRequest, Kava_Savings_V1beta1_QueryDepositsResponse>

  func makeTotalSupplyCall(
    _ request: Kava_Savings_V1beta1_QueryTotalSupplyRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Kava_Savings_V1beta1_QueryTotalSupplyRequest, Kava_Savings_V1beta1_QueryTotalSupplyResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Kava_Savings_V1beta1_QueryAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Kava_Savings_V1beta1_QueryClientMetadata.serviceDescriptor
  }

  internal var interceptors: Kava_Savings_V1beta1_QueryClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeParamsCall(
    _ request: Kava_Savings_V1beta1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Kava_Savings_V1beta1_QueryParamsRequest, Kava_Savings_V1beta1_QueryParamsResponse> {
    return self.makeAsyncUnaryCall(
      path: Kava_Savings_V1beta1_QueryClientMetadata.Methods.params.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeParamsInterceptors() ?? []
    )
  }

  internal func makeDepositsCall(
    _ request: Kava_Savings_V1beta1_QueryDepositsRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Kava_Savings_V1beta1_QueryDepositsRequest, Kava_Savings_V1beta1_QueryDepositsResponse> {
    return self.makeAsyncUnaryCall(
      path: Kava_Savings_V1beta1_QueryClientMetadata.Methods.deposits.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDepositsInterceptors() ?? []
    )
  }

  internal func makeTotalSupplyCall(
    _ request: Kava_Savings_V1beta1_QueryTotalSupplyRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Kava_Savings_V1beta1_QueryTotalSupplyRequest, Kava_Savings_V1beta1_QueryTotalSupplyResponse> {
    return self.makeAsyncUnaryCall(
      path: Kava_Savings_V1beta1_QueryClientMetadata.Methods.totalSupply.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeTotalSupplyInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Kava_Savings_V1beta1_QueryAsyncClientProtocol {
  internal func params(
    _ request: Kava_Savings_V1beta1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Kava_Savings_V1beta1_QueryParamsResponse {
    return try await self.performAsyncUnaryCall(
      path: Kava_Savings_V1beta1_QueryClientMetadata.Methods.params.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeParamsInterceptors() ?? []
    )
  }

  internal func deposits(
    _ request: Kava_Savings_V1beta1_QueryDepositsRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Kava_Savings_V1beta1_QueryDepositsResponse {
    return try await self.performAsyncUnaryCall(
      path: Kava_Savings_V1beta1_QueryClientMetadata.Methods.deposits.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDepositsInterceptors() ?? []
    )
  }

  internal func totalSupply(
    _ request: Kava_Savings_V1beta1_QueryTotalSupplyRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Kava_Savings_V1beta1_QueryTotalSupplyResponse {
    return try await self.performAsyncUnaryCall(
      path: Kava_Savings_V1beta1_QueryClientMetadata.Methods.totalSupply.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeTotalSupplyInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Kava_Savings_V1beta1_QueryAsyncClient: Kava_Savings_V1beta1_QueryAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Kava_Savings_V1beta1_QueryClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Kava_Savings_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Kava_Savings_V1beta1_QueryClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'params'.
  func makeParamsInterceptors() -> [ClientInterceptor<Kava_Savings_V1beta1_QueryParamsRequest, Kava_Savings_V1beta1_QueryParamsResponse>]

  /// - Returns: Interceptors to use when invoking 'deposits'.
  func makeDepositsInterceptors() -> [ClientInterceptor<Kava_Savings_V1beta1_QueryDepositsRequest, Kava_Savings_V1beta1_QueryDepositsResponse>]

  /// - Returns: Interceptors to use when invoking 'totalSupply'.
  func makeTotalSupplyInterceptors() -> [ClientInterceptor<Kava_Savings_V1beta1_QueryTotalSupplyRequest, Kava_Savings_V1beta1_QueryTotalSupplyResponse>]
}

internal enum Kava_Savings_V1beta1_QueryClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "kava.savings.v1beta1.Query",
    methods: [
      Kava_Savings_V1beta1_QueryClientMetadata.Methods.params,
      Kava_Savings_V1beta1_QueryClientMetadata.Methods.deposits,
      Kava_Savings_V1beta1_QueryClientMetadata.Methods.totalSupply,
    ]
  )

  internal enum Methods {
    internal static let params = GRPCMethodDescriptor(
      name: "Params",
      path: "/kava.savings.v1beta1.Query/Params",
      type: GRPCCallType.unary
    )

    internal static let deposits = GRPCMethodDescriptor(
      name: "Deposits",
      path: "/kava.savings.v1beta1.Query/Deposits",
      type: GRPCCallType.unary
    )

    internal static let totalSupply = GRPCMethodDescriptor(
      name: "TotalSupply",
      path: "/kava.savings.v1beta1.Query/TotalSupply",
      type: GRPCCallType.unary
    )
  }
}

/// Query defines the gRPC querier service for savings module
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Kava_Savings_V1beta1_QueryProvider: CallHandlerProvider {
  var interceptors: Kava_Savings_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  /// Params queries all parameters of the savings module.
  func params(request: Kava_Savings_V1beta1_QueryParamsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Savings_V1beta1_QueryParamsResponse>

  /// Deposits queries savings deposits.
  func deposits(request: Kava_Savings_V1beta1_QueryDepositsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Savings_V1beta1_QueryDepositsResponse>

  /// TotalSupply returns the total sum of all coins currently locked into the savings module.
  func totalSupply(request: Kava_Savings_V1beta1_QueryTotalSupplyRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Savings_V1beta1_QueryTotalSupplyResponse>
}

extension Kava_Savings_V1beta1_QueryProvider {
  internal var serviceName: Substring {
    return Kava_Savings_V1beta1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

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
        requestDeserializer: ProtobufDeserializer<Kava_Savings_V1beta1_QueryParamsRequest>(),
        responseSerializer: ProtobufSerializer<Kava_Savings_V1beta1_QueryParamsResponse>(),
        interceptors: self.interceptors?.makeParamsInterceptors() ?? [],
        userFunction: self.params(request:context:)
      )

    case "Deposits":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Savings_V1beta1_QueryDepositsRequest>(),
        responseSerializer: ProtobufSerializer<Kava_Savings_V1beta1_QueryDepositsResponse>(),
        interceptors: self.interceptors?.makeDepositsInterceptors() ?? [],
        userFunction: self.deposits(request:context:)
      )

    case "TotalSupply":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Savings_V1beta1_QueryTotalSupplyRequest>(),
        responseSerializer: ProtobufSerializer<Kava_Savings_V1beta1_QueryTotalSupplyResponse>(),
        interceptors: self.interceptors?.makeTotalSupplyInterceptors() ?? [],
        userFunction: self.totalSupply(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Query defines the gRPC querier service for savings module
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Kava_Savings_V1beta1_QueryAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Kava_Savings_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  /// Params queries all parameters of the savings module.
  @Sendable func params(
    request: Kava_Savings_V1beta1_QueryParamsRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Kava_Savings_V1beta1_QueryParamsResponse

  /// Deposits queries savings deposits.
  @Sendable func deposits(
    request: Kava_Savings_V1beta1_QueryDepositsRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Kava_Savings_V1beta1_QueryDepositsResponse

  /// TotalSupply returns the total sum of all coins currently locked into the savings module.
  @Sendable func totalSupply(
    request: Kava_Savings_V1beta1_QueryTotalSupplyRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Kava_Savings_V1beta1_QueryTotalSupplyResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Kava_Savings_V1beta1_QueryAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Kava_Savings_V1beta1_QueryServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Kava_Savings_V1beta1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Kava_Savings_V1beta1_QueryServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Params":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Savings_V1beta1_QueryParamsRequest>(),
        responseSerializer: ProtobufSerializer<Kava_Savings_V1beta1_QueryParamsResponse>(),
        interceptors: self.interceptors?.makeParamsInterceptors() ?? [],
        wrapping: self.params(request:context:)
      )

    case "Deposits":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Savings_V1beta1_QueryDepositsRequest>(),
        responseSerializer: ProtobufSerializer<Kava_Savings_V1beta1_QueryDepositsResponse>(),
        interceptors: self.interceptors?.makeDepositsInterceptors() ?? [],
        wrapping: self.deposits(request:context:)
      )

    case "TotalSupply":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Kava_Savings_V1beta1_QueryTotalSupplyRequest>(),
        responseSerializer: ProtobufSerializer<Kava_Savings_V1beta1_QueryTotalSupplyResponse>(),
        interceptors: self.interceptors?.makeTotalSupplyInterceptors() ?? [],
        wrapping: self.totalSupply(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Kava_Savings_V1beta1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'params'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeParamsInterceptors() -> [ServerInterceptor<Kava_Savings_V1beta1_QueryParamsRequest, Kava_Savings_V1beta1_QueryParamsResponse>]

  /// - Returns: Interceptors to use when handling 'deposits'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeDepositsInterceptors() -> [ServerInterceptor<Kava_Savings_V1beta1_QueryDepositsRequest, Kava_Savings_V1beta1_QueryDepositsResponse>]

  /// - Returns: Interceptors to use when handling 'totalSupply'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeTotalSupplyInterceptors() -> [ServerInterceptor<Kava_Savings_V1beta1_QueryTotalSupplyRequest, Kava_Savings_V1beta1_QueryTotalSupplyResponse>]
}

internal enum Kava_Savings_V1beta1_QueryServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "kava.savings.v1beta1.Query",
    methods: [
      Kava_Savings_V1beta1_QueryServerMetadata.Methods.params,
      Kava_Savings_V1beta1_QueryServerMetadata.Methods.deposits,
      Kava_Savings_V1beta1_QueryServerMetadata.Methods.totalSupply,
    ]
  )

  internal enum Methods {
    internal static let params = GRPCMethodDescriptor(
      name: "Params",
      path: "/kava.savings.v1beta1.Query/Params",
      type: GRPCCallType.unary
    )

    internal static let deposits = GRPCMethodDescriptor(
      name: "Deposits",
      path: "/kava.savings.v1beta1.Query/Deposits",
      type: GRPCCallType.unary
    )

    internal static let totalSupply = GRPCMethodDescriptor(
      name: "TotalSupply",
      path: "/kava.savings.v1beta1.Query/TotalSupply",
      type: GRPCCallType.unary
    )
  }
}