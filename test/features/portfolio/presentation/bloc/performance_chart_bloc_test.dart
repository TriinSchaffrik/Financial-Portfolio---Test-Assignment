import 'package:financial_portfolio/src/features/portfolio/domain/repositories/portfolio_repository.dart';
import 'package:financial_portfolio/src/features/portfolio/presentation/bloc/performance_chart/performance_chart_bloc.dart';
import 'package:financial_portfolio/src/generated/assets.pb.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fixnum/fixnum.dart';

class MockRepository extends Mock implements PortfolioRepository {}

void main() {
  late MockRepository repo;
  late PerformanceChartBloc bloc;

  setUp(() {
    repo = MockRepository();
    bloc = PerformanceChartBloc(repo);
  });

  final response = GetPortfolioListResponse()
    ..history.add(
      PortfolioSnapshot()
        ..timestampMs = Int64(1000)
        ..totalValue = 2000,
    );

  blocTest<PerformanceChartBloc, PerformanceChartState>(
    'PerformanceChartBloc - Emits loading state, then loaded state when data is fetched successfully',
    build: () {
      when(
        () => repo.getHistory(),
      ).thenAnswer((_) async => response.history.toList());
      return bloc;
    },
    act: (bloc) => bloc.add(PerformanceChartFetched()),
    expect: () => [
      isA<PerformanceChartLoading>(),
      isA<PerformanceChartLoaded>(),
    ],
  );

  blocTest<PerformanceChartBloc, PerformanceChartState>(
    'emits error when repository throws',
    build: () {
      when(() => repo.getHistory()).thenThrow(Exception('Network error'));
      return bloc;
    },
    act: (bloc) => bloc.add(PerformanceChartFetched()),
    expect: () => [
      isA<PerformanceChartLoading>(),
      isA<PerformanceChartError>().having(
        (s) => s.message,
        'message',
        contains('Exception: Network error'),
      ),
    ],
  );
}
