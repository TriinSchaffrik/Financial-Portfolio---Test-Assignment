import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class PortfolioOverviewPage extends StatelessWidget {
  const PortfolioOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PerformanceChart(),
              Flexible(child: const PortfolioList()),
            ],
          ),
        ),
      ),
      floatingActionButton: const ThemeToggleButton(),
    );
  }
}
