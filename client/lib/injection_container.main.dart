part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> startupLocator() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // shared preference
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  sl.registerSingleton(prefs);

  // network
  sl.registerFactory(() => InternetConnection());
  sl.registerFactory(() => Connectivity());
  
  // home
  sl.registerSingleton<HomeApiService>(
    HomeApiService(sl()),
  );
  sl.registerSingleton<HomeProductRepository>(
    HomeProductRepositoryImpl(sl()),
  );
  sl.registerSingleton<HomeProductGetAllCategoriesUsecase>(
    HomeProductGetAllCategoriesUsecase(sl()),
  );
  sl.registerSingleton<HomeProductGetByCategoryUsecase>(
    HomeProductGetByCategoryUsecase(sl()),
  );
  sl.registerSingleton<HomeProductSearchUsecase>(
    HomeProductSearchUsecase(sl()),
  );
  
  // app
  sl.registerSingleton<AppBloc>(AppBloc(sl(), sl()));

}
