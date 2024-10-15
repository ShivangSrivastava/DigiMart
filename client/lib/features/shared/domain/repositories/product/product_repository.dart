import 'package:client/client.dart';

abstract class ProductRepository {
  Future<DataState<List<String>>> getAllCategories();
  Future<DataState<List<ProductResponseEntity>>> search({String searchText});
  Future<DataState<List<ProductResponseEntity>>> getByCategory(
      {String category});
}
