// This is a generated file - do not edit.
//
// Generated from assets.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'assets.pb.dart' as $0;

export 'assets.pb.dart';

@$pb.GrpcServiceName('financial.portfolio.assets.AssetService')
class AssetServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AssetServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GetPortfolioListResponse> getPortfolioList(
    $0.GetPortfolioListRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getPortfolioList, request, options: options);
  }

  // method descriptors

  static final _$getPortfolioList = $grpc.ClientMethod<
          $0.GetPortfolioListRequest, $0.GetPortfolioListResponse>(
      '/financial.portfolio.assets.AssetService/GetPortfolioList',
      ($0.GetPortfolioListRequest value) => value.writeToBuffer(),
      $0.GetPortfolioListResponse.fromBuffer);
}

@$pb.GrpcServiceName('financial.portfolio.assets.AssetService')
abstract class AssetServiceBase extends $grpc.Service {
  $core.String get $name => 'financial.portfolio.assets.AssetService';

  AssetServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetPortfolioListRequest,
            $0.GetPortfolioListResponse>(
        'GetPortfolioList',
        getPortfolioList_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetPortfolioListRequest.fromBuffer(value),
        ($0.GetPortfolioListResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetPortfolioListResponse> getPortfolioList_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetPortfolioListRequest> $request) async {
    return getPortfolioList($call, await $request);
  }

  $async.Future<$0.GetPortfolioListResponse> getPortfolioList(
      $grpc.ServiceCall call, $0.GetPortfolioListRequest request);
}
