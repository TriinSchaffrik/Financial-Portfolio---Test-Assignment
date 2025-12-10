import 'package:financial_portfolio/src/features/portfolio/data/datasources/portfolio_grpc_client.dart';
import 'package:financial_portfolio/src/features/portfolio/data/repositories/portfolio_repository_impl.dart';
import 'package:financial_portfolio/src/generated/assets.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGrpcClient extends Mock implements PortfolioGrpcClient {}

void main() {
  late MockGrpcClient client;
  late PortfolioRepositoryImpl repository;

  setUp(() {
    client = MockGrpcClient();
    repository = PortfolioRepositoryImpl(client);
  });

  test('returns assets and history from grpc client', () async {
    final response = GetPortfolioListResponse()
      ..assets.add(
        Asset()
          ..id = '1'
          ..logoUrl = 'https://img.icons8.com/?size=32&id=95294&format=png'
          ..name = 'Apple'
          ..currentPrice = 100.0
          ..percentChange = 1.2,
      )
      ..history.add(
        PortfolioSnapshot()
          ..timestampMs = Int64(1000)
          ..totalValue = 5000,
      );

    when(() => client.getPortfolio())
        .thenAnswer((_) async => response);

    final assetsResponse = await repository.getAssets();
    final historyResponse = await repository.getHistory();

    expect(assetsResponse.first.logoUrl, 'https://img.icons8.com/?size=32&id=95294&format=png');
    expect(historyResponse.first.totalValue, 5000);
  });
}
