part of 'navigation_bar_bloc.dart';

sealed class NavigationBarEvent extends Equatable {
  const NavigationBarEvent();

  @override
  List<Object> get props => [];
}

class NavigationBarChangeIndexEvent extends NavigationBarEvent {
  final int index;

  const NavigationBarChangeIndexEvent(this.index);

  @override
  List<Object> get props => [index];
}
