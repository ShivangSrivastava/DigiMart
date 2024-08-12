import 'package:client/core/resources/data_state.dart';
import 'package:client/core/usecase/usecase.dart';
import 'package:client/features/home/domain/entities/home_product_response_entity.dart';
import 'package:client/features/home/domain/repository/home_product_repository.dart';

class HomeProductSearchUsecase
    implements UseCase<DataState<List<HomeProductResponseEntity>>, String?> {
  final HomeProductRepository _homeProductRepository;

  HomeProductSearchUsecase(this._homeProductRepository);

  @override
  Future<DataState<List<HomeProductResponseEntity>>> call({String? params}) {
    return _homeProductRepository.search(searchText: params!);
  }
}
