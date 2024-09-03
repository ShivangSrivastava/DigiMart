// part 'auth_api_service.g.dart';

import 'package:client/core/core_export.dart';
import 'package:client/features/guest/guest_export.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: appAPIBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET("/product/all-categories")
  Future<HttpResponse<List<String>>> allCategories();

  @GET("/product/getProduct/{category}")
  Future<HttpResponse<List<HomeProductResponseModel>>> productByCategory(
    @Path('category') String category,
  );

  @GET("/product/search/")
  Future<HttpResponse<List<HomeProductResponseModel>>> searchProduct(
    @Query('q') String search,
  );
}
