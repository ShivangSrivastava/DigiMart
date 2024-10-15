import 'package:client/client.dart';

class ProductGetByCategoryUsecase
    implements UseCase<DataState<List<ProductResponseEntity>>, String?> {
  final ProductRepository _productRepository;

  ProductGetByCategoryUsecase(this._productRepository);

  @override
  Future<DataState<List<ProductResponseEntity>>> call({params}) {
    return _productRepository.getByCategory(category: params!);
  }
}
