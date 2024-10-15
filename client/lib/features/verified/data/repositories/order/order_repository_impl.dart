import 'package:client/client.dart';
import 'package:dio/dio.dart';

class OrderRepositoryImpl extends OrderRepository {
  final OrderApiService _orderApiService;

  OrderRepositoryImpl(this._orderApiService);

  @override
  Future<DataState<OrderResponseEntity>> cancelOrder(
      OrderRequestEntity orderRequestEntity) async {
    final orderModel = OrderRequestModel.fromEntity(orderRequestEntity);
    try {
      final httpResponse = await _orderApiService.cancelOrder(orderModel);
      return await handleResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<OrderResponseEntity>> createOrder(
      OrderRequestEntity orderRequestEntity) async {
    final orderModel = OrderRequestModel.fromEntity(orderRequestEntity);
    try {
      final httpResponse = await _orderApiService.createOrder(orderModel);
      return await handleResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<OrderResponseEntity>>> viewOrders() async {
    try {
      final httpResponse = await _orderApiService.viewOrders();
      return await handleResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
