import 'package:client/core/resources/data_state.dart';
import 'package:client/core/resources/handle_response.dart';
import 'package:client/features/home/data/data_sources/home_api_service.dart';
import 'package:client/features/home/domain/entities/home_product_response_entity.dart';
import 'package:client/features/home/domain/repository/home_product_repository.dart';
import 'package:dio/dio.dart' hide Headers;

class HomeProductRepositoryImpl implements HomeProductRepository {
  final HomeApiService _apiService;

  HomeProductRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<String>>> getAllCategories() async {
    print("called");
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
