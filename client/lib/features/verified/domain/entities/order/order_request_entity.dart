// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class OrderRequestEntity extends Equatable {
  final int? quantity;
  final String? productID;
  final String? orderID;
  OrderRequestEntity({
    this.quantity,
    this.productID,
    this.orderID,
  });

  @override
  List<Object> get props => [quantity!, productID!, orderID!];
}
