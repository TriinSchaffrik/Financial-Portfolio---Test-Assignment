// This is a generated file - do not edit.
//
// Generated from assets.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use assetDescriptor instead')
const Asset$json = {
  '1': 'Asset',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'logoUrl', '3': 2, '4': 1, '5': 9, '10': 'logoUrl'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'current_price', '3': 4, '4': 1, '5': 1, '10': 'currentPrice'},
    {'1': 'percent_change', '3': 5, '4': 1, '5': 1, '10': 'percentChange'},
  ],
};

/// Descriptor for `Asset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetDescriptor = $convert.base64Decode(
    'CgVBc3NldBIOCgJpZBgBIAEoCVICaWQSGAoHbG9nb1VybBgCIAEoCVIHbG9nb1VybBISCgRuYW'
    '1lGAMgASgJUgRuYW1lEiMKDWN1cnJlbnRfcHJpY2UYBCABKAFSDGN1cnJlbnRQcmljZRIlCg5w'
    'ZXJjZW50X2NoYW5nZRgFIAEoAVINcGVyY2VudENoYW5nZQ==');

@$core.Deprecated('Use portfolioSnapshotDescriptor instead')
const PortfolioSnapshot$json = {
  '1': 'PortfolioSnapshot',
  '2': [
    {'1': 'timestamp_ms', '3': 1, '4': 1, '5': 3, '10': 'timestampMs'},
    {'1': 'total_value', '3': 2, '4': 1, '5': 1, '10': 'totalValue'},
  ],
};

/// Descriptor for `PortfolioSnapshot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List portfolioSnapshotDescriptor = $convert.base64Decode(
    'ChFQb3J0Zm9saW9TbmFwc2hvdBIhCgx0aW1lc3RhbXBfbXMYASABKANSC3RpbWVzdGFtcE1zEh'
    '8KC3RvdGFsX3ZhbHVlGAIgASgBUgp0b3RhbFZhbHVl');

@$core.Deprecated('Use getPortfolioListRequestDescriptor instead')
const GetPortfolioListRequest$json = {
  '1': 'GetPortfolioListRequest',
};

/// Descriptor for `GetPortfolioListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPortfolioListRequestDescriptor =
    $convert.base64Decode('ChdHZXRQb3J0Zm9saW9MaXN0UmVxdWVzdA==');

@$core.Deprecated('Use getPortfolioListResponseDescriptor instead')
const GetPortfolioListResponse$json = {
  '1': 'GetPortfolioListResponse',
  '2': [
    {
      '1': 'assets',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.financial.portfolio.assets.Asset',
      '10': 'assets'
    },
    {
      '1': 'history',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.financial.portfolio.assets.PortfolioSnapshot',
      '10': 'history'
    },
  ],
};

/// Descriptor for `GetPortfolioListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPortfolioListResponseDescriptor = $convert.base64Decode(
    'ChhHZXRQb3J0Zm9saW9MaXN0UmVzcG9uc2USOQoGYXNzZXRzGAEgAygLMiEuZmluYW5jaWFsLn'
    'BvcnRmb2xpby5hc3NldHMuQXNzZXRSBmFzc2V0cxJHCgdoaXN0b3J5GAIgAygLMi0uZmluYW5j'
    'aWFsLnBvcnRmb2xpby5hc3NldHMuUG9ydGZvbGlvU25hcHNob3RSB2hpc3Rvcnk=');
