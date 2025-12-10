part of 'performance_chart_bloc.dart';

@immutable
sealed class PerformanceChartEvent {}

final class PerformanceChartFetched extends PerformanceChartEvent {}
