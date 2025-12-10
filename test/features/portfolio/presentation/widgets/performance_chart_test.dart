import 'package:financial_portfolio/src/features/portfolio/presentation/bloc/performance_chart/performance_chart_bloc.dart';
import 'package:financial_portfolio/src/features/portfolio/presentation/widgets/widgets.dart';
import 'package:financial_portfolio/src/generated/assets.pb.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:fixnum/fixnum.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPerformanceChartBloc
    extends MockBloc<PerformanceChartEvent, PerformanceChartState>
    implements PerformanceChartBloc {}

void main() {
  late PerformanceChartBloc mockBloc;

  setUpAll(() {
    registerFallbackValue(PerformanceChartFetched());
    registerFallbackValue(PerformanceChartLoading());
  });

  setUp(() {
    mockBloc = MockPerformanceChartBloc();
  });

  Widget buildTestWidget() {
    return MaterialApp(
      home: BlocProvider<PerformanceChartBloc>(
        create: (_) => mockBloc,
        child: const Scaffold(body: PerformanceChart()),
      ),
    );
  }

  testWidgets('Shows LoadingSpinner when state is PerformanceChartLoading', (
    tester,
  ) async {
    when(() => mockBloc.state).thenReturn(PerformanceChartLoading());
    whenListen(
      mockBloc,
      Stream<PerformanceChartState>.empty(),
      initialState: PerformanceChartLoading(),
    );

    await tester.pumpWidget(buildTestWidget());

    expect(find.byType(LoadingSpinner), findsOneWidget);
    expect(find.byType(LineChart), findsNothing);
  });
  testWidgets(
    'Shows ErrorWidget when state is PerformanceChartError',
    (tester) async {
      final errorState = PerformanceChartError(message: 'Error occurred');
      when(() => mockBloc.state).thenReturn(errorState);
      whenListen(
        mockBloc,
        Stream<PerformanceChartState>.empty(),
        initialState: errorState,
      );

      await tester.pumpWidget(buildTestWidget());

      expect(find.byType(ErrorWidget), findsOneWidget);
      expect(find.byType(LoadingSpinner), findsNothing);
      expect(find.byType(LineChart), findsNothing);
      expect(find.byType(PerformanceChartEmpty), findsNothing);
    },
  );

  testWidgets(
    'Shows PerformanceChartEmpty when state is PerformanceChartLoaded with empty data',
    (tester) async {
      final loadedState = PerformanceChartLoaded(performanceData: []);
      when(() => mockBloc.state).thenReturn(loadedState);
      whenListen(
        mockBloc,
        Stream<PerformanceChartState>.empty(),
        initialState: loadedState,
      );

      await tester.pumpWidget(buildTestWidget());

      expect(find.byType(PerformanceChartEmpty), findsOneWidget);
      expect(find.byType(LoadingSpinner), findsNothing);

      final linaChart = tester.widget<LineChart>(find.byType(LineChart));
      expect(linaChart.data.lineBarsData.isEmpty, isTrue);
    },
  );

  testWidgets(
    'Shows LineChart when state is PerformanceChartLoaded with data',
    (tester) async {
      final asset1 = PortfolioSnapshot()
        ..timestampMs = Int64(1765276869000)
        ..totalValue = 15000;
      final asset2 = PortfolioSnapshot()
        ..timestampMs = Int64(1765363269000)
        ..totalValue = 15000;

      final loadedState = PerformanceChartLoaded(
        performanceData: [asset1, asset2],
      );

      when(() => mockBloc.state).thenReturn(loadedState);
      whenListen(
        mockBloc,
        Stream<PerformanceChartState>.empty(),
        initialState: loadedState,
      );

      await tester.pumpWidget(buildTestWidget());

      expect(find.byType(LineChart), findsOneWidget);
      expect(find.byType(PerformanceChartEmpty), findsNothing);
      expect(find.byType(LoadingSpinner), findsNothing);
    },
  );
}
