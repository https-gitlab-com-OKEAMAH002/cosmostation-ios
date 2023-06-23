//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: band/globalfee/v1beta1/query.proto
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
/// Usage: instantiate `Globalfee_V1beta1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Globalfee_V1beta1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func minimumGasPrices(
    _ request: Globalfee_V1beta1_QueryMinimumGasPricesRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Globalfee_V1beta1_QueryMinimumGasPricesRequest, Globalfee_V1beta1_QueryMinimumGasPricesResponse>
}

extension Globalfee_V1beta1_QueryClientProtocol {
  internal var serviceName: String {
    return "globalfee.v1beta1.Query"
  }

  /// Unary call to MinimumGasPrices
  ///
  /// - Parameters:
  ///   - request: Request to send to MinimumGasPrices.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func minimumGasPrices(
    _ request: Globalfee_V1beta1_QueryMinimumGasPricesRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Globalfee_V1beta1_QueryMinimumGasPricesRequest, Globalfee_V1beta1_QueryMinimumGasPricesResponse> {
    return self.makeUnaryCall(
      path: Globalfee_V1beta1_QueryClientMetadata.Methods.minimumGasPrices.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeMinimumGasPricesInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Globalfee_V1beta1_QueryClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Globalfee_V1beta1_QueryNIOClient")
internal final class Globalfee_V1beta1_QueryClient: Globalfee_V1beta1_QueryClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the globalfee.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Globalfee_V1beta1_QueryNIOClient: Globalfee_V1beta1_QueryClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the globalfee.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query defines the gRPC querier service.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Globalfee_V1beta1_QueryAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func makeMinimumGasPricesCall(
    _ request: Globalfee_V1beta1_QueryMinimumGasPricesRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Globalfee_V1beta1_QueryMinimumGasPricesRequest, Globalfee_V1beta1_QueryMinimumGasPricesResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Globalfee_V1beta1_QueryAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Globalfee_V1beta1_QueryClientMetadata.serviceDescriptor
  }

  internal var interceptors: Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeMinimumGasPricesCall(
    _ request: Globalfee_V1beta1_QueryMinimumGasPricesRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Globalfee_V1beta1_QueryMinimumGasPricesRequest, Globalfee_V1beta1_QueryMinimumGasPricesResponse> {
    return self.makeAsyncUnaryCall(
      path: Globalfee_V1beta1_QueryClientMetadata.Methods.minimumGasPrices.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeMinimumGasPricesInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Globalfee_V1beta1_QueryAsyncClientProtocol {
  internal func minimumGasPrices(
    _ request: Globalfee_V1beta1_QueryMinimumGasPricesRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Globalfee_V1beta1_QueryMinimumGasPricesResponse {
    return try await self.performAsyncUnaryCall(
      path: Globalfee_V1beta1_QueryClientMetadata.Methods.minimumGasPrices.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeMinimumGasPricesInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Globalfee_V1beta1_QueryAsyncClient: Globalfee_V1beta1_QueryAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Globalfee_V1beta1_QueryClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'minimumGasPrices'.
  func makeMinimumGasPricesInterceptors() -> [ClientInterceptor<Globalfee_V1beta1_QueryMinimumGasPricesRequest, Globalfee_V1beta1_QueryMinimumGasPricesResponse>]
}

internal enum Globalfee_V1beta1_QueryClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "globalfee.v1beta1.Query",
    methods: [
      Globalfee_V1beta1_QueryClientMetadata.Methods.minimumGasPrices,
    ]
  )

  internal enum Methods {
    internal static let minimumGasPrices = GRPCMethodDescriptor(
      name: "MinimumGasPrices",
      path: "/globalfee.v1beta1.Query/MinimumGasPrices",
      type: GRPCCallType.unary
    )
  }
}

/// Query defines the gRPC querier service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Globalfee_V1beta1_QueryProvider: CallHandlerProvider {
  var interceptors: Globalfee_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  func minimumGasPrices(request: Globalfee_V1beta1_QueryMinimumGasPricesRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Globalfee_V1beta1_QueryMinimumGasPricesResponse>
}

extension Globalfee_V1beta1_QueryProvider {
  internal var serviceName: Substring {
    return Globalfee_V1beta1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "MinimumGasPrices":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Globalfee_V1beta1_QueryMinimumGasPricesRequest>(),
        responseSerializer: ProtobufSerializer<Globalfee_V1beta1_QueryMinimumGasPricesResponse>(),
        interceptors: self.interceptors?.makeMinimumGasPricesInterceptors() ?? [],
        userFunction: self.minimumGasPrices(request:context:)
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
internal protocol Globalfee_V1beta1_QueryAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Globalfee_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  @Sendable func minimumGasPrices(
    request: Globalfee_V1beta1_QueryMinimumGasPricesRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Globalfee_V1beta1_QueryMinimumGasPricesResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Globalfee_V1beta1_QueryAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Globalfee_V1beta1_QueryServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Globalfee_V1beta1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Globalfee_V1beta1_QueryServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "MinimumGasPrices":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Globalfee_V1beta1_QueryMinimumGasPricesRequest>(),
        responseSerializer: ProtobufSerializer<Globalfee_V1beta1_QueryMinimumGasPricesResponse>(),
        interceptors: self.interceptors?.makeMinimumGasPricesInterceptors() ?? [],
        wrapping: self.minimumGasPrices(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Globalfee_V1beta1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'minimumGasPrices'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeMinimumGasPricesInterceptors() -> [ServerInterceptor<Globalfee_V1beta1_QueryMinimumGasPricesRequest, Globalfee_V1beta1_QueryMinimumGasPricesResponse>]
}

internal enum Globalfee_V1beta1_QueryServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "globalfee.v1beta1.Query",
    methods: [
      Globalfee_V1beta1_QueryServerMetadata.Methods.minimumGasPrices,
    ]
  )

  internal enum Methods {
    internal static let minimumGasPrices = GRPCMethodDescriptor(
      name: "MinimumGasPrices",
      path: "/globalfee.v1beta1.Query/MinimumGasPrices",
      type: GRPCCallType.unary
    )
  }
}
