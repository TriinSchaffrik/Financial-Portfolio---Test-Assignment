import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(isDark: false)) {
    on<ToggleThemeEvent>((event, emit) {
      emit(ThemeState(isDark: !state.isDark));
    });
  }
}
