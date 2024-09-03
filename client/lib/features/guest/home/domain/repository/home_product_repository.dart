import 'package:client/core/core_export.dart';
import 'package:client/features/guest/guest_export.dart';

abstract class HomeProductRepository {
  Future<DataState<List<String>>> getAllCategories();
  Future<DataState<List<HomeProductResponseEntity>>> search(
      {String searchText});
  Future<DataState<List<HomeProductResponseEntity>>> getByCategory(
      {String category});
}
