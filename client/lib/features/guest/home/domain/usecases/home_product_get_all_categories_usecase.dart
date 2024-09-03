import 'package:client/core/core_export.dart';
import 'package:client/features/guest/guest_export.dart';

class HomeProductGetAllCategoriesUsecase
    implements UseCase<DataState<List<String>>, void> {
  final HomeProductRepository _homeProductRepository;

  HomeProductGetAllCategoriesUsecase(this._homeProductRepository);

  @override
  Future<DataState<List<String>>> call({void params}) {
    return _homeProductRepository.getAllCategories();
  }
}
