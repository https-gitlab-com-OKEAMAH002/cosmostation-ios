//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: desmos/supply/v1/query.proto
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


/// Query defines the gRPC querier service.
///
/// Usage: instantiate `Desmos_Supply_V1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Desmos_Supply_V1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Desmos_Supply_V1_QueryClientInterceptorFactoryProtocol? { get }

  func total(
    _ request: Desmos_Supply_V1_QueryTotalRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Desmos_Supply_V1_QueryTotalRequest, Desmos_Supply_V1_QueryTotalResponse>

  func circulating(
    _ request: Desmos_Supply_V1_QueryCirculatingRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Desmos_Supply_V1_QueryCirculatingRequest, Desmos_Supply_V1_QueryCirculatingResponse>
}

extension Desmos_Supply_V1_QueryClientProtocol {
  internal var serviceName: String {
    return "desmos.supply.v1.Query"
  }

  /// Total queries the total supply of the given denom
  ///
  /// - Parameters:
  ///   - request: Request to send to Total.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func total(
    _ request: Desmos_Supply_V1_QueryTotalRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Desmos_Supply_V1_QueryTotalRequest, Desmos_Supply_V1_QueryTotalResponse> {
    return self.makeUnaryCall(
      path: Desmos_Supply_V1_QueryClientMetadata.Methods.total.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeTotalInterceptors() ?? []
    )
  }

  /// Circulating queries the amount of tokens circulating in the market of the
  /// given denom
  ///
  /// - Parameters:
  ///   - request: Request to send to Circulating.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func circulating(
    _ request: Desmos_Supply_V1_QueryCirculatingRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Desmos_Supply_V1_QueryCirculatingRequest, Desmos_Supply_V1_QueryCirculatingResponse> {
    return self.makeUnaryCall(
      path: Desmos_Supply_V1_QueryClientMetadata.Methods.circulating.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCirculatingInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Desmos_Supply_V1_QueryClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Desmos_Supply_V1_QueryNIOClient")
internal final class Desmos_Supply_V1_QueryClient: Desmos_Supply_V1_QueryClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Desmos_Supply_V1_QueryClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Desmos_Supply_V1_QueryClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the desmos.supply.v1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Desmos_Supply_V1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Desmos_Supply_V1_QueryNIOClient: Desmos_Supply_V1_QueryClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Desmos_Supply_V1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the desmos.supply.v1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Desmos_Supply_V1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query defines the gRPC querier service.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Desmos_Supply_V1_QueryAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Desmos_Supply_V1_QueryClientInterceptorFactoryProtocol? { get }

  func makeTotalCall(
    _ request: Desmos_Supply_V1_QueryTotalRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Desmos_Supply_V1_QueryTotalRequest, Desmos_Supply_V1_QueryTotalResponse>

  func makeCirculatingCall(
    _ request: Desmos_Supply_V1_QueryCirculatingRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Desmos_Supply_V1_QueryCirculatingRequest, Desmos_Supply_V1_QueryCirculatingResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Desmos_Supply_V1_QueryAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Desmos_Supply_V1_QueryClientMetadata.serviceDescriptor
  }

  internal var interceptors: Desmos_Supply_V1_QueryClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeTotalCall(
    _ request: Desmos_Supply_V1_QueryTotalRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Desmos_Supply_V1_QueryTotalRequest, Desmos_Supply_V1_QueryTotalResponse> {
    return self.makeAsyncUnaryCall(
      path: Desmos_Supply_V1_QueryClientMetadata.Methods.total.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeTotalInterceptors() ?? []
    )
  }

  internal func makeCirculatingCall(
    _ request: Desmos_Supply_V1_QueryCirculatingRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Desmos_Supply_V1_QueryCirculatingRequest, Desmos_Supply_V1_QueryCirculatingResponse> {
    return self.makeAsyncUnaryCall(
      path: Desmos_Supply_V1_QueryClientMetadata.Methods.circulating.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCirculatingInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Desmos_Supply_V1_QueryAsyncClientProtocol {
  internal func total(
    _ request: Desmos_Supply_V1_QueryTotalRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Desmos_Supply_V1_QueryTotalResponse {
    return try await self.performAsyncUnaryCall(
      path: Desmos_Supply_V1_QueryClientMetadata.Methods.total.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeTotalInterceptors() ?? []
    )
  }

  internal func circulating(
    _ request: Desmos_Supply_V1_QueryCirculatingRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Desmos_Supply_V1_QueryCirculatingResponse {
    return try await self.performAsyncUnaryCall(
      path: Desmos_Supply_V1_QueryClientMetadata.Methods.circulating.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCirculatingInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Desmos_Supply_V1_QueryAsyncClient: Desmos_Supply_V1_QueryAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Desmos_Supply_V1_QueryClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Desmos_Supply_V1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Desmos_Supply_V1_QueryClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'total'.
  func makeTotalInterceptors() -> [ClientInterceptor<Desmos_Supply_V1_QueryTotalRequest, Desmos_Supply_V1_QueryTotalResponse>]

  /// - Returns: Interceptors to use when invoking 'circulating'.
  func makeCirculatingInterceptors() -> [ClientInterceptor<Desmos_Supply_V1_QueryCirculatingRequest, Desmos_Supply_V1_QueryCirculatingResponse>]
}

internal enum Desmos_Supply_V1_QueryClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "desmos.supply.v1.Query",
    methods: [
      Desmos_Supply_V1_QueryClientMetadata.Methods.total,
      Desmos_Supply_V1_QueryClientMetadata.Methods.circulating,
    ]
  )

  internal enum Methods {
    internal static let total = GRPCMethodDescriptor(
      name: "Total",
      path: "/desmos.supply.v1.Query/Total",
      type: GRPCCallType.unary
    )

    internal static let circulating = GRPCMethodDescriptor(
      name: "Circulating",
      path: "/desmos.supply.v1.Query/Circulating",
      type: GRPCCallType.unary
    )
  }
}

/// Query defines the gRPC querier service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Desmos_Supply_V1_QueryProvider: CallHandlerProvider {
  var interceptors: Desmos_Supply_V1_QueryServerInterceptorFactoryProtocol? { get }

  /// Total queries the total supply of the given denom
  func total(request: Desmos_Supply_V1_QueryTotalRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Desmos_Supply_V1_QueryTotalResponse>

  /// Circulating queries the amount of tokens circulating in the market of the
  /// given denom
  func circulating(request: Desmos_Supply_V1_QueryCirculatingRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Desmos_Supply_V1_QueryCirculatingResponse>
}

extension Desmos_Supply_V1_QueryProvider {
  internal var serviceName: Substring {
    return Desmos_Supply_V1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Total":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Desmos_Supply_V1_QueryTotalRequest>(),
        responseSerializer: ProtobufSerializer<Desmos_Supply_V1_QueryTotalResponse>(),
        interceptors: self.interceptors?.makeTotalInterceptors() ?? [],
        userFunction: self.total(request:context:)
      )

    case "Circulating":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Desmos_Supply_V1_QueryCirculatingRequest>(),
        responseSerializer: ProtobufSerializer<Desmos_Supply_V1_QueryCirculatingResponse>(),
        interceptors: self.interceptors?.makeCirculatingInterceptors() ?? [],
        userFunction: self.circulating(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Query defines the gRPC querier service.
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Desmos_Supply_V1_QueryAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Desmos_Supply_V1_QueryServerInterceptorFactoryProtocol? { get }

  /// Total queries the total supply of the given denom
  @Sendable func total(
    request: Desmos_Supply_V1_QueryTotalRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Desmos_Supply_V1_QueryTotalResponse

  /// Circulating queries the amount of tokens circulating in the market of the
  /// given denom
  @Sendable func circulating(
    request: Desmos_Supply_V1_QueryCirculatingRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Desmos_Supply_V1_QueryCirculatingResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Desmos_Supply_V1_QueryAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Desmos_Supply_V1_QueryServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Desmos_Supply_V1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Desmos_Supply_V1_QueryServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Total":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Desmos_Supply_V1_QueryTotalRequest>(),
        responseSerializer: ProtobufSerializer<Desmos_Supply_V1_QueryTotalResponse>(),
        interceptors: self.interceptors?.makeTotalInterceptors() ?? [],
        wrapping: self.total(request:context:)
      )

    case "Circulating":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Desmos_Supply_V1_QueryCirculatingRequest>(),
        responseSerializer: ProtobufSerializer<Desmos_Supply_V1_QueryCirculatingResponse>(),
        interceptors: self.interceptors?.makeCirculatingInterceptors() ?? [],
        wrapping: self.circulating(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Desmos_Supply_V1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'total'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeTotalInterceptors() -> [ServerInterceptor<Desmos_Supply_V1_QueryTotalRequest, Desmos_Supply_V1_QueryTotalResponse>]

  /// - Returns: Interceptors to use when handling 'circulating'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCirculatingInterceptors() -> [ServerInterceptor<Desmos_Supply_V1_QueryCirculatingRequest, Desmos_Supply_V1_QueryCirculatingResponse>]
}

internal enum Desmos_Supply_V1_QueryServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "desmos.supply.v1.Query",
    methods: [
      Desmos_Supply_V1_QueryServerMetadata.Methods.total,
      Desmos_Supply_V1_QueryServerMetadata.Methods.circulating,
    ]
  )

  internal enum Methods {
    internal static let total = GRPCMethodDescriptor(
      name: "Total",
      path: "/desmos.supply.v1.Query/Total",
      type: GRPCCallType.unary
    )

    internal static let circulating = GRPCMethodDescriptor(
      name: "Circulating",
      path: "/desmos.supply.v1.Query/Circulating",
      type: GRPCCallType.unary
    )
  }
}
