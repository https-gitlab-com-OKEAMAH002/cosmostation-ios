//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: persistence/epochs/v1beta1/query.proto
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
/// Usage: instantiate `Persistence_Epochs_V1beta1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Persistence_Epochs_V1beta1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Persistence_Epochs_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func epochInfos(
    _ request: Persistence_Epochs_V1beta1_QueryEpochsInfoRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Persistence_Epochs_V1beta1_QueryEpochsInfoRequest, Persistence_Epochs_V1beta1_QueryEpochsInfoResponse>

  func currentEpoch(
    _ request: Persistence_Epochs_V1beta1_QueryCurrentEpochRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Persistence_Epochs_V1beta1_QueryCurrentEpochRequest, Persistence_Epochs_V1beta1_QueryCurrentEpochResponse>
}

extension Persistence_Epochs_V1beta1_QueryClientProtocol {
  internal var serviceName: String {
    return "persistence.epochs.v1beta1.Query"
  }

  /// EpochInfos provide running epochInfos
  ///
  /// - Parameters:
  ///   - request: Request to send to EpochInfos.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func epochInfos(
    _ request: Persistence_Epochs_V1beta1_QueryEpochsInfoRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Persistence_Epochs_V1beta1_QueryEpochsInfoRequest, Persistence_Epochs_V1beta1_QueryEpochsInfoResponse> {
    return self.makeUnaryCall(
      path: Persistence_Epochs_V1beta1_QueryClientMetadata.Methods.epochInfos.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeEpochInfosInterceptors() ?? []
    )
  }

  /// CurrentEpoch provide current epoch of specified identifier
  ///
  /// - Parameters:
  ///   - request: Request to send to CurrentEpoch.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func currentEpoch(
    _ request: Persistence_Epochs_V1beta1_QueryCurrentEpochRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Persistence_Epochs_V1beta1_QueryCurrentEpochRequest, Persistence_Epochs_V1beta1_QueryCurrentEpochResponse> {
    return self.makeUnaryCall(
      path: Persistence_Epochs_V1beta1_QueryClientMetadata.Methods.currentEpoch.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCurrentEpochInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Persistence_Epochs_V1beta1_QueryClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Persistence_Epochs_V1beta1_QueryNIOClient")
internal final class Persistence_Epochs_V1beta1_QueryClient: Persistence_Epochs_V1beta1_QueryClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Persistence_Epochs_V1beta1_QueryClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Persistence_Epochs_V1beta1_QueryClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the persistence.epochs.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Persistence_Epochs_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Persistence_Epochs_V1beta1_QueryNIOClient: Persistence_Epochs_V1beta1_QueryClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Persistence_Epochs_V1beta1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the persistence.epochs.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Persistence_Epochs_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query defines the gRPC querier service.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Persistence_Epochs_V1beta1_QueryAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Persistence_Epochs_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func makeEpochInfosCall(
    _ request: Persistence_Epochs_V1beta1_QueryEpochsInfoRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Persistence_Epochs_V1beta1_QueryEpochsInfoRequest, Persistence_Epochs_V1beta1_QueryEpochsInfoResponse>

  func makeCurrentEpochCall(
    _ request: Persistence_Epochs_V1beta1_QueryCurrentEpochRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Persistence_Epochs_V1beta1_QueryCurrentEpochRequest, Persistence_Epochs_V1beta1_QueryCurrentEpochResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Persistence_Epochs_V1beta1_QueryAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Persistence_Epochs_V1beta1_QueryClientMetadata.serviceDescriptor
  }

  internal var interceptors: Persistence_Epochs_V1beta1_QueryClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeEpochInfosCall(
    _ request: Persistence_Epochs_V1beta1_QueryEpochsInfoRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Persistence_Epochs_V1beta1_QueryEpochsInfoRequest, Persistence_Epochs_V1beta1_QueryEpochsInfoResponse> {
    return self.makeAsyncUnaryCall(
      path: Persistence_Epochs_V1beta1_QueryClientMetadata.Methods.epochInfos.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeEpochInfosInterceptors() ?? []
    )
  }

  internal func makeCurrentEpochCall(
    _ request: Persistence_Epochs_V1beta1_QueryCurrentEpochRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Persistence_Epochs_V1beta1_QueryCurrentEpochRequest, Persistence_Epochs_V1beta1_QueryCurrentEpochResponse> {
    return self.makeAsyncUnaryCall(
      path: Persistence_Epochs_V1beta1_QueryClientMetadata.Methods.currentEpoch.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCurrentEpochInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Persistence_Epochs_V1beta1_QueryAsyncClientProtocol {
  internal func epochInfos(
    _ request: Persistence_Epochs_V1beta1_QueryEpochsInfoRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Persistence_Epochs_V1beta1_QueryEpochsInfoResponse {
    return try await self.performAsyncUnaryCall(
      path: Persistence_Epochs_V1beta1_QueryClientMetadata.Methods.epochInfos.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeEpochInfosInterceptors() ?? []
    )
  }

  internal func currentEpoch(
    _ request: Persistence_Epochs_V1beta1_QueryCurrentEpochRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Persistence_Epochs_V1beta1_QueryCurrentEpochResponse {
    return try await self.performAsyncUnaryCall(
      path: Persistence_Epochs_V1beta1_QueryClientMetadata.Methods.currentEpoch.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCurrentEpochInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Persistence_Epochs_V1beta1_QueryAsyncClient: Persistence_Epochs_V1beta1_QueryAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Persistence_Epochs_V1beta1_QueryClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Persistence_Epochs_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Persistence_Epochs_V1beta1_QueryClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'epochInfos'.
  func makeEpochInfosInterceptors() -> [ClientInterceptor<Persistence_Epochs_V1beta1_QueryEpochsInfoRequest, Persistence_Epochs_V1beta1_QueryEpochsInfoResponse>]

  /// - Returns: Interceptors to use when invoking 'currentEpoch'.
  func makeCurrentEpochInterceptors() -> [ClientInterceptor<Persistence_Epochs_V1beta1_QueryCurrentEpochRequest, Persistence_Epochs_V1beta1_QueryCurrentEpochResponse>]
}

internal enum Persistence_Epochs_V1beta1_QueryClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "persistence.epochs.v1beta1.Query",
    methods: [
      Persistence_Epochs_V1beta1_QueryClientMetadata.Methods.epochInfos,
      Persistence_Epochs_V1beta1_QueryClientMetadata.Methods.currentEpoch,
    ]
  )

  internal enum Methods {
    internal static let epochInfos = GRPCMethodDescriptor(
      name: "EpochInfos",
      path: "/persistence.epochs.v1beta1.Query/EpochInfos",
      type: GRPCCallType.unary
    )

    internal static let currentEpoch = GRPCMethodDescriptor(
      name: "CurrentEpoch",
      path: "/persistence.epochs.v1beta1.Query/CurrentEpoch",
      type: GRPCCallType.unary
    )
  }
}

/// Query defines the gRPC querier service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Persistence_Epochs_V1beta1_QueryProvider: CallHandlerProvider {
  var interceptors: Persistence_Epochs_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  /// EpochInfos provide running epochInfos
  func epochInfos(request: Persistence_Epochs_V1beta1_QueryEpochsInfoRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Persistence_Epochs_V1beta1_QueryEpochsInfoResponse>

  /// CurrentEpoch provide current epoch of specified identifier
  func currentEpoch(request: Persistence_Epochs_V1beta1_QueryCurrentEpochRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Persistence_Epochs_V1beta1_QueryCurrentEpochResponse>
}

extension Persistence_Epochs_V1beta1_QueryProvider {
  internal var serviceName: Substring {
    return Persistence_Epochs_V1beta1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "EpochInfos":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Persistence_Epochs_V1beta1_QueryEpochsInfoRequest>(),
        responseSerializer: ProtobufSerializer<Persistence_Epochs_V1beta1_QueryEpochsInfoResponse>(),
        interceptors: self.interceptors?.makeEpochInfosInterceptors() ?? [],
        userFunction: self.epochInfos(request:context:)
      )

    case "CurrentEpoch":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Persistence_Epochs_V1beta1_QueryCurrentEpochRequest>(),
        responseSerializer: ProtobufSerializer<Persistence_Epochs_V1beta1_QueryCurrentEpochResponse>(),
        interceptors: self.interceptors?.makeCurrentEpochInterceptors() ?? [],
        userFunction: self.currentEpoch(request:context:)
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
internal protocol Persistence_Epochs_V1beta1_QueryAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Persistence_Epochs_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  /// EpochInfos provide running epochInfos
  @Sendable func epochInfos(
    request: Persistence_Epochs_V1beta1_QueryEpochsInfoRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Persistence_Epochs_V1beta1_QueryEpochsInfoResponse

  /// CurrentEpoch provide current epoch of specified identifier
  @Sendable func currentEpoch(
    request: Persistence_Epochs_V1beta1_QueryCurrentEpochRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Persistence_Epochs_V1beta1_QueryCurrentEpochResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Persistence_Epochs_V1beta1_QueryAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Persistence_Epochs_V1beta1_QueryServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Persistence_Epochs_V1beta1_QueryServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Persistence_Epochs_V1beta1_QueryServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "EpochInfos":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Persistence_Epochs_V1beta1_QueryEpochsInfoRequest>(),
        responseSerializer: ProtobufSerializer<Persistence_Epochs_V1beta1_QueryEpochsInfoResponse>(),
        interceptors: self.interceptors?.makeEpochInfosInterceptors() ?? [],
        wrapping: self.epochInfos(request:context:)
      )

    case "CurrentEpoch":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Persistence_Epochs_V1beta1_QueryCurrentEpochRequest>(),
        responseSerializer: ProtobufSerializer<Persistence_Epochs_V1beta1_QueryCurrentEpochResponse>(),
        interceptors: self.interceptors?.makeCurrentEpochInterceptors() ?? [],
        wrapping: self.currentEpoch(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Persistence_Epochs_V1beta1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'epochInfos'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeEpochInfosInterceptors() -> [ServerInterceptor<Persistence_Epochs_V1beta1_QueryEpochsInfoRequest, Persistence_Epochs_V1beta1_QueryEpochsInfoResponse>]

  /// - Returns: Interceptors to use when handling 'currentEpoch'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCurrentEpochInterceptors() -> [ServerInterceptor<Persistence_Epochs_V1beta1_QueryCurrentEpochRequest, Persistence_Epochs_V1beta1_QueryCurrentEpochResponse>]
}

internal enum Persistence_Epochs_V1beta1_QueryServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Query",
    fullName: "persistence.epochs.v1beta1.Query",
    methods: [
      Persistence_Epochs_V1beta1_QueryServerMetadata.Methods.epochInfos,
      Persistence_Epochs_V1beta1_QueryServerMetadata.Methods.currentEpoch,
    ]
  )

  internal enum Methods {
    internal static let epochInfos = GRPCMethodDescriptor(
      name: "EpochInfos",
      path: "/persistence.epochs.v1beta1.Query/EpochInfos",
      type: GRPCCallType.unary
    )

    internal static let currentEpoch = GRPCMethodDescriptor(
      name: "CurrentEpoch",
      path: "/persistence.epochs.v1beta1.Query/CurrentEpoch",
      type: GRPCCallType.unary
    )
  }
}
