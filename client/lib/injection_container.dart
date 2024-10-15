import 'package:client/client.dart';
import 'package:client/features/app/presentation/bloc/app_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> startupLocator() async {
  // Dio
  sl.registerSingleton<Dio>(createDio());

  // shared preference
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  sl.registerSingleton(prefs);

  // network
  sl.registerFactory(() => InternetConnection());
  sl.registerFactory(() => Connectivity());

  // app
  sl.registerSingleton(AppBloc(sl()));
}
