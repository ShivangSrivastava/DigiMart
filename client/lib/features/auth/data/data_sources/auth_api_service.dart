// part 'auth_api_service.g.dart';

import 'package:client/client.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoint.auth)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST("/register")
  @Headers({
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<AuthResponseModel>> register(
      @Body() AuthRequestModel body);

  @POST("/login")
  @Headers({
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<AuthResponseModel>> login(@Body() AuthRequestModel body);
}
