// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ProductResponseEntity extends Equatable {
  final String? id;
  final String? vendorId;
  final String? name;
  final String? desc;
  final String? category;
  final double? price;
  final int? stock;
  final List? images;

  const ProductResponseEntity(
      {this.id,
      this.vendorId,
      this.name,
      this.desc,
      this.category,
      this.price,
      this.stock,
      this.images});

  @override
  List<Object?> get props {
    return [id, vendorId, name, desc, category, price, stock, images];
  }
}
