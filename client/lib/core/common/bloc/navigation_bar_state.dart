part of 'navigation_bar_bloc.dart';

sealed class NavigationBarState extends Equatable {
  const NavigationBarState();

  @override
  List<Object> get props => [];
}

final class NavigationBarInitial extends NavigationBarState {}

class NavigationBarChangeIndexState extends NavigationBarState {
  final int currentIndex;

  const NavigationBarChangeIndexState(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}
