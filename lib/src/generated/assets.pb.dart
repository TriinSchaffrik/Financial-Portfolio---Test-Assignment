// This is a generated file - do not edit.
//
// Generated from assets.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Asset extends $pb.GeneratedMessage {
  factory Asset({
    $core.String? id,
    $core.String? logoUrl,
    $core.String? name,
    $core.double? currentPrice,
    $core.double? percentChange,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (logoUrl != null) result.logoUrl = logoUrl;
    if (name != null) result.name = name;
    if (currentPrice != null) result.currentPrice = currentPrice;
    if (percentChange != null) result.percentChange = percentChange;
    return result;
  }

  Asset._();

  factory Asset.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Asset.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Asset',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'financial.portfolio.assets'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'logoUrl', protoName: 'logoUrl')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aD(4, _omitFieldNames ? '' : 'currentPrice')
    ..aD(5, _omitFieldNames ? '' : 'percentChange')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Asset clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Asset copyWith(void Function(Asset) updates) =>
      super.copyWith((message) => updates(message as Asset)) as Asset;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Asset create() => Asset._();
  @$core.override
  Asset createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Asset getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Asset>(create);
  static Asset? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get logoUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set logoUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLogoUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get currentPrice => $_getN(3);
  @$pb.TagNumber(4)
  set currentPrice($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCurrentPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentPrice() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get percentChange => $_getN(4);
  @$pb.TagNumber(5)
  set percentChange($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPercentChange() => $_has(4);
  @$pb.TagNumber(5)
  void clearPercentChange() => $_clearField(5);
}

class PortfolioSnapshot extends $pb.GeneratedMessage {
  factory PortfolioSnapshot({
    $fixnum.Int64? timestampMs,
    $core.double? totalValue,
  }) {
    final result = create();
    if (timestampMs != null) result.timestampMs = timestampMs;
    if (totalValue != null) result.totalValue = totalValue;
    return result;
  }

  PortfolioSnapshot._();

  factory PortfolioSnapshot.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PortfolioSnapshot.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PortfolioSnapshot',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'financial.portfolio.assets'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timestampMs')
    ..aD(2, _omitFieldNames ? '' : 'totalValue')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PortfolioSnapshot clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PortfolioSnapshot copyWith(void Function(PortfolioSnapshot) updates) =>
      super.copyWith((message) => updates(message as PortfolioSnapshot))
          as PortfolioSnapshot;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PortfolioSnapshot create() => PortfolioSnapshot._();
  @$core.override
  PortfolioSnapshot createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PortfolioSnapshot getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PortfolioSnapshot>(create);
  static PortfolioSnapshot? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestampMs => $_getI64(0);
  @$pb.TagNumber(1)
  set timestampMs($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestampMs() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestampMs() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get totalValue => $_getN(1);
  @$pb.TagNumber(2)
  set totalValue($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalValue() => $_clearField(2);
}

class GetPortfolioListRequest extends $pb.GeneratedMessage {
  factory GetPortfolioListRequest() => create();

  GetPortfolioListRequest._();

  factory GetPortfolioListRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPortfolioListRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPortfolioListRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'financial.portfolio.assets'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPortfolioListRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPortfolioListRequest copyWith(
          void Function(GetPortfolioListRequest) updates) =>
      super.copyWith((message) => updates(message as GetPortfolioListRequest))
          as GetPortfolioListRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPortfolioListRequest create() => GetPortfolioListRequest._();
  @$core.override
  GetPortfolioListRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPortfolioListRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPortfolioListRequest>(create);
  static GetPortfolioListRequest? _defaultInstance;
}

class GetPortfolioListResponse extends $pb.GeneratedMessage {
  factory GetPortfolioListResponse({
    $core.Iterable<Asset>? assets,
    $core.Iterable<PortfolioSnapshot>? history,
  }) {
    final result = create();
    if (assets != null) result.assets.addAll(assets);
    if (history != null) result.history.addAll(history);
    return result;
  }

  GetPortfolioListResponse._();

  factory GetPortfolioListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPortfolioListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPortfolioListResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'financial.portfolio.assets'),
      createEmptyInstance: create)
    ..pPM<Asset>(1, _omitFieldNames ? '' : 'assets', subBuilder: Asset.create)
    ..pPM<PortfolioSnapshot>(2, _omitFieldNames ? '' : 'history',
        subBuilder: PortfolioSnapshot.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPortfolioListResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPortfolioListResponse copyWith(
          void Function(GetPortfolioListResponse) updates) =>
      super.copyWith((message) => updates(message as GetPortfolioListResponse))
          as GetPortfolioListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPortfolioListResponse create() => GetPortfolioListResponse._();
  @$core.override
  GetPortfolioListResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetPortfolioListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPortfolioListResponse>(create);
  static GetPortfolioListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Asset> get assets => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<PortfolioSnapshot> get history => $_getList(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
