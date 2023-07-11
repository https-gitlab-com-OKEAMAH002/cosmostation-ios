//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: iov/escrow/v1beta1/tx.proto
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


/// Msg defines the escrow Msg service
///
/// Usage: instantiate `Starnamed_X_Escrow_V1beta1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Starnamed_X_Escrow_V1beta1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Starnamed_X_Escrow_V1beta1_MsgClientInterceptorFactoryProtocol? { get }

  func createEscrow(
    _ request: Starnamed_X_Escrow_V1beta1_MsgCreateEscrow,
    callOptions: CallOptions?
  ) -> UnaryCall<Starnamed_X_Escrow_V1beta1_MsgCreateEscrow, Starnamed_X_Escrow_V1beta1_MsgCreateEscrowResponse>

  func updateEscrow(
    _ request: Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow,
    callOptions: CallOptions?
  ) -> UnaryCall<Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow, Starnamed_X_Escrow_V1beta1_MsgUpdateEscrowResponse>

  func transferToEscrow(
    _ request: Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow,
    callOptions: CallOptions?
  ) -> UnaryCall<Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow, Starnamed_X_Escrow_V1beta1_MsgTransferToEscrowResponse>

  func refundEscrow(
    _ request: Starnamed_X_Escrow_V1beta1_MsgRefundEscrow,
    callOptions: CallOptions?
  ) -> UnaryCall<Starnamed_X_Escrow_V1beta1_MsgRefundEscrow, Starnamed_X_Escrow_V1beta1_MsgRefundEscrowResponse>
}

extension Starnamed_X_Escrow_V1beta1_MsgClientProtocol {
  internal var serviceName: String {
    return "starnamed.x.escrow.v1beta1.Msg"
  }

  /// CreateEscrow defines a method for creating an escrow
  ///
  /// - Parameters:
  ///   - request: Request to send to CreateEscrow.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func createEscrow(
    _ request: Starnamed_X_Escrow_V1beta1_MsgCreateEscrow,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Starnamed_X_Escrow_V1beta1_MsgCreateEscrow, Starnamed_X_Escrow_V1beta1_MsgCreateEscrowResponse> {
    return self.makeUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_MsgClientMetadata.Methods.createEscrow.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateEscrowInterceptors() ?? []
    )
  }

  /// UpdateEscrow defines a method for updating an escrow
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateEscrow.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateEscrow(
    _ request: Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow, Starnamed_X_Escrow_V1beta1_MsgUpdateEscrowResponse> {
    return self.makeUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_MsgClientMetadata.Methods.updateEscrow.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateEscrowInterceptors() ?? []
    )
  }

  /// TransferToEscrow defines a method for a buyer to transfer funds to the
  /// escrow
  ///
  /// - Parameters:
  ///   - request: Request to send to TransferToEscrow.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func transferToEscrow(
    _ request: Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow, Starnamed_X_Escrow_V1beta1_MsgTransferToEscrowResponse> {
    return self.makeUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_MsgClientMetadata.Methods.transferToEscrow.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeTransferToEscrowInterceptors() ?? []
    )
  }

  /// RefundEscrow defines a method for the seller to return the assets locked in
  /// the escrow
  ///
  /// - Parameters:
  ///   - request: Request to send to RefundEscrow.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func refundEscrow(
    _ request: Starnamed_X_Escrow_V1beta1_MsgRefundEscrow,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Starnamed_X_Escrow_V1beta1_MsgRefundEscrow, Starnamed_X_Escrow_V1beta1_MsgRefundEscrowResponse> {
    return self.makeUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_MsgClientMetadata.Methods.refundEscrow.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRefundEscrowInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Starnamed_X_Escrow_V1beta1_MsgClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Starnamed_X_Escrow_V1beta1_MsgNIOClient")
internal final class Starnamed_X_Escrow_V1beta1_MsgClient: Starnamed_X_Escrow_V1beta1_MsgClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Starnamed_X_Escrow_V1beta1_MsgClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Starnamed_X_Escrow_V1beta1_MsgClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the starnamed.x.escrow.v1beta1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Starnamed_X_Escrow_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Starnamed_X_Escrow_V1beta1_MsgNIOClient: Starnamed_X_Escrow_V1beta1_MsgClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Starnamed_X_Escrow_V1beta1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the starnamed.x.escrow.v1beta1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Starnamed_X_Escrow_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Msg defines the escrow Msg service
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Starnamed_X_Escrow_V1beta1_MsgAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Starnamed_X_Escrow_V1beta1_MsgClientInterceptorFactoryProtocol? { get }

  func makeCreateEscrowCall(
    _ request: Starnamed_X_Escrow_V1beta1_MsgCreateEscrow,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Starnamed_X_Escrow_V1beta1_MsgCreateEscrow, Starnamed_X_Escrow_V1beta1_MsgCreateEscrowResponse>

  func makeUpdateEscrowCall(
    _ request: Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow, Starnamed_X_Escrow_V1beta1_MsgUpdateEscrowResponse>

  func makeTransferToEscrowCall(
    _ request: Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow, Starnamed_X_Escrow_V1beta1_MsgTransferToEscrowResponse>

  func makeRefundEscrowCall(
    _ request: Starnamed_X_Escrow_V1beta1_MsgRefundEscrow,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Starnamed_X_Escrow_V1beta1_MsgRefundEscrow, Starnamed_X_Escrow_V1beta1_MsgRefundEscrowResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Starnamed_X_Escrow_V1beta1_MsgAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Starnamed_X_Escrow_V1beta1_MsgClientMetadata.serviceDescriptor
  }

  internal var interceptors: Starnamed_X_Escrow_V1beta1_MsgClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeCreateEscrowCall(
    _ request: Starnamed_X_Escrow_V1beta1_MsgCreateEscrow,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Starnamed_X_Escrow_V1beta1_MsgCreateEscrow, Starnamed_X_Escrow_V1beta1_MsgCreateEscrowResponse> {
    return self.makeAsyncUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_MsgClientMetadata.Methods.createEscrow.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateEscrowInterceptors() ?? []
    )
  }

  internal func makeUpdateEscrowCall(
    _ request: Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow, Starnamed_X_Escrow_V1beta1_MsgUpdateEscrowResponse> {
    return self.makeAsyncUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_MsgClientMetadata.Methods.updateEscrow.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateEscrowInterceptors() ?? []
    )
  }

  internal func makeTransferToEscrowCall(
    _ request: Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow, Starnamed_X_Escrow_V1beta1_MsgTransferToEscrowResponse> {
    return self.makeAsyncUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_MsgClientMetadata.Methods.transferToEscrow.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeTransferToEscrowInterceptors() ?? []
    )
  }

  internal func makeRefundEscrowCall(
    _ request: Starnamed_X_Escrow_V1beta1_MsgRefundEscrow,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Starnamed_X_Escrow_V1beta1_MsgRefundEscrow, Starnamed_X_Escrow_V1beta1_MsgRefundEscrowResponse> {
    return self.makeAsyncUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_MsgClientMetadata.Methods.refundEscrow.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRefundEscrowInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Starnamed_X_Escrow_V1beta1_MsgAsyncClientProtocol {
  internal func createEscrow(
    _ request: Starnamed_X_Escrow_V1beta1_MsgCreateEscrow,
    callOptions: CallOptions? = nil
  ) async throws -> Starnamed_X_Escrow_V1beta1_MsgCreateEscrowResponse {
    return try await self.performAsyncUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_MsgClientMetadata.Methods.createEscrow.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateEscrowInterceptors() ?? []
    )
  }

  internal func updateEscrow(
    _ request: Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow,
    callOptions: CallOptions? = nil
  ) async throws -> Starnamed_X_Escrow_V1beta1_MsgUpdateEscrowResponse {
    return try await self.performAsyncUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_MsgClientMetadata.Methods.updateEscrow.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateEscrowInterceptors() ?? []
    )
  }

  internal func transferToEscrow(
    _ request: Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow,
    callOptions: CallOptions? = nil
  ) async throws -> Starnamed_X_Escrow_V1beta1_MsgTransferToEscrowResponse {
    return try await self.performAsyncUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_MsgClientMetadata.Methods.transferToEscrow.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeTransferToEscrowInterceptors() ?? []
    )
  }

  internal func refundEscrow(
    _ request: Starnamed_X_Escrow_V1beta1_MsgRefundEscrow,
    callOptions: CallOptions? = nil
  ) async throws -> Starnamed_X_Escrow_V1beta1_MsgRefundEscrowResponse {
    return try await self.performAsyncUnaryCall(
      path: Starnamed_X_Escrow_V1beta1_MsgClientMetadata.Methods.refundEscrow.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRefundEscrowInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Starnamed_X_Escrow_V1beta1_MsgAsyncClient: Starnamed_X_Escrow_V1beta1_MsgAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Starnamed_X_Escrow_V1beta1_MsgClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Starnamed_X_Escrow_V1beta1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Starnamed_X_Escrow_V1beta1_MsgClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'createEscrow'.
  func makeCreateEscrowInterceptors() -> [ClientInterceptor<Starnamed_X_Escrow_V1beta1_MsgCreateEscrow, Starnamed_X_Escrow_V1beta1_MsgCreateEscrowResponse>]

  /// - Returns: Interceptors to use when invoking 'updateEscrow'.
  func makeUpdateEscrowInterceptors() -> [ClientInterceptor<Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow, Starnamed_X_Escrow_V1beta1_MsgUpdateEscrowResponse>]

  /// - Returns: Interceptors to use when invoking 'transferToEscrow'.
  func makeTransferToEscrowInterceptors() -> [ClientInterceptor<Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow, Starnamed_X_Escrow_V1beta1_MsgTransferToEscrowResponse>]

  /// - Returns: Interceptors to use when invoking 'refundEscrow'.
  func makeRefundEscrowInterceptors() -> [ClientInterceptor<Starnamed_X_Escrow_V1beta1_MsgRefundEscrow, Starnamed_X_Escrow_V1beta1_MsgRefundEscrowResponse>]
}

internal enum Starnamed_X_Escrow_V1beta1_MsgClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Msg",
    fullName: "starnamed.x.escrow.v1beta1.Msg",
    methods: [
      Starnamed_X_Escrow_V1beta1_MsgClientMetadata.Methods.createEscrow,
      Starnamed_X_Escrow_V1beta1_MsgClientMetadata.Methods.updateEscrow,
      Starnamed_X_Escrow_V1beta1_MsgClientMetadata.Methods.transferToEscrow,
      Starnamed_X_Escrow_V1beta1_MsgClientMetadata.Methods.refundEscrow,
    ]
  )

  internal enum Methods {
    internal static let createEscrow = GRPCMethodDescriptor(
      name: "CreateEscrow",
      path: "/starnamed.x.escrow.v1beta1.Msg/CreateEscrow",
      type: GRPCCallType.unary
    )

    internal static let updateEscrow = GRPCMethodDescriptor(
      name: "UpdateEscrow",
      path: "/starnamed.x.escrow.v1beta1.Msg/UpdateEscrow",
      type: GRPCCallType.unary
    )

    internal static let transferToEscrow = GRPCMethodDescriptor(
      name: "TransferToEscrow",
      path: "/starnamed.x.escrow.v1beta1.Msg/TransferToEscrow",
      type: GRPCCallType.unary
    )

    internal static let refundEscrow = GRPCMethodDescriptor(
      name: "RefundEscrow",
      path: "/starnamed.x.escrow.v1beta1.Msg/RefundEscrow",
      type: GRPCCallType.unary
    )
  }
}

/// Msg defines the escrow Msg service
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Starnamed_X_Escrow_V1beta1_MsgProvider: CallHandlerProvider {
  var interceptors: Starnamed_X_Escrow_V1beta1_MsgServerInterceptorFactoryProtocol? { get }

  /// CreateEscrow defines a method for creating an escrow
  func createEscrow(request: Starnamed_X_Escrow_V1beta1_MsgCreateEscrow, context: StatusOnlyCallContext) -> EventLoopFuture<Starnamed_X_Escrow_V1beta1_MsgCreateEscrowResponse>

  /// UpdateEscrow defines a method for updating an escrow
  func updateEscrow(request: Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow, context: StatusOnlyCallContext) -> EventLoopFuture<Starnamed_X_Escrow_V1beta1_MsgUpdateEscrowResponse>

  /// TransferToEscrow defines a method for a buyer to transfer funds to the
  /// escrow
  func transferToEscrow(request: Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow, context: StatusOnlyCallContext) -> EventLoopFuture<Starnamed_X_Escrow_V1beta1_MsgTransferToEscrowResponse>

  /// RefundEscrow defines a method for the seller to return the assets locked in
  /// the escrow
  func refundEscrow(request: Starnamed_X_Escrow_V1beta1_MsgRefundEscrow, context: StatusOnlyCallContext) -> EventLoopFuture<Starnamed_X_Escrow_V1beta1_MsgRefundEscrowResponse>
}

extension Starnamed_X_Escrow_V1beta1_MsgProvider {
  internal var serviceName: Substring {
    return Starnamed_X_Escrow_V1beta1_MsgServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "CreateEscrow":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Escrow_V1beta1_MsgCreateEscrow>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Escrow_V1beta1_MsgCreateEscrowResponse>(),
        interceptors: self.interceptors?.makeCreateEscrowInterceptors() ?? [],
        userFunction: self.createEscrow(request:context:)
      )

    case "UpdateEscrow":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Escrow_V1beta1_MsgUpdateEscrowResponse>(),
        interceptors: self.interceptors?.makeUpdateEscrowInterceptors() ?? [],
        userFunction: self.updateEscrow(request:context:)
      )

    case "TransferToEscrow":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Escrow_V1beta1_MsgTransferToEscrowResponse>(),
        interceptors: self.interceptors?.makeTransferToEscrowInterceptors() ?? [],
        userFunction: self.transferToEscrow(request:context:)
      )

    case "RefundEscrow":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Escrow_V1beta1_MsgRefundEscrow>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Escrow_V1beta1_MsgRefundEscrowResponse>(),
        interceptors: self.interceptors?.makeRefundEscrowInterceptors() ?? [],
        userFunction: self.refundEscrow(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Msg defines the escrow Msg service
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Starnamed_X_Escrow_V1beta1_MsgAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Starnamed_X_Escrow_V1beta1_MsgServerInterceptorFactoryProtocol? { get }

  /// CreateEscrow defines a method for creating an escrow
  @Sendable func createEscrow(
    request: Starnamed_X_Escrow_V1beta1_MsgCreateEscrow,
    context: GRPCAsyncServerCallContext
  ) async throws -> Starnamed_X_Escrow_V1beta1_MsgCreateEscrowResponse

  /// UpdateEscrow defines a method for updating an escrow
  @Sendable func updateEscrow(
    request: Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow,
    context: GRPCAsyncServerCallContext
  ) async throws -> Starnamed_X_Escrow_V1beta1_MsgUpdateEscrowResponse

  /// TransferToEscrow defines a method for a buyer to transfer funds to the
  /// escrow
  @Sendable func transferToEscrow(
    request: Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow,
    context: GRPCAsyncServerCallContext
  ) async throws -> Starnamed_X_Escrow_V1beta1_MsgTransferToEscrowResponse

  /// RefundEscrow defines a method for the seller to return the assets locked in
  /// the escrow
  @Sendable func refundEscrow(
    request: Starnamed_X_Escrow_V1beta1_MsgRefundEscrow,
    context: GRPCAsyncServerCallContext
  ) async throws -> Starnamed_X_Escrow_V1beta1_MsgRefundEscrowResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Starnamed_X_Escrow_V1beta1_MsgAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Starnamed_X_Escrow_V1beta1_MsgServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Starnamed_X_Escrow_V1beta1_MsgServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Starnamed_X_Escrow_V1beta1_MsgServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "CreateEscrow":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Escrow_V1beta1_MsgCreateEscrow>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Escrow_V1beta1_MsgCreateEscrowResponse>(),
        interceptors: self.interceptors?.makeCreateEscrowInterceptors() ?? [],
        wrapping: self.createEscrow(request:context:)
      )

    case "UpdateEscrow":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Escrow_V1beta1_MsgUpdateEscrowResponse>(),
        interceptors: self.interceptors?.makeUpdateEscrowInterceptors() ?? [],
        wrapping: self.updateEscrow(request:context:)
      )

    case "TransferToEscrow":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Escrow_V1beta1_MsgTransferToEscrowResponse>(),
        interceptors: self.interceptors?.makeTransferToEscrowInterceptors() ?? [],
        wrapping: self.transferToEscrow(request:context:)
      )

    case "RefundEscrow":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Escrow_V1beta1_MsgRefundEscrow>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Escrow_V1beta1_MsgRefundEscrowResponse>(),
        interceptors: self.interceptors?.makeRefundEscrowInterceptors() ?? [],
        wrapping: self.refundEscrow(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Starnamed_X_Escrow_V1beta1_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'createEscrow'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCreateEscrowInterceptors() -> [ServerInterceptor<Starnamed_X_Escrow_V1beta1_MsgCreateEscrow, Starnamed_X_Escrow_V1beta1_MsgCreateEscrowResponse>]

  /// - Returns: Interceptors to use when handling 'updateEscrow'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeUpdateEscrowInterceptors() -> [ServerInterceptor<Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow, Starnamed_X_Escrow_V1beta1_MsgUpdateEscrowResponse>]

  /// - Returns: Interceptors to use when handling 'transferToEscrow'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeTransferToEscrowInterceptors() -> [ServerInterceptor<Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow, Starnamed_X_Escrow_V1beta1_MsgTransferToEscrowResponse>]

  /// - Returns: Interceptors to use when handling 'refundEscrow'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRefundEscrowInterceptors() -> [ServerInterceptor<Starnamed_X_Escrow_V1beta1_MsgRefundEscrow, Starnamed_X_Escrow_V1beta1_MsgRefundEscrowResponse>]
}

internal enum Starnamed_X_Escrow_V1beta1_MsgServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Msg",
    fullName: "starnamed.x.escrow.v1beta1.Msg",
    methods: [
      Starnamed_X_Escrow_V1beta1_MsgServerMetadata.Methods.createEscrow,
      Starnamed_X_Escrow_V1beta1_MsgServerMetadata.Methods.updateEscrow,
      Starnamed_X_Escrow_V1beta1_MsgServerMetadata.Methods.transferToEscrow,
      Starnamed_X_Escrow_V1beta1_MsgServerMetadata.Methods.refundEscrow,
    ]
  )

  internal enum Methods {
    internal static let createEscrow = GRPCMethodDescriptor(
      name: "CreateEscrow",
      path: "/starnamed.x.escrow.v1beta1.Msg/CreateEscrow",
      type: GRPCCallType.unary
    )

    internal static let updateEscrow = GRPCMethodDescriptor(
      name: "UpdateEscrow",
      path: "/starnamed.x.escrow.v1beta1.Msg/UpdateEscrow",
      type: GRPCCallType.unary
    )

    internal static let transferToEscrow = GRPCMethodDescriptor(
      name: "TransferToEscrow",
      path: "/starnamed.x.escrow.v1beta1.Msg/TransferToEscrow",
      type: GRPCCallType.unary
    )

    internal static let refundEscrow = GRPCMethodDescriptor(
      name: "RefundEscrow",
      path: "/starnamed.x.escrow.v1beta1.Msg/RefundEscrow",
      type: GRPCCallType.unary
    )
  }
}