import 'dart:async';

import 'package:client/injection_container.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppCheck>(_appCheck);
  }

  FutureOr<void> _appCheck(event, emit) {
    final token = locator<SharedPreferences>().getString("token");
    // check token is neither empty nor null
    if (token != null && token.isNotEmpty) {
      emit(AppAuthenticated(token: token));
    } else {
      emit(AppUnauthenticated());
    }
  }
}
