part of 'performance_chart_bloc.dart';

@immutable
sealed class PerformanceChartState extends Equatable {}

final class PerformanceChartLoading extends PerformanceChartState {
  @override
  List<Object?> get props => [];
}

final class PerformanceChartLoaded extends PerformanceChartState {
  final List<PortfolioSnapshot> performanceData;

  PerformanceChartLoaded({required this.performanceData});

  @override
  List<Object?> get props => [performanceData];
}

final class PerformanceChartError extends PerformanceChartState {
  final String message;

  PerformanceChartError({required this.message});

  @override
  List<Object?> get props => [message];
}
