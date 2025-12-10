import 'package:financial_portfolio/src/core/theme/app_theme.dart';
import 'package:financial_portfolio/src/core/theme/theme_bloc.dart';
import 'package:financial_portfolio/src/features/portfolio/presentation/pages/portfolio_overview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/portfolio/data/datasources/mock_portfolio_grpc_client.dart';
import 'features/portfolio/data/repositories/portfolio_repository_impl.dart';
import 'features/portfolio/presentation/bloc/performance_chart/performance_chart_bloc.dart';
import 'features/portfolio/presentation/bloc/portfolio/portfolio_list_bloc.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final grpcClient = MockPortfolioGrpcClient();
    final repository = PortfolioRepositoryImpl(grpcClient);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(
          create: (context) =>
              PerformanceChartBloc(repository)..add(PerformanceChartFetched()),
        ),
        BlocProvider(
          create: (context) =>
              PortfolioListBloc(repository)..add(PortfolioListFetched()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final themeData = state.isDark
              ? AppTheme.neoBankTheme
              : AppTheme.retailBankTheme;
          return MaterialApp(
            title: 'Financial Portfolio',
            theme: themeData,
            home: const PortfolioOverviewPage(),
          );
        },
      ),
    );
  }
}
