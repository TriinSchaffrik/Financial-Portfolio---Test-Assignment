import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../generated/assets.pb.dart';
import '../../../domain/repositories/portfolio_repository.dart';

part 'portfolio_list_event.dart';
part 'portfolio_list_state.dart';

class PortfolioListBloc extends Bloc<PortfolioListEvent, PortfolioListState> {
  final PortfolioRepository _repository;

  PortfolioListBloc(this._repository) : super(PortfolioListLoading()) {
    on<PortfolioListFetched>((event, emit) async {
      try {
        emit(PortfolioListLoading());

        final assets = await _repository.getAssets();

        emit(PortfolioListLoaded(assets: assets));
      } catch (e) {
        emit(PortfolioListError(message: e.toString()));
      }
    });
  }
}
