import 'package:client/client.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'product_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoint.product)
abstract class ProductApiService {
  factory ProductApiService(Dio dio) = _ProductApiService;

  @GET("/all-categories")
  Future<HttpResponse<List<String>>> allCategories();

  @GET("/getProduct/{category}")
  Future<HttpResponse<List<ProductResponseModel>>> productByCategory(
    @Path('category') String category,
  );

  @GET("/search/")
  Future<HttpResponse<List<ProductResponseModel>>> searchProduct(
    @Query('q') String search,
  );
}
