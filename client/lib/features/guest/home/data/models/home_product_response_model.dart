import 'package:client/features/guest/guest_export.dart';

class HomeProductResponseModel extends HomeProductResponseEntity {
  const HomeProductResponseModel({
    super.id,
    super.vendorId,
    super.name,
    super.desc,
    super.category,
    super.price,
    super.stock,
    super.images,
    super.updatedAt,
  });
  // from response entity
  factory HomeProductResponseModel.fromResponseEntity(
      HomeProductResponseEntity entity) {
    return HomeProductResponseModel(
      id: entity.id,
      vendorId: entity.vendorId,
      name: entity.name,
      desc: entity.desc,
      category: entity.category,
      price: entity.price,
      stock: entity.stock,
      images: entity.images,
      updatedAt: entity.updatedAt,
    );
  }
  // from json
  factory HomeProductResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeProductResponseModel(
      id: json['id'],
      vendorId: json['vendorId'],
      name: json['name'],
      desc: json['desc'],
      category: json['category'],
      price: json['price'],
      images: json['images'],
      stock: json['stock'],
      updatedAt: json['updatedAt'],
    );
  }
}
