import 'package:client/client.dart';

class OrderViewUsecase
    implements UseCase<DataState<List<OrderResponseEntity>>, void> {
  final OrderRepository _orderRepository;

  OrderViewUsecase(this._orderRepository);

  @override
  Future<DataState<List<OrderResponseEntity>>> call({params}) {
    return _orderRepository.viewOrders();
  }
}
