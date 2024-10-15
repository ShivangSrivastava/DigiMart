import 'package:client/features/verified/domain/entities/order/order_response_entity.dart';

class OrderResponseModel extends OrderResponseEntity {
  OrderResponseModel(
      {super.date,
      super.message,
      super.productID,
      super.quantity,
      super.shippingStatus,
      super.totalPrice});

  factory OrderResponseModel.fromEntity(OrderResponseEntity entity) {
    return OrderResponseModel(
        date: entity.date,
        message: entity.message,
        productID: entity.productID,
        quantity: entity.quantity,
        shippingStatus: entity.shippingStatus,
        totalPrice: entity.totalPrice);
  }

  factory OrderResponseModel.fromJson(Map<String, dynamic> map) {
    return OrderResponseModel(
        date: map["date"],
        message: map["message"],
        productID: map["productID"],
        quantity: map["quantity"],
        shippingStatus: map["shippingStatus"],
        totalPrice: map["totalPrice"]);
  }
}
