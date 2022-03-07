import 'package:flutter_bloc_weekend/feature/products/model/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductCompleted extends ProductState {
  final List<ProductModel>? items;

  ProductCompleted(this.items);
}

class ProductErrorState extends ProductState {
  
}
