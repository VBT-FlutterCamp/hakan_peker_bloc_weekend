import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/product_model.dart';
import '../service/IProduct_service.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productService) : super(ProductInitial()) {
    fetchListData();
  }

  IProductService productService;

  List<ProductModel>? productModel;

  int? listCount = 0;

  Future<void> fetchListData() async {
    emit(ProductLoading());
    final productModel = await productService.fetchDatas();
    listCount = productModel?.length;
    emit(ProductCompleted(productModel));
  }
}
