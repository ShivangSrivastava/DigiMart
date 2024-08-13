import 'dart:async';

import 'package:client/features/home/domain/usecases/home_product_get_all_categories_usecase.dart';
import 'package:client/injection_container.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final HomeProductGetAllCategoriesUsecase getAllCategoriesUsecase;
  final Connectivity connectivity;
  AppBloc(this.getAllCategoriesUsecase, this.connectivity)
      : super(AppInitial()) {
    on<AppCheck>(_appCheck);
  }

  Future<void> _appCheck(event, emit) async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult.first == ConnectivityResult.none) {
      emit(AppNoInternet());
      return;
    }
    emit(AppLoading());
    final token = sl<SharedPreferences>().getString("token");
    final categories = await getAllCategoriesUsecase.call();
    if (token != null && token.isNotEmpty) {
      emit(AppAuthenticated(token: token, categories: categories.data!));
    } else {
      emit(AppUnauthenticated(categories: categories.data!));
    }
  }
}
