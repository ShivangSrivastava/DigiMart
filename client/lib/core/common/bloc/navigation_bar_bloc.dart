// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_bar_event.dart';
part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  NavigationBarBloc() : super(NavigationBarInitial()) {
    on<NavigationBarChangeIndexEvent>((event, emit) {
      final newIndex = event.index;
      emit(NavigationBarChangeIndexState(newIndex));
    });
  }
}
