//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: kava/issuance/v1beta1/query.proto
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


/// Query defines the gRPC querier service for issuance module
///
/// Usage: instantiate `Kava_Issuance_V1beta1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Kava_Issuance_V1beta1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Kava_Issuance_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func params(
    _ request: Kava_Issuance_V1beta1_QueryParamsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Kava_Issuance_V1beta1_QueryParamsRequest, Kava_Issuance_V1beta1_QueryParamsResponse>
}

extension Kava_Issuance_V1beta1_QueryClientProtocol {
  internal var serviceName: String {
    return "kava.issuance.v1beta1.Query"
  }

  /// Params queries all parameters of the issuance module.
  ///
  /// - Parameters:
  ///   - request: Request to send to Params.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func params(
    _ request: Kava_Issuance_V1beta1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Kava_Issuance_V1beta1_QueryParamsRequest, Kava_Issuance_V1beta1_QueryParamsResponse> {
    return self.makeUnaryCall(
      path: Kava_Issuance_V1beta1_QueryClientMetadata.Methods.params.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeParamsInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Kava_Issuance_V1beta1_QueryClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Kava_Issuance_V1beta1_QueryNIOClient")
internal final class Kava_Issuance_V1beta1_QueryClient: Kava_Issuance_V1beta1_QueryClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Kava_Issuance_V1beta1_QueryClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Kava_Issuance_V1beta1_QueryClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the kava.issuance.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Kava_Issuance_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Kava_Issuance_V1beta1_QueryNIOClient: Kava_Issuance_V1beta1_QueryClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Kava_Issuance_V1beta1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the kava.issuance.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Kava_Issuance_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query defines the gRPC querier service for issuance module
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Kava_Issuance_V1beta1_QueryAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Kava_Issuance_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func makeParamsCall(
    _ request: Kava_Issuance_V1beta1_QueryParamsRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Kava_Issuance_V1beta1_QueryParamsRequest, Kava_Issuance_V1beta1_QueryParamsResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Kava_Issuance_V1beta1_QueryAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Kava_Issuance_V1beta1_QueryClientMetadata.serviceDescriptor
  }

  internal var interceptors: Kava_Issuance_V1beta1_QueryClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeParamsCall(
    _ request: Kava_Issuance_V1beta1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Kava_Issuance_V1beta1_QueryParamsRequest, Kava_Issuance_V1beta1_QueryParamsResponse> {
    return self.makeAsyncUnaryCall(
      path: Kava_Issuance_V1beta1_QueryClientMetadata.Methods.params.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeParamsInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Kava_Issuance_V1beta1_QueryAsyncClientProtocol {
  internal func params(
    _ request: Kava_Issuance_V1beta1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Kava_Issuance_V1beta1_QueryParamsResponse {
    return try await self.performAsyncUnaryCall(
      path: Kava_Issuance_V1beta1_QueryClientMetadata.Methods.params.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeParamsInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Kava_Issuance_V1beta1_QueryAsyncClient: Kava_Issuance_V1beta1_QueryAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Kava_Issuance_V1beta1_QueryClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Kava_Issuance_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Kava_Issuance_V1beta1_QueryClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'params'.
  func makeParamsInterceptors() -> [ClientInterceptor<Kava_Issuance_V1beta1_QueryParamsRequest, Kava_Issuance_V1beta1_QueryParamsResponse>]
}

internal enum Kava_Issuance_V1beta1_QueryClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "kava.issuance.v1beta1.Query",
    methods: [
      Kava_Issuance_V1beta1_QueryClientMetadata.Methods.params,
    ]
  )

  internal enum Methods {
    internal static let params = GRPCMethodDescriptor(
      name: "Params",
      path: "/kava.issuance.v1beta1.Query/Params",
      type: GRPCCallType.unary
    )
  }
}

/// Query defines the gRPC querier service for issuance module
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Kava_Issuance_V1beta1_QueryProvider: CallHandlerProvider {
  var interceptors: Kava_Issuance_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  /// Params queries all parameters of the issuance module.
  func params(request: Kava_Issuance_V1beta1_QueryParamsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Kava_Issuance_V1beta1_QueryParamsResponse>
}

extension Kava_Issuance_V1beta1_QueryProvider {
  internal var serviceName: Substring {
    return Kava_Issuance_V1beta1_QueryServerMetadata.serviceDescriptor.fullName[...]
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
        requestDeserializer: ProtobufDeserializer<Kava_Issuance_V1beta1_QueryParamsRequest>(),
        responseSerializer: ProtobufSerializer<Kava_Issuance_V1beta1_QueryParamsResponse>(),
        interceptors: self.interceptors?.makeParamsInterceptors() ?? [],
        userFunction: self.params(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Query defines the gRPC querier service for issuance module
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Kava_Issuance_V1beta1_QueryAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Kava_Issuance_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  /// Params queries all parameters of the issuance module.
  @Sendable func params(
    request: Kava_Issuance_V1beta1_QueryParamsRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Kava_Issuance_V1beta1_QueryParamsResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Kava_Issuance_V1beta1_QueryAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Kava_Issuance_V1beta1_QueryServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Kava_Issuance_V1beta1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Kava_Issuance_V1beta1_QueryServerInterceptorFactoryProtocol? {
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
        requestDeserializer: ProtobufDeserializer<Kava_Issuance_V1beta1_QueryParamsRequest>(),
        responseSerializer: ProtobufSerializer<Kava_Issuance_V1beta1_QueryParamsResponse>(),
        interceptors: self.interceptors?.makeParamsInterceptors() ?? [],
        wrapping: self.params(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Kava_Issuance_V1beta1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'params'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeParamsInterceptors() -> [ServerInterceptor<Kava_Issuance_V1beta1_QueryParamsRequest, Kava_Issuance_V1beta1_QueryParamsResponse>]
}

internal enum Kava_Issuance_V1beta1_QueryServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "kava.issuance.v1beta1.Query",
    methods: [
      Kava_Issuance_V1beta1_QueryServerMetadata.Methods.params,
    ]
  )

  internal enum Methods {
    internal static let params = GRPCMethodDescriptor(
      name: "Params",
      path: "/kava.issuance.v1beta1.Query/Params",
      type: GRPCCallType.unary
    )
  }
}
