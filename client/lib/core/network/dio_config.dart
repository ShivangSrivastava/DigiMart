import 'package:client/client.dart';
import 'package:client/core/constants/string_constant.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final storage = sl<SharedPreferences>();

Future<String?> getToken() async {
  return await storage.getString(StringConstant.jwtToken);
}

Dio createDio() {
  final dio = Dio();

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      if (options.headers['No-Auth'] != true) {
        final token = await getToken();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
      }
      return handler.next(options);
    },
    onResponse: (response, handler) {
      return handler.next(response);
    },
    onError: (DioException error, handler) {
      return handler.next(error);
    },
  ));

  return dio;
}
