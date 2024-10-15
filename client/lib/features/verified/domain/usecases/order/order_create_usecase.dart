import 'package:client/client.dart';

class OrderCreateUsecase
    implements UseCase<DataState<OrderResponseEntity>, OrderRequestEntity> {
  final OrderRepository _orderRepository;

  OrderCreateUsecase(this._orderRepository);

  @override
  Future<DataState<OrderResponseEntity>> call({params}) {
    return _orderRepository.createOrder(params!);
  }
}
