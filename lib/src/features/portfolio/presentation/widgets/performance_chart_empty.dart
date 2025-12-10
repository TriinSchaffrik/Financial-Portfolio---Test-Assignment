import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PerformanceChartEmpty extends StatelessWidget {
  const PerformanceChartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            LineChart(
              LineChartData(
                lineBarsData: [],
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withAlpha(100),
                      strokeWidth: 1,
                    );
                  },
                ),
                borderData: FlBorderData(show: false),
                titlesData: const FlTitlesData(show: false),
                minX: 0,
                maxX: 10,
                minY: 0,
                maxY: 5,
              ),
            ),
            Text(
              'No data available',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
