import 'package:client/features/verified/domain/entities/order/order_request_entity.dart';

class OrderRequestModel extends OrderRequestEntity {
  OrderRequestModel({super.orderID, super.productID, super.quantity});

  factory OrderRequestModel.fromMap(Map<String, dynamic> map) {
    return OrderRequestModel(
        orderID: map["orderID"],
        productID: map["productID"],
        quantity: map["quantity"]);
  }

  factory OrderRequestModel.fromEntity(OrderRequestEntity entity) {
    return OrderRequestModel(
        orderID: entity.orderID,
        productID: entity.productID,
        quantity: entity.quantity);
  }
}
