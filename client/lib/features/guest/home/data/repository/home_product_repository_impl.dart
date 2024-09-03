import 'package:client/core/core_export.dart';
import 'package:client/features/guest/guest_export.dart';
import 'package:dio/dio.dart' hide Headers;

class HomeProductRepositoryImpl implements HomeProductRepository {
  final HomeApiService _apiService;

  HomeProductRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<String>>> getAllCategories() async {
    try {
      final httpResponse = await _apiService.allCategories();
      return await handleResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<HomeProductResponseEntity>>> getByCategory(
      {String? category}) async {
    try {
      final httpResponse = await _apiService.productByCategory(
        category!,
      );
      return await handleResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<HomeProductResponseEntity>>> search(
      {String? searchText}) async {
    try {
      final httpResponse = await _apiService.searchProduct(
        searchText!,
      );
      return await handleResponse(httpResponse);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
