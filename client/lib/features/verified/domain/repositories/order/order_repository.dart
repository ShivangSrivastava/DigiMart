import 'package:client/client.dart';

abstract class OrderRepository {
  Future<DataState<OrderResponseEntity>> createOrder(
      OrderRequestEntity orderRequestEntity);
  Future<DataState<List<OrderResponseEntity>>> viewOrders();
  Future<DataState<OrderResponseEntity>> cancelOrder(
      OrderRequestEntity orderRequestEntity);
}
