part of 'portfolio_list_bloc.dart';

@immutable
sealed class PortfolioListState extends Equatable {}

final class PortfolioListLoading extends PortfolioListState {
  @override
  List<Object?> get props => [];
}

final class PortfolioListLoaded extends PortfolioListState {
  final List<Asset> assets;

  PortfolioListLoaded({required this.assets});

  @override
  List<Object?> get props => [assets];
}

final class PortfolioListError extends PortfolioListState {
  final String message;

  PortfolioListError({required this.message});

  @override
  List<Object?> get props => [message];
}
