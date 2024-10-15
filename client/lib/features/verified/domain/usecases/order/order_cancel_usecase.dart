import 'package:client/client.dart';

class OrderDeleteUsecase
    implements UseCase<DataState<OrderResponseEntity>, OrderRequestEntity> {
  final OrderRepository _orderRepository;

  OrderDeleteUsecase(this._orderRepository);

  @override
  Future<DataState<OrderResponseEntity>> call({params}) {
    return _orderRepository.cancelOrder(params!);
  }
}
