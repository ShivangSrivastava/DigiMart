import 'package:client/core/resources/data_state.dart';
import 'package:client/features/home/domain/entities/home_product_response_entity.dart';

abstract class HomeProductRepository {
  Future<DataState<List<String>>> getAllCategories();
  Future<DataState<List<HomeProductResponseEntity>>> search({String searchText});
  Future<DataState<List<HomeProductResponseEntity>>> getByCategory(
      {String category});
}
