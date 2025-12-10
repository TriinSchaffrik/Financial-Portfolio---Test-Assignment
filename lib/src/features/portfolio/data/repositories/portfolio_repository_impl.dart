import '../../../../generated/assets.pb.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/portfolio_grpc_client.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  PortfolioRepositoryImpl(this._client);

  final PortfolioGrpcClient _client;

  late GetPortfolioListResponse _cachedResponse;
  DateTime? _lastFetchTime;

  @override
  Future<List<Asset>> getAssets() async {
    await _ensureDataFetched();
    return List.unmodifiable(_cachedResponse.assets);
  }

  @override
  Future<List<PortfolioSnapshot>> getHistory() async {
    await _ensureDataFetched();
    return List.unmodifiable(_cachedResponse.history);
  }

  Future<void> _ensureDataFetched() async {
    final now = DateTime.now();
    if (_lastFetchTime != null &&
        now.difference(_lastFetchTime!).inSeconds < 10) {
      return;
    }
    _cachedResponse = await _client.getPortfolio();
    _lastFetchTime = now;
  }
}
