part of 'home_product_bloc.dart';

sealed class HomeProductEvent extends Equatable {
  const HomeProductEvent();

  @override
  List<Object> get props => [];
}

class HomeProductPageInitEvent extends HomeProductEvent {}

class HomeProductChangeCategoryEvent extends HomeProductEvent {
  final int currentIndex;
  const HomeProductChangeCategoryEvent(this.currentIndex);
}
