//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: iov/configuration/v1beta1/query.proto
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


/// Query provides defines the gRPC querier service.
///
/// Usage: instantiate `Starnamed_X_Configuration_V1beta1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Starnamed_X_Configuration_V1beta1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Starnamed_X_Configuration_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func config(
    _ request: Starnamed_X_Configuration_V1beta1_QueryConfigRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Starnamed_X_Configuration_V1beta1_QueryConfigRequest, Starnamed_X_Configuration_V1beta1_QueryConfigResponse>

  func fees(
    _ request: Starnamed_X_Configuration_V1beta1_QueryFeesRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Starnamed_X_Configuration_V1beta1_QueryFeesRequest, Starnamed_X_Configuration_V1beta1_QueryFeesResponse>
}

extension Starnamed_X_Configuration_V1beta1_QueryClientProtocol {
  internal var serviceName: String {
    return "starnamed.x.configuration.v1beta1.Query"
  }

  /// Config gets starname configuration.
  ///
  /// - Parameters:
  ///   - request: Request to send to Config.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func config(
    _ request: Starnamed_X_Configuration_V1beta1_QueryConfigRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Starnamed_X_Configuration_V1beta1_QueryConfigRequest, Starnamed_X_Configuration_V1beta1_QueryConfigResponse> {
    return self.makeUnaryCall(
      path: Starnamed_X_Configuration_V1beta1_QueryClientMetadata.Methods.config.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConfigInterceptors() ?? []
    )
  }

  /// Fees gets starname product fees.
  ///
  /// - Parameters:
  ///   - request: Request to send to Fees.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func fees(
    _ request: Starnamed_X_Configuration_V1beta1_QueryFeesRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Starnamed_X_Configuration_V1beta1_QueryFeesRequest, Starnamed_X_Configuration_V1beta1_QueryFeesResponse> {
    return self.makeUnaryCall(
      path: Starnamed_X_Configuration_V1beta1_QueryClientMetadata.Methods.fees.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFeesInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Starnamed_X_Configuration_V1beta1_QueryClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Starnamed_X_Configuration_V1beta1_QueryNIOClient")
internal final class Starnamed_X_Configuration_V1beta1_QueryClient: Starnamed_X_Configuration_V1beta1_QueryClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Starnamed_X_Configuration_V1beta1_QueryClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Starnamed_X_Configuration_V1beta1_QueryClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the starnamed.x.configuration.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Starnamed_X_Configuration_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Starnamed_X_Configuration_V1beta1_QueryNIOClient: Starnamed_X_Configuration_V1beta1_QueryClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Starnamed_X_Configuration_V1beta1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the starnamed.x.configuration.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Starnamed_X_Configuration_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query provides defines the gRPC querier service.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Starnamed_X_Configuration_V1beta1_QueryAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Starnamed_X_Configuration_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func makeConfigCall(
    _ request: Starnamed_X_Configuration_V1beta1_QueryConfigRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Starnamed_X_Configuration_V1beta1_QueryConfigRequest, Starnamed_X_Configuration_V1beta1_QueryConfigResponse>

  func makeFeesCall(
    _ request: Starnamed_X_Configuration_V1beta1_QueryFeesRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Starnamed_X_Configuration_V1beta1_QueryFeesRequest, Starnamed_X_Configuration_V1beta1_QueryFeesResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Starnamed_X_Configuration_V1beta1_QueryAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Starnamed_X_Configuration_V1beta1_QueryClientMetadata.serviceDescriptor
  }

  internal var interceptors: Starnamed_X_Configuration_V1beta1_QueryClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeConfigCall(
    _ request: Starnamed_X_Configuration_V1beta1_QueryConfigRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Starnamed_X_Configuration_V1beta1_QueryConfigRequest, Starnamed_X_Configuration_V1beta1_QueryConfigResponse> {
    return self.makeAsyncUnaryCall(
      path: Starnamed_X_Configuration_V1beta1_QueryClientMetadata.Methods.config.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConfigInterceptors() ?? []
    )
  }

  internal func makeFeesCall(
    _ request: Starnamed_X_Configuration_V1beta1_QueryFeesRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Starnamed_X_Configuration_V1beta1_QueryFeesRequest, Starnamed_X_Configuration_V1beta1_QueryFeesResponse> {
    return self.makeAsyncUnaryCall(
      path: Starnamed_X_Configuration_V1beta1_QueryClientMetadata.Methods.fees.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFeesInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Starnamed_X_Configuration_V1beta1_QueryAsyncClientProtocol {
  internal func config(
    _ request: Starnamed_X_Configuration_V1beta1_QueryConfigRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Starnamed_X_Configuration_V1beta1_QueryConfigResponse {
    return try await self.performAsyncUnaryCall(
      path: Starnamed_X_Configuration_V1beta1_QueryClientMetadata.Methods.config.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConfigInterceptors() ?? []
    )
  }

  internal func fees(
    _ request: Starnamed_X_Configuration_V1beta1_QueryFeesRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Starnamed_X_Configuration_V1beta1_QueryFeesResponse {
    return try await self.performAsyncUnaryCall(
      path: Starnamed_X_Configuration_V1beta1_QueryClientMetadata.Methods.fees.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFeesInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Starnamed_X_Configuration_V1beta1_QueryAsyncClient: Starnamed_X_Configuration_V1beta1_QueryAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Starnamed_X_Configuration_V1beta1_QueryClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Starnamed_X_Configuration_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Starnamed_X_Configuration_V1beta1_QueryClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'config'.
  func makeConfigInterceptors() -> [ClientInterceptor<Starnamed_X_Configuration_V1beta1_QueryConfigRequest, Starnamed_X_Configuration_V1beta1_QueryConfigResponse>]

  /// - Returns: Interceptors to use when invoking 'fees'.
  func makeFeesInterceptors() -> [ClientInterceptor<Starnamed_X_Configuration_V1beta1_QueryFeesRequest, Starnamed_X_Configuration_V1beta1_QueryFeesResponse>]
}

internal enum Starnamed_X_Configuration_V1beta1_QueryClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "starnamed.x.configuration.v1beta1.Query",
    methods: [
      Starnamed_X_Configuration_V1beta1_QueryClientMetadata.Methods.config,
      Starnamed_X_Configuration_V1beta1_QueryClientMetadata.Methods.fees,
    ]
  )

  internal enum Methods {
    internal static let config = GRPCMethodDescriptor(
      name: "Config",
      path: "/starnamed.x.configuration.v1beta1.Query/Config",
      type: GRPCCallType.unary
    )

    internal static let fees = GRPCMethodDescriptor(
      name: "Fees",
      path: "/starnamed.x.configuration.v1beta1.Query/Fees",
      type: GRPCCallType.unary
    )
  }
}

/// Query provides defines the gRPC querier service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Starnamed_X_Configuration_V1beta1_QueryProvider: CallHandlerProvider {
  var interceptors: Starnamed_X_Configuration_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  /// Config gets starname configuration.
  func config(request: Starnamed_X_Configuration_V1beta1_QueryConfigRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Starnamed_X_Configuration_V1beta1_QueryConfigResponse>

  /// Fees gets starname product fees.
  func fees(request: Starnamed_X_Configuration_V1beta1_QueryFeesRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Starnamed_X_Configuration_V1beta1_QueryFeesResponse>
}

extension Starnamed_X_Configuration_V1beta1_QueryProvider {
  internal var serviceName: Substring {
    return Starnamed_X_Configuration_V1beta1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Config":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Configuration_V1beta1_QueryConfigRequest>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Configuration_V1beta1_QueryConfigResponse>(),
        interceptors: self.interceptors?.makeConfigInterceptors() ?? [],
        userFunction: self.config(request:context:)
      )

    case "Fees":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Configuration_V1beta1_QueryFeesRequest>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Configuration_V1beta1_QueryFeesResponse>(),
        interceptors: self.interceptors?.makeFeesInterceptors() ?? [],
        userFunction: self.fees(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Query provides defines the gRPC querier service.
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Starnamed_X_Configuration_V1beta1_QueryAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Starnamed_X_Configuration_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  /// Config gets starname configuration.
  @Sendable func config(
    request: Starnamed_X_Configuration_V1beta1_QueryConfigRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Starnamed_X_Configuration_V1beta1_QueryConfigResponse

  /// Fees gets starname product fees.
  @Sendable func fees(
    request: Starnamed_X_Configuration_V1beta1_QueryFeesRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Starnamed_X_Configuration_V1beta1_QueryFeesResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Starnamed_X_Configuration_V1beta1_QueryAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Starnamed_X_Configuration_V1beta1_QueryServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Starnamed_X_Configuration_V1beta1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Starnamed_X_Configuration_V1beta1_QueryServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Config":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Configuration_V1beta1_QueryConfigRequest>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Configuration_V1beta1_QueryConfigResponse>(),
        interceptors: self.interceptors?.makeConfigInterceptors() ?? [],
        wrapping: self.config(request:context:)
      )

    case "Fees":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Configuration_V1beta1_QueryFeesRequest>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Configuration_V1beta1_QueryFeesResponse>(),
        interceptors: self.interceptors?.makeFeesInterceptors() ?? [],
        wrapping: self.fees(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Starnamed_X_Configuration_V1beta1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'config'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeConfigInterceptors() -> [ServerInterceptor<Starnamed_X_Configuration_V1beta1_QueryConfigRequest, Starnamed_X_Configuration_V1beta1_QueryConfigResponse>]

  /// - Returns: Interceptors to use when handling 'fees'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeFeesInterceptors() -> [ServerInterceptor<Starnamed_X_Configuration_V1beta1_QueryFeesRequest, Starnamed_X_Configuration_V1beta1_QueryFeesResponse>]
}

internal enum Starnamed_X_Configuration_V1beta1_QueryServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "starnamed.x.configuration.v1beta1.Query",
    methods: [
      Starnamed_X_Configuration_V1beta1_QueryServerMetadata.Methods.config,
      Starnamed_X_Configuration_V1beta1_QueryServerMetadata.Methods.fees,
    ]
  )

  internal enum Methods {
    internal static let config = GRPCMethodDescriptor(
      name: "Config",
      path: "/starnamed.x.configuration.v1beta1.Query/Config",
      type: GRPCCallType.unary
    )

    internal static let fees = GRPCMethodDescriptor(
      name: "Fees",
      path: "/starnamed.x.configuration.v1beta1.Query/Fees",
      type: GRPCCallType.unary
    )
  }
}