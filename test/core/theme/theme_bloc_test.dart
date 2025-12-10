import 'package:financial_portfolio/src/core/theme/theme_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Theme toggles correctly', () {
    final bloc = ThemeBloc();

    expect(bloc.state.isDark, false);

    bloc.add(ToggleThemeEvent());
    expectLater(
      bloc.stream,
      emits(isA<ThemeState>().having((state) => state.isDark, 'isDark', true)),
    );
  });
}
