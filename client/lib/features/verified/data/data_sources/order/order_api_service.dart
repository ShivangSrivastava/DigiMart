import 'package:client/client.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'order_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoint.order)
abstract class OrderApiService {
  factory OrderApiService(Dio dio) = _OrderApiService;

  @POST("/")
  @Headers({
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<OrderResponseModel>> createOrder(
      @Body() OrderRequestModel body);

  @GET("/")
  Future<HttpResponse<List<OrderResponseModel>>> viewOrders();

  @DELETE("/")
  Future<HttpResponse<OrderResponseModel>> cancelOrder(
      @Body() OrderRequestModel body);
}
