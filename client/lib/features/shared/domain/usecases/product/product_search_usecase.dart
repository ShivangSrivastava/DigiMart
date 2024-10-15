import 'package:client/client.dart';

class ProductSearchUsecase
    implements UseCase<DataState<List<ProductResponseEntity>>, String?> {
  final ProductRepository _productRepository;

  ProductSearchUsecase(this._productRepository);

  @override
  Future<DataState<List<ProductResponseEntity>>> call({params}) {
    return _productRepository.search(searchText: params!);
  }
}
