import 'package:financial_portfolio/src/features/portfolio/presentation/widgets/loading_spinner.dart';
import 'package:financial_portfolio/src/features/portfolio/presentation/widgets/portfolio_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/assets.pb.dart';
import '../bloc/portfolio/portfolio_list_bloc.dart';
import 'asset_tile.dart';

class PortfolioList extends StatelessWidget {
  const PortfolioList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioListBloc, PortfolioListState>(
      builder: (context, state) {
        if (state is PortfolioListLoading) {
          return const LoadingSpinner();
        } 
        
        else if (state is PortfolioListError) {
          return ErrorWidget(state.message);
        } 
        
        else if (state is PortfolioListLoaded) {
          final List<Asset> assets = state.assets;
          if (assets.isEmpty) {
            return const PortfolioEmpty();
          }
          return ListView.builder(
            itemCount: assets.length,
            itemBuilder: (context, index) {
              final asset = assets[index];
              return AssetTile(key: ValueKey(asset.id), asset: asset);
            },
          );
        }
        return ErrorWidget('Unexpected state');
      },
    );
  }
}
