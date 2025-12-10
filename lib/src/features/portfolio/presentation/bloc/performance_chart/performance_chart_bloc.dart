import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:financial_portfolio/src/features/portfolio/domain/repositories/portfolio_repository.dart';
import 'package:meta/meta.dart';

import '../../../../../generated/assets.pb.dart';

part 'performance_chart_event.dart';
part 'performance_chart_state.dart';

class PerformanceChartBloc
    extends Bloc<PerformanceChartEvent, PerformanceChartState> {
  final PortfolioRepository _repository;
  PerformanceChartBloc(this._repository) : super(PerformanceChartLoading()) {
    on<PerformanceChartEvent>((event, emit) async {
      try {
        emit(PerformanceChartLoading());

        final performanceData = await _repository.getHistory();

        emit(PerformanceChartLoaded(performanceData: performanceData));
      } catch (e) {
        emit(PerformanceChartError(message: e.toString()));
      }
    });
  }
}
