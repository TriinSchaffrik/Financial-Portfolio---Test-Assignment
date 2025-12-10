import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../bloc/performance_chart/performance_chart_bloc.dart';
import 'widgets.dart';

class PerformanceChart extends StatelessWidget {
  const PerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PerformanceChartBloc, PerformanceChartState>(
      builder: (context, state) {
        if (state is PerformanceChartLoading) {
          return const LoadingSpinner();
        } else if (state is PerformanceChartError) {
          return ErrorWidget(state.message);
        } else if (state is PerformanceChartLoaded) {
          final data = state.performanceData;
          if (data.isEmpty) {
            return const PerformanceChartEmpty();
          }

          final chartDataPoints = List.generate(data.length, (index) {
            return FlSpot(index.toDouble(), data[index].totalValue);
          }).toList();

          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: LineChart(
                LineChartData(
                  clipData: const FlClipData.all(),
                  lineTouchData: LineTouchData(
                    getTouchLineEnd: (barData, spotIndex) => 0,
                    touchTooltipData: LineTouchTooltipData(
                      fitInsideHorizontally: true,
                      fitInsideVertically: true,
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((touchedSpot) {
                          final date = DateTime.fromMillisecondsSinceEpoch(
                            data[touchedSpot.x.toInt()].timestampMs.toInt(),
                          );
                          final formattedDate = DateFormat(
                            'MMM dd, yyyy',
                          ).format(date);
                          final formattedValue = touchedSpot.y.toStringAsFixed(
                            2,
                          );

                          return LineTooltipItem(
                            '$formattedDate\n\$ $formattedValue',
                            const TextStyle(color: Colors.white),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      color: Theme.of(context).colorScheme.primary,
                      spots: chartDataPoints,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(
                              context,
                            ).colorScheme.primary.withAlpha(150),
                            Theme.of(context).colorScheme.primary.withAlpha(0),
                          ],
                        ),
                      ),
                    ),
                  ],
                  gridData: const FlGridData(
                    show: true,
                    drawVerticalLine: false,
                  ),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles: const AxisTitles(),
                    leftTitles: const AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: data.length.toDouble(),
                        getTitlesWidget: (value, meta) {
                          final date = DateTime.fromMillisecondsSinceEpoch(
                            data[value.toInt()].timestampMs.toInt(),
                          );
                          final label = DateFormat('MM/yy').format(date);

                          return Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              label,
                              style: Theme.of(context).textTheme.bodySmall!,
                            ),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        reservedSize: 32,
                        showTitles: true,
                        minIncluded: false,
                        maxIncluded: false,
                        getTitlesWidget: (value, meta) {
                          String label;
                          if (value >= 1000) {
                            label = '${(value / 1000).toStringAsFixed(1)}k';
                          } else {
                            label = value.toStringAsFixed(0);
                          }

                          return Text(
                            label,
                            textAlign: TextAlign.right,
                            style: Theme.of(context).textTheme.bodySmall!,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return ErrorWidget('Unexpected state');
      },
    );
  }
}
