import 'package:vexana/vexana.dart';

import '../../../core/network/network_service.dart';
import '../model/product_model.dart';
import 'IProduct_service.dart';

class ProductService extends IProductService {
  ProductService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<ProductModel>?> fetchDatas() async {
    final response = await networkManager.send<ProductModel, List<ProductModel>>(NetworkService.instance.baseUrl,
        parseModel: ProductModel(), method: RequestType.GET);
    return response.data ?? [];
  }
}


