// part 'auth_api_service.g.dart';

import 'package:client/core/constants/app_constants.dart';
import 'package:client/features/auth/data/models/remote/auth_model.dart';
import 'package:client/features/auth/data/models/remote/auth_response_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: appAPIBaseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST("/auth/register")
  @Headers({
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<AuthResponseModel>> register(@Body() AuthModel body);

  @POST("/auth/login")
  @Headers({
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<AuthResponseModel>> login(@Body() AuthModel body);
}
