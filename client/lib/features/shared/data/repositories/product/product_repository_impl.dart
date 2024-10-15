import 'package:client/client.dart';
import 'package:dio/dio.dart' hide Headers;

class ProductRepositoryImpl implements ProductRepository {
  final ProductApiService _productApiService;

  ProductRepositoryImpl(this._productApiService);

  @override
  Future<DataState<List<String>>> getAllCategories() async {
    try {
      final httpResponse = await _productApiService.allCategories();
      return await handleResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<ProductResponseEntity>>> getByCategory(
      {String? category}) async {
    try {
      final httpResponse = await _productApiService.productByCategory(
        category!,
      );
      return await handleResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<ProductResponseEntity>>> search(
      {String? searchText}) async {
    try {
      final httpResponse = await _productApiService.searchProduct(
        searchText!,
      );
      return await handleResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
