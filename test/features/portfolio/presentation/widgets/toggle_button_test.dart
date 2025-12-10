import 'package:financial_portfolio/src/core/theme/app_theme.dart';
import 'package:financial_portfolio/src/core/theme/theme_bloc.dart';
import 'package:financial_portfolio/src/features/portfolio/presentation/widgets/theme_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {}

void main() {
  late MockThemeBloc mockThemeBloc;

  setUpAll(() {
    registerFallbackValue(ToggleThemeEvent());
  });

  setUp(() {
    mockThemeBloc = MockThemeBloc();
  });

  testWidgets('Theme toggle button switches from light to dark theme', (
    WidgetTester tester,
  ) async {
    when(() => mockThemeBloc.state).thenReturn(ThemeState(isDark: false));
    whenListen(
      mockThemeBloc,
      Stream.fromIterable([
        ThemeState(isDark: false),
        ThemeState(isDark: true),
      ]),
      initialState: ThemeState(isDark: false),
    );

    await tester.pumpWidget(
      BlocProvider<ThemeBloc>(
        create: (context) => mockThemeBloc,
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            final themeData = state.isDark
                ? AppTheme.neoBankTheme
                : AppTheme.retailBankTheme;
            return MaterialApp(
              theme: themeData,
              home: const Scaffold(floatingActionButton: ThemeToggleButton()),
            );
          },
        ),
      ),
    );

    expect(find.byIcon(Icons.dark_mode), findsOneWidget);
    var materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialApp.theme?.brightness, Brightness.light);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    verify(() => mockThemeBloc.add(any<ToggleThemeEvent>())).called(1);

    expect(find.byIcon(Icons.light_mode), findsOneWidget);
    materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(materialApp.theme?.brightness, Brightness.dark);
  });
}
