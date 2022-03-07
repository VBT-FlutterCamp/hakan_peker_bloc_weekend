

import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends INetworkModel<ProductModel> {
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
  });

  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;

  @override
  ProductModel fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$ProductModelToJson(this);
  }
}
