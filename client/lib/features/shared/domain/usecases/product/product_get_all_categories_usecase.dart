import 'package:client/client.dart';

class ProductGetAllCategoriesUsecase
    implements UseCase<DataState<List<String>>, void> {
  final ProductRepository _productRepository;

  ProductGetAllCategoriesUsecase(this._productRepository);

  @override
  Future<DataState<List<String>>> call({params}) {
    return _productRepository.getAllCategories();
  }
}
