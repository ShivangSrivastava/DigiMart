import 'package:client/features/shared/domain/entities/product/product_response_entity.dart';

class ProductResponseModel extends ProductResponseEntity {
  const ProductResponseModel({
    super.id,
    super.vendorId,
    super.name,
    super.desc,
    super.category,
    super.price,
    super.stock,
    super.images,
  });
  // from response entity
  factory ProductResponseModel.fromEntity(
      ProductResponseEntity entity) {
    return ProductResponseModel(
      id: entity.id,
      vendorId: entity.vendorId,
      name: entity.name,
      desc: entity.desc,
      category: entity.category,
      price: entity.price,
      stock: entity.stock,
      images: entity.images,
    );
  }
  // from json
  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      id: json['id'],
      vendorId: json['vendorId'],
      name: json['name'],
      desc: json['desc'],
      category: json['category'],
      price: json['price'],
      images: json['images'],
      stock: json['stock'],
    );
  }
}
