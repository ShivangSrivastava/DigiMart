import 'package:client/client.dart';
import 'package:client/core/constants/string_constant.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final Connectivity connectivity;
  AppBloc(this.connectivity) : super(AppInitial()) {
    on<NetworkStatusChecked>(_appCheck);
  }

  Future<void> _appCheck(event, emit) async {
    final connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult.first == ConnectivityResult.none) {
      emit(NetworkError());
      return;
    }
    emit(AppLoading());
    final token = sl<SharedPreferences>().getString(StringConstant.jwtToken);
    if (token != null && token.isNotEmpty) {
      emit(VerificationSuccess());
      return;
    }
    emit(VerificationFailure());
  }
}
