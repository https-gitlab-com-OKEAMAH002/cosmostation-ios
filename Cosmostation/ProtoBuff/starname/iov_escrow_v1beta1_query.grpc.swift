//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: iov/escrow/v1beta1/query.proto
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


/// Query provides defines the gRPC querier service
///
/// Usage: instantiate `Starnamed_X_Escrow_V1beta1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Starnamed_X_Escrow_V1beta1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Starnamed_X_Escrow_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func escrow(
    _ request: Starnamed_X_Escrow_V1beta1_QueryEscrowRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Starnamed_X_Escrow_V1beta1_QueryEscrowRequest, Starnamed_X_Escrow_V1beta1_QueryEscrowResponse>

  func escrows(
    _ request: Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest, Starnamed_X_Escrow_V1beta1_QueryEscrowsResponse>
}

extension Starnamed_X_Escrow_V1beta1_QueryClientProtocol {
  internal var serviceName: String {
    return "starnamed.x.escrow.v1beta1.Query"
  }

  /// Escrow queries the escrow by the specified id
  ///
  /// - Parameters:
  ///   - request: Request to send to Escrow.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func escrow(
    _ request: Starnamed_X_Escrow_V1beta1_QueryEscrowRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Starnamed_X_Escrow_V1beta1_QueryEscrowRequest, Starnamed_X_Escrow_V1beta1_QueryEscrowResponse> {
    return self.makeUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_QueryClientMetadata.Methods.escrow.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeEscrowInterceptors() ?? []
    )
  }

  /// Escrows queries escrows by the specified key-value pairs
  ///
  /// - Parameters:
  ///   - request: Request to send to Escrows.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func escrows(
    _ request: Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest, Starnamed_X_Escrow_V1beta1_QueryEscrowsResponse> {
    return self.makeUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_QueryClientMetadata.Methods.escrows.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeEscrowsInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Starnamed_X_Escrow_V1beta1_QueryClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Starnamed_X_Escrow_V1beta1_QueryNIOClient")
internal final class Starnamed_X_Escrow_V1beta1_QueryClient: Starnamed_X_Escrow_V1beta1_QueryClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Starnamed_X_Escrow_V1beta1_QueryClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Starnamed_X_Escrow_V1beta1_QueryClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the starnamed.x.escrow.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Starnamed_X_Escrow_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Starnamed_X_Escrow_V1beta1_QueryNIOClient: Starnamed_X_Escrow_V1beta1_QueryClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Starnamed_X_Escrow_V1beta1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the starnamed.x.escrow.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Starnamed_X_Escrow_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query provides defines the gRPC querier service
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Starnamed_X_Escrow_V1beta1_QueryAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Starnamed_X_Escrow_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func makeEscrowCall(
    _ request: Starnamed_X_Escrow_V1beta1_QueryEscrowRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Starnamed_X_Escrow_V1beta1_QueryEscrowRequest, Starnamed_X_Escrow_V1beta1_QueryEscrowResponse>

  func makeEscrowsCall(
    _ request: Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest, Starnamed_X_Escrow_V1beta1_QueryEscrowsResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Starnamed_X_Escrow_V1beta1_QueryAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Starnamed_X_Escrow_V1beta1_QueryClientMetadata.serviceDescriptor
  }

  internal var interceptors: Starnamed_X_Escrow_V1beta1_QueryClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeEscrowCall(
    _ request: Starnamed_X_Escrow_V1beta1_QueryEscrowRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Starnamed_X_Escrow_V1beta1_QueryEscrowRequest, Starnamed_X_Escrow_V1beta1_QueryEscrowResponse> {
    return self.makeAsyncUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_QueryClientMetadata.Methods.escrow.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeEscrowInterceptors() ?? []
    )
  }

  internal func makeEscrowsCall(
    _ request: Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest, Starnamed_X_Escrow_V1beta1_QueryEscrowsResponse> {
    return self.makeAsyncUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_QueryClientMetadata.Methods.escrows.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeEscrowsInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Starnamed_X_Escrow_V1beta1_QueryAsyncClientProtocol {
  internal func escrow(
    _ request: Starnamed_X_Escrow_V1beta1_QueryEscrowRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Starnamed_X_Escrow_V1beta1_QueryEscrowResponse {
    return try await self.performAsyncUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_QueryClientMetadata.Methods.escrow.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeEscrowInterceptors() ?? []
    )
  }

  internal func escrows(
    _ request: Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Starnamed_X_Escrow_V1beta1_QueryEscrowsResponse {
    return try await self.performAsyncUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_QueryClientMetadata.Methods.escrows.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeEscrowsInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Starnamed_X_Escrow_V1beta1_QueryAsyncClient: Starnamed_X_Escrow_V1beta1_QueryAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Starnamed_X_Escrow_V1beta1_QueryClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Starnamed_X_Escrow_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Starnamed_X_Escrow_V1beta1_QueryClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'escrow'.
  func makeEscrowInterceptors() -> [ClientInterceptor<Starnamed_X_Escrow_V1beta1_QueryEscrowRequest, Starnamed_X_Escrow_V1beta1_QueryEscrowResponse>]

  /// - Returns: Interceptors to use when invoking 'escrows'.
  func makeEscrowsInterceptors() -> [ClientInterceptor<Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest, Starnamed_X_Escrow_V1beta1_QueryEscrowsResponse>]
}

internal enum Starnamed_X_Escrow_V1beta1_QueryClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "starnamed.x.escrow.v1beta1.Query",
    methods: [
      Starnamed_X_Escrow_V1beta1_QueryClientMetadata.Methods.escrow,
      Starnamed_X_Escrow_V1beta1_QueryClientMetadata.Methods.escrows,
    ]
  )

  internal enum Methods {
    internal static let escrow = GRPCMethodDescriptor(
      name: "Escrow",
      path: "/starnamed.x.escrow.v1beta1.Query/Escrow",
      type: GRPCCallType.unary
    )

    internal static let escrows = GRPCMethodDescriptor(
      name: "Escrows",
      path: "/starnamed.x.escrow.v1beta1.Query/Escrows",
      type: GRPCCallType.unary
    )
  }
}

/// Query provides defines the gRPC querier service
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Starnamed_X_Escrow_V1beta1_QueryProvider: CallHandlerProvider {
  var interceptors: Starnamed_X_Escrow_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  /// Escrow queries the escrow by the specified id
  func escrow(request: Starnamed_X_Escrow_V1beta1_QueryEscrowRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Starnamed_X_Escrow_V1beta1_QueryEscrowResponse>

  /// Escrows queries escrows by the specified key-value pairs
  func escrows(request: Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Starnamed_X_Escrow_V1beta1_QueryEscrowsResponse>
}

extension Starnamed_X_Escrow_V1beta1_QueryProvider {
  internal var serviceName: Substring {
    return Starnamed_X_Escrow_V1beta1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Escrow":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Escrow_V1beta1_QueryEscrowRequest>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Escrow_V1beta1_QueryEscrowResponse>(),
        interceptors: self.interceptors?.makeEscrowInterceptors() ?? [],
        userFunction: self.escrow(request:context:)
      )

    case "Escrows":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Escrow_V1beta1_QueryEscrowsResponse>(),
        interceptors: self.interceptors?.makeEscrowsInterceptors() ?? [],
        userFunction: self.escrows(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Query provides defines the gRPC querier service
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Starnamed_X_Escrow_V1beta1_QueryAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Starnamed_X_Escrow_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  /// Escrow queries the escrow by the specified id
  @Sendable func escrow(
    request: Starnamed_X_Escrow_V1beta1_QueryEscrowRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Starnamed_X_Escrow_V1beta1_QueryEscrowResponse

  /// Escrows queries escrows by the specified key-value pairs
  @Sendable func escrows(
    request: Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Starnamed_X_Escrow_V1beta1_QueryEscrowsResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Starnamed_X_Escrow_V1beta1_QueryAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Starnamed_X_Escrow_V1beta1_QueryServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Starnamed_X_Escrow_V1beta1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Starnamed_X_Escrow_V1beta1_QueryServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Escrow":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Escrow_V1beta1_QueryEscrowRequest>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Escrow_V1beta1_QueryEscrowResponse>(),
        interceptors: self.interceptors?.makeEscrowInterceptors() ?? [],
        wrapping: self.escrow(request:context:)
      )

    case "Escrows":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Escrow_V1beta1_QueryEscrowsResponse>(),
        interceptors: self.interceptors?.makeEscrowsInterceptors() ?? [],
        wrapping: self.escrows(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Starnamed_X_Escrow_V1beta1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'escrow'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeEscrowInterceptors() -> [ServerInterceptor<Starnamed_X_Escrow_V1beta1_QueryEscrowRequest, Starnamed_X_Escrow_V1beta1_QueryEscrowResponse>]

  /// - Returns: Interceptors to use when handling 'escrows'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeEscrowsInterceptors() -> [ServerInterceptor<Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest, Starnamed_X_Escrow_V1beta1_QueryEscrowsResponse>]
}

internal enum Starnamed_X_Escrow_V1beta1_QueryServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "starnamed.x.escrow.v1beta1.Query",
    methods: [
      Starnamed_X_Escrow_V1beta1_QueryServerMetadata.Methods.escrow,
      Starnamed_X_Escrow_V1beta1_QueryServerMetadata.Methods.escrows,
    ]
  )

  internal enum Methods {
    internal static let escrow = GRPCMethodDescriptor(
      name: "Escrow",
      path: "/starnamed.x.escrow.v1beta1.Query/Escrow",
      type: GRPCCallType.unary
    )

    internal static let escrows = GRPCMethodDescriptor(
      name: "Escrows",
      path: "/starnamed.x.escrow.v1beta1.Query/Escrows",
      type: GRPCCallType.unary
    )
  }
}