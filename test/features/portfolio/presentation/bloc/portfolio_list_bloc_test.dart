import 'package:financial_portfolio/src/features/portfolio/domain/repositories/portfolio_repository.dart';
import 'package:financial_portfolio/src/features/portfolio/presentation/bloc/portfolio/portfolio_list_bloc.dart';
import 'package:financial_portfolio/src/generated/assets.pb.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements PortfolioRepository {}

void main() {
  late MockRepository repo;
  late PortfolioListBloc bloc;

  setUp(() {
    repo = MockRepository();
    bloc = PortfolioListBloc(repo);
  });

  final response = GetPortfolioListResponse()
    ..assets.add(
      Asset()
        ..id = '1'
        ..logoUrl = 'https://img.icons8.com/?size=32&id=95294&format=png'
        ..name = 'Apple'
        ..currentPrice = 100
        ..percentChange = 1.2,
    );

  blocTest<PortfolioListBloc, PortfolioListState>(
    'PortfolioListBloc - Emits loading state, then loaded state when data is fetched successfully',
    build: () {
      when(
        () => repo.getAssets(),
      ).thenAnswer((_) async => response.assets.toList());
      return bloc;
    },
    act: (bloc) => bloc.add(PortfolioListFetched()),
    expect: () => [isA<PortfolioListLoading>(), isA<PortfolioListLoaded>()],
  );

  blocTest<PortfolioListBloc, PortfolioListState>(
    'emits error when repository throws',
    build: () {
      when(() => repo.getAssets()).thenThrow(Exception('Network error'));
      return bloc;
    },
    act: (bloc) => bloc.add(PortfolioListFetched()),
    expect: () => [
      isA<PortfolioListLoading>(),
      isA<PortfolioListError>().having(
        (s) => s.message,
        'message',
        contains('Exception: Network error'),
      ),
    ],
  );
}
