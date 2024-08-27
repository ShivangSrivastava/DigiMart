import 'package:equatable/equatable.dart';

class HomeProductResponseEntity extends Equatable {
  final String? id;
  final String? vendorId;
  final String? name;
  final String? desc;
  final String? category;
  final double? price;
  final int? stock;
  final List? images;
  final String? updatedAt;

  const HomeProductResponseEntity(
      {this.id,
      this.vendorId,
      this.name,
      this.desc,
      this.category,
      this.price,
      this.stock,
      this.images,
      this.updatedAt});

  @override
  List<Object?> get props =>
      [id, vendorId, name, desc, category, price, stock, images, updatedAt];
}
