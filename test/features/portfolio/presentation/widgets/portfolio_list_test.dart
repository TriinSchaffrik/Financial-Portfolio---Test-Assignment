import 'package:financial_portfolio/src/features/portfolio/presentation/widgets/loading_spinner.dart';
import 'package:financial_portfolio/src/features/portfolio/presentation/widgets/portfolio_empty.dart';
import 'package:financial_portfolio/src/features/portfolio/presentation/widgets/portfolio_list.dart';
import 'package:financial_portfolio/src/features/portfolio/presentation/widgets/asset_tile.dart';
import 'package:financial_portfolio/src/features/portfolio/presentation/bloc/portfolio/portfolio_list_bloc.dart';
import 'package:financial_portfolio/src/generated/assets.pb.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPortfolioListBloc
    extends MockBloc<PortfolioListEvent, PortfolioListState>
    implements PortfolioListBloc {}

void main() {
  late PortfolioListBloc mockBloc;

  setUpAll(() {
    registerFallbackValue(PortfolioListFetched());
    registerFallbackValue(PortfolioListLoading());
  });

  setUp(() {
    mockBloc = MockPortfolioListBloc();
  });

  Widget buildTestWidget() {
    return MaterialApp(
      home: BlocProvider<PortfolioListBloc>.value(
        value: mockBloc,
        child: const Scaffold(body: PortfolioList()),
      ),
    );
  }

  testWidgets('Shows LoadingSpinner when state is PortfolioListLoading', (
    tester,
  ) async {
    when(() => mockBloc.state).thenReturn(PortfolioListLoading());
    whenListen(
      mockBloc,
      Stream<PortfolioListState>.empty(),
      initialState: PortfolioListLoading(),
    );

    await tester.pumpWidget(buildTestWidget());

    expect(find.byType(LoadingSpinner), findsOneWidget);
    expect(find.byType(PortfolioEmpty), findsNothing);
    expect(find.byType(AssetTile), findsNothing);
  });

  testWidgets(
    'Shows ErrorWidget when state is PortfolioListError',
    (tester) async {
      final errorState = PortfolioListError(message: 'Error occurred');
      when(() => mockBloc.state).thenReturn(errorState);
      whenListen(
        mockBloc,
        Stream<PortfolioListState>.empty(),
        initialState: errorState,
      );

      await tester.pumpWidget(buildTestWidget());

      expect(find.byType(ErrorWidget), findsOneWidget);
      expect(find.byType(LoadingSpinner), findsNothing);
      expect(find.byType(AssetTile), findsNothing);
      expect(find.byType(PortfolioEmpty), findsNothing);
    },
  );

  testWidgets(
    'Shows PortfolioEmpty when state is PortfolioListLoaded with empty list',
    (tester) async {
      final loadedState = PortfolioListLoaded(assets: []);
      when(() => mockBloc.state).thenReturn(loadedState);
      whenListen(
        mockBloc,
        Stream<PortfolioListState>.empty(),
        initialState: loadedState,
      );

      await tester.pumpWidget(buildTestWidget());

      expect(find.byType(PortfolioEmpty), findsOneWidget);
      expect(find.byType(LoadingSpinner), findsNothing);
      expect(find.byType(AssetTile), findsNothing);
    },
  );

  testWidgets(
    'Shows AssetTiles when state is PortfolioListLoaded with assets',
    (tester) async {
      final asset1 = Asset()
        ..id = '1'
        ..logoUrl = 'https://img.icons8.com/?size=32&id=95294&format=png'
        ..name = 'Apple Inc.'
        ..currentPrice = 190.20
        ..percentChange = 1.3;
      final asset2 = Asset()
        ..id = '2'
        ..logoUrl = 'https://img.icons8.com/?size=32&id=22989&format=png'
        ..name = 'Microsoft'
        ..currentPrice = 410.80
        ..percentChange = -0.4;

      final loadedState = PortfolioListLoaded(assets: [asset1, asset2]);

      when(() => mockBloc.state).thenReturn(loadedState);
      whenListen(
        mockBloc,
        Stream<PortfolioListState>.empty(),
        initialState: loadedState,
      );

      await tester.pumpWidget(buildTestWidget());

      expect(find.byType(AssetTile), findsNWidgets(2));
      expect(find.byKey(const ValueKey('1')), findsOneWidget);
      expect(find.byKey(const ValueKey('2')), findsOneWidget);
      expect(find.byType(PortfolioEmpty), findsNothing);
      expect(find.byType(LoadingSpinner), findsNothing);
    },
  );
  
}
