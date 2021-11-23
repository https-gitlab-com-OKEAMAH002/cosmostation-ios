//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: sifnode/tokenregistry/v1/tx.proto
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


/// Usage: instantiate `Sifnode_Tokenregistry_V1_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Sifnode_Tokenregistry_V1_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Sifnode_Tokenregistry_V1_MsgClientInterceptorFactoryProtocol? { get }

  func register(
    _ request: Sifnode_Tokenregistry_V1_MsgRegister,
    callOptions: CallOptions?
  ) -> UnaryCall<Sifnode_Tokenregistry_V1_MsgRegister, Sifnode_Tokenregistry_V1_MsgRegisterResponse>

  func deregister(
    _ request: Sifnode_Tokenregistry_V1_MsgDeregister,
    callOptions: CallOptions?
  ) -> UnaryCall<Sifnode_Tokenregistry_V1_MsgDeregister, Sifnode_Tokenregistry_V1_MsgDeregisterResponse>
}

extension Sifnode_Tokenregistry_V1_MsgClientProtocol {
  internal var serviceName: String {
    return "sifnode.tokenregistry.v1.Msg"
  }

  /// Unary call to Register
  ///
  /// - Parameters:
  ///   - request: Request to send to Register.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func register(
    _ request: Sifnode_Tokenregistry_V1_MsgRegister,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sifnode_Tokenregistry_V1_MsgRegister, Sifnode_Tokenregistry_V1_MsgRegisterResponse> {
    return self.makeUnaryCall(
      path: "/sifnode.tokenregistry.v1.Msg/Register",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRegisterInterceptors() ?? []
    )
  }

  /// Unary call to Deregister
  ///
  /// - Parameters:
  ///   - request: Request to send to Deregister.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func deregister(
    _ request: Sifnode_Tokenregistry_V1_MsgDeregister,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sifnode_Tokenregistry_V1_MsgDeregister, Sifnode_Tokenregistry_V1_MsgDeregisterResponse> {
    return self.makeUnaryCall(
      path: "/sifnode.tokenregistry.v1.Msg/Deregister",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDeregisterInterceptors() ?? []
    )
  }
}

internal protocol Sifnode_Tokenregistry_V1_MsgClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'register'.
  func makeRegisterInterceptors() -> [ClientInterceptor<Sifnode_Tokenregistry_V1_MsgRegister, Sifnode_Tokenregistry_V1_MsgRegisterResponse>]

  /// - Returns: Interceptors to use when invoking 'deregister'.
  func makeDeregisterInterceptors() -> [ClientInterceptor<Sifnode_Tokenregistry_V1_MsgDeregister, Sifnode_Tokenregistry_V1_MsgDeregisterResponse>]
}

internal final class Sifnode_Tokenregistry_V1_MsgClient: Sifnode_Tokenregistry_V1_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Sifnode_Tokenregistry_V1_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the sifnode.tokenregistry.v1.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Sifnode_Tokenregistry_V1_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Sifnode_Tokenregistry_V1_MsgProvider: CallHandlerProvider {
  var interceptors: Sifnode_Tokenregistry_V1_MsgServerInterceptorFactoryProtocol? { get }

  func register(request: Sifnode_Tokenregistry_V1_MsgRegister, context: StatusOnlyCallContext) -> EventLoopFuture<Sifnode_Tokenregistry_V1_MsgRegisterResponse>

  func deregister(request: Sifnode_Tokenregistry_V1_MsgDeregister, context: StatusOnlyCallContext) -> EventLoopFuture<Sifnode_Tokenregistry_V1_MsgDeregisterResponse>
}

extension Sifnode_Tokenregistry_V1_MsgProvider {
  internal var serviceName: Substring { return "sifnode.tokenregistry.v1.Msg" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Register":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sifnode_Tokenregistry_V1_MsgRegister>(),
        responseSerializer: ProtobufSerializer<Sifnode_Tokenregistry_V1_MsgRegisterResponse>(),
        interceptors: self.interceptors?.makeRegisterInterceptors() ?? [],
        userFunction: self.register(request:context:)
      )

    case "Deregister":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sifnode_Tokenregistry_V1_MsgDeregister>(),
        responseSerializer: ProtobufSerializer<Sifnode_Tokenregistry_V1_MsgDeregisterResponse>(),
        interceptors: self.interceptors?.makeDeregisterInterceptors() ?? [],
        userFunction: self.deregister(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Sifnode_Tokenregistry_V1_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'register'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRegisterInterceptors() -> [ServerInterceptor<Sifnode_Tokenregistry_V1_MsgRegister, Sifnode_Tokenregistry_V1_MsgRegisterResponse>]

  /// - Returns: Interceptors to use when handling 'deregister'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeDeregisterInterceptors() -> [ServerInterceptor<Sifnode_Tokenregistry_V1_MsgDeregister, Sifnode_Tokenregistry_V1_MsgDeregisterResponse>]
}