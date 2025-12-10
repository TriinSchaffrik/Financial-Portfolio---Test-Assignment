import '../../../../generated/assets.pb.dart';

abstract class PortfolioRepository {
  Future<List<Asset>> getAssets();
  Future<List<PortfolioSnapshot>> getHistory();
}
