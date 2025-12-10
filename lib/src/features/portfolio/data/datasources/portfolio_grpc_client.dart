import 'package:grpc/grpc.dart';
import '../../../../generated/assets.pbgrpc.dart';

abstract class PortfolioGrpcClient {
  Future<GetPortfolioListResponse> getPortfolio();
}

class PortfolioGrpcClientImpl implements PortfolioGrpcClient {
  PortfolioGrpcClientImpl(this.channel)
    : _stub = AssetServiceClient(
        channel,
        options: CallOptions(timeout: Duration(seconds: 5)),
      );

  final AssetServiceClient _stub;
  final ClientChannel channel;

  @override
  Future<GetPortfolioListResponse> getPortfolio() {
    return _stub.getPortfolioList(GetPortfolioListRequest());
  }

}
