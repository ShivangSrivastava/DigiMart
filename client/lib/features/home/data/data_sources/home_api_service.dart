// part 'auth_api_service.g.dart';

import 'package:client/core/constants/app_constants.dart';
import 'package:client/features/home/data/models/home_product_response_model.dart';
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
