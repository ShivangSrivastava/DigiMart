import 'package:client/core/resources/data_state.dart';
import 'package:client/core/usecase/usecase.dart';
import 'package:client/features/home/domain/repository/home_product_repository.dart';

class HomeProductGetAllCategoriesUsecase
    implements UseCase<DataState<List<String>>, void> {
  final HomeProductRepository _homeProductRepository;

  HomeProductGetAllCategoriesUsecase(this._homeProductRepository);

  @override
  Future<DataState<List<String>>> call({void params}) {
    return _homeProductRepository.getAllCategories();
  }
}
