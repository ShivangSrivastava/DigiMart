// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class OrderResponseEntity extends Equatable {
  final String? message;
  final String? productID;
  final int? quantity;
  final double? totalPrice;
  final String? shippingStatus;
  final String? date;
  OrderResponseEntity({
    this.message,
    this.productID,
    this.quantity,
    this.totalPrice,
    this.shippingStatus,
    this.date,
  });

  @override
  List<Object> get props {
    return [
      message!,
      productID!,
      quantity!,
      totalPrice!,
      shippingStatus!,
      date!,
    ];
  }
}
