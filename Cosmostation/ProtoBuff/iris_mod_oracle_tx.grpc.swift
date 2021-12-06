//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: iris_mod/oracle/tx.proto
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


/// Msg defines the oracle Msg service
///
/// Usage: instantiate `Irismod_Oracle_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Irismod_Oracle_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Irismod_Oracle_MsgClientInterceptorFactoryProtocol? { get }

  func createFeed(
    _ request: Irismod_Oracle_MsgCreateFeed,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Oracle_MsgCreateFeed, Irismod_Oracle_MsgCreateFeedResponse>

  func editFeed(
    _ request: Irismod_Oracle_MsgEditFeed,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Oracle_MsgEditFeed, Irismod_Oracle_MsgEditFeedResponse>

  func startFeed(
    _ request: Irismod_Oracle_MsgStartFeed,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Oracle_MsgStartFeed, Irismod_Oracle_MsgStartFeedResponse>

  func pauseFeed(
    _ request: Irismod_Oracle_MsgPauseFeed,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Oracle_MsgPauseFeed, Irismod_Oracle_MsgPauseFeedResponse>
}

extension Irismod_Oracle_MsgClientProtocol {
  internal var serviceName: String {
    return "irismod.oracle.Msg"
  }

  /// CreateFeed defines a method for creating a new feed
  ///
  /// - Parameters:
  ///   - request: Request to send to CreateFeed.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func createFeed(
    _ request: Irismod_Oracle_MsgCreateFeed,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Oracle_MsgCreateFeed, Irismod_Oracle_MsgCreateFeedResponse> {
    return self.makeUnaryCall(
      path: "/irismod.oracle.Msg/CreateFeed",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateFeedInterceptors() ?? []
    )
  }

  /// EditFeed defines a method for editing a feed
  ///
  /// - Parameters:
  ///   - request: Request to send to EditFeed.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func editFeed(
    _ request: Irismod_Oracle_MsgEditFeed,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Oracle_MsgEditFeed, Irismod_Oracle_MsgEditFeedResponse> {
    return self.makeUnaryCall(
      path: "/irismod.oracle.Msg/EditFeed",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeEditFeedInterceptors() ?? []
    )
  }

  /// StartFeed defines a method for starting a feed
  ///
  /// - Parameters:
  ///   - request: Request to send to StartFeed.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func startFeed(
    _ request: Irismod_Oracle_MsgStartFeed,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Oracle_MsgStartFeed, Irismod_Oracle_MsgStartFeedResponse> {
    return self.makeUnaryCall(
      path: "/irismod.oracle.Msg/StartFeed",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeStartFeedInterceptors() ?? []
    )
  }

  /// PauseFeed defines a method for pausing a feed
  ///
  /// - Parameters:
  ///   - request: Request to send to PauseFeed.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func pauseFeed(
    _ request: Irismod_Oracle_MsgPauseFeed,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Oracle_MsgPauseFeed, Irismod_Oracle_MsgPauseFeedResponse> {
    return self.makeUnaryCall(
      path: "/irismod.oracle.Msg/PauseFeed",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePauseFeedInterceptors() ?? []
    )
  }
}

internal protocol Irismod_Oracle_MsgClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'createFeed'.
  func makeCreateFeedInterceptors() -> [ClientInterceptor<Irismod_Oracle_MsgCreateFeed, Irismod_Oracle_MsgCreateFeedResponse>]

  /// - Returns: Interceptors to use when invoking 'editFeed'.
  func makeEditFeedInterceptors() -> [ClientInterceptor<Irismod_Oracle_MsgEditFeed, Irismod_Oracle_MsgEditFeedResponse>]

  /// - Returns: Interceptors to use when invoking 'startFeed'.
  func makeStartFeedInterceptors() -> [ClientInterceptor<Irismod_Oracle_MsgStartFeed, Irismod_Oracle_MsgStartFeedResponse>]

  /// - Returns: Interceptors to use when invoking 'pauseFeed'.
  func makePauseFeedInterceptors() -> [ClientInterceptor<Irismod_Oracle_MsgPauseFeed, Irismod_Oracle_MsgPauseFeedResponse>]
}

internal final class Irismod_Oracle_MsgClient: Irismod_Oracle_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Irismod_Oracle_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the irismod.oracle.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Irismod_Oracle_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Msg defines the oracle Msg service
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Irismod_Oracle_MsgProvider: CallHandlerProvider {
  var interceptors: Irismod_Oracle_MsgServerInterceptorFactoryProtocol? { get }

  /// CreateFeed defines a method for creating a new feed
  func createFeed(request: Irismod_Oracle_MsgCreateFeed, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Oracle_MsgCreateFeedResponse>

  /// EditFeed defines a method for editing a feed
  func editFeed(request: Irismod_Oracle_MsgEditFeed, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Oracle_MsgEditFeedResponse>

  /// StartFeed defines a method for starting a feed
  func startFeed(request: Irismod_Oracle_MsgStartFeed, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Oracle_MsgStartFeedResponse>

  /// PauseFeed defines a method for pausing a feed
  func pauseFeed(request: Irismod_Oracle_MsgPauseFeed, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Oracle_MsgPauseFeedResponse>
}

extension Irismod_Oracle_MsgProvider {
  internal var serviceName: Substring { return "irismod.oracle.Msg" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "CreateFeed":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Irismod_Oracle_MsgCreateFeed>(),
        responseSerializer: ProtobufSerializer<Irismod_Oracle_MsgCreateFeedResponse>(),
        interceptors: self.interceptors?.makeCreateFeedInterceptors() ?? [],
        userFunction: self.createFeed(request:context:)
      )

    case "EditFeed":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Irismod_Oracle_MsgEditFeed>(),
        responseSerializer: ProtobufSerializer<Irismod_Oracle_MsgEditFeedResponse>(),
        interceptors: self.interceptors?.makeEditFeedInterceptors() ?? [],
        userFunction: self.editFeed(request:context:)
      )

    case "StartFeed":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Irismod_Oracle_MsgStartFeed>(),
        responseSerializer: ProtobufSerializer<Irismod_Oracle_MsgStartFeedResponse>(),
        interceptors: self.interceptors?.makeStartFeedInterceptors() ?? [],
        userFunction: self.startFeed(request:context:)
      )

    case "PauseFeed":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Irismod_Oracle_MsgPauseFeed>(),
        responseSerializer: ProtobufSerializer<Irismod_Oracle_MsgPauseFeedResponse>(),
        interceptors: self.interceptors?.makePauseFeedInterceptors() ?? [],
        userFunction: self.pauseFeed(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Irismod_Oracle_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'createFeed'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCreateFeedInterceptors() -> [ServerInterceptor<Irismod_Oracle_MsgCreateFeed, Irismod_Oracle_MsgCreateFeedResponse>]

  /// - Returns: Interceptors to use when handling 'editFeed'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeEditFeedInterceptors() -> [ServerInterceptor<Irismod_Oracle_MsgEditFeed, Irismod_Oracle_MsgEditFeedResponse>]

  /// - Returns: Interceptors to use when handling 'startFeed'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeStartFeedInterceptors() -> [ServerInterceptor<Irismod_Oracle_MsgStartFeed, Irismod_Oracle_MsgStartFeedResponse>]

  /// - Returns: Interceptors to use when handling 'pauseFeed'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makePauseFeedInterceptors() -> [ServerInterceptor<Irismod_Oracle_MsgPauseFeed, Irismod_Oracle_MsgPauseFeedResponse>]
}