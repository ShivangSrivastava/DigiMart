import 'package:client/client.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'profile_api_service.g.dart';

@RestApi(baseUrl: ApiEndPoint.profile)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio) = _ProfileApiService;

  @GET("/")
  Future<HttpResponse<ProfileResponseModel>> getProfile();

  @PUT("/")
  @Headers({
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<ProfileResponseModel>> updateProfile(
      @Body() ProfileRequestModel body);

  @DELETE("/")
  @Headers({
    'Content-Type': 'application/json',
  })
  Future<HttpResponse<ProfileResponseModel>> deleteProfile(
      @Body() ProfileRequestModel body);
}
