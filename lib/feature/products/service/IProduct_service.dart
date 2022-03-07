import 'package:flutter_bloc_weekend/feature/products/model/product_model.dart';
import 'package:vexana/vexana.dart';

abstract class IProductService {
  final INetworkManager networkManager;

  IProductService(this.networkManager);

  Future<List<ProductModel>?> fetchDatas();
}
