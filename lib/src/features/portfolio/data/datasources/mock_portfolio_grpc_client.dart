import 'dart:math';

import 'package:fixnum/fixnum.dart';

import '../../../../generated/assets.pb.dart';
import '../../../../generated/assets.pbgrpc.dart';

import 'portfolio_grpc_client.dart';

class MockPortfolioGrpcClient implements PortfolioGrpcClient {
  final _rnd = Random();

  @override
  Future<GetPortfolioListResponse> getPortfolio() async {
    await Future.delayed(const Duration(milliseconds: 400));

    final assets = <Asset>[
      Asset()
        ..id = '1'
        ..logoUrl = 'https://img.icons8.com/?size=32&id=95294&format=png'
        ..name = 'Apple Inc.'
        ..currentPrice = 190.20
        ..percentChange = 1.3,
      Asset()
        ..id = '2'
        ..logoUrl = 'https://img.icons8.com/?size=32&id=22989&format=png'
        ..name = 'Microsoft'
        ..currentPrice = 410.80
        ..percentChange = -0.4,
      Asset()
        ..id = '3'
        ..logoUrl = 'https://img.icons8.com/?size=32&id=yqf95864UzeQ&format=png'
        ..name = 'NVIDIA Corporation'
        ..currentPrice = 185.55
        ..percentChange = 1.72,
      Asset()
        ..id = '4'
        ..logoUrl = 'https://img.icons8.com/?size=32&id=powAlYM1wpCW&format=png'
        ..name = 'Tesla, Inc.'
        ..currentPrice = 5000.55
        ..percentChange = 0.87,
      Asset()
        ..id = '5'
        ..logoUrl = 'https://img.icons8.com/?size=32&id=tD8gGypEfqaX&format=png'
        ..name = 'ARM Holdings'
        ..currentPrice = 725.30
        ..percentChange = -9.90,
    ];

    final now = DateTime.now();
    final history = <PortfolioSnapshot>[];

    double previousValue = 10000;

    for (int i = 0; i < 30; i++) {
      final timeStamp = now.subtract(Duration(days: 29 - i));
      final change = _rnd.nextInt(501) - 250;
      final nextValue = previousValue + change;

      final snapshot = PortfolioSnapshot()
        ..timestampMs = Int64(timeStamp.millisecondsSinceEpoch)
        ..totalValue = nextValue;

      history.add(snapshot);

      previousValue = nextValue;
    }

    return GetPortfolioListResponse()
      ..assets.addAll(assets)
      ..history.addAll(history);
  }
  
}
