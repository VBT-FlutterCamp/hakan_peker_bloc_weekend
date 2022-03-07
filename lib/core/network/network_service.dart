import 'package:vexana/vexana.dart';

class NetworkService {
  static NetworkService? _instace;
  static NetworkService get instance {
    _instace ??= NetworkService._init();
    return _instace!;
  }

  late final INetworkManager networkManager;
  final String baseUrl = 'https://fakestoreapi.com/products/category/jewelery';

  NetworkService._init() {
    networkManager = NetworkManager(options: BaseOptions(baseUrl: baseUrl));
  }
}