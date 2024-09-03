part of 'home_product_bloc.dart';

sealed class HomeProductEvent extends Equatable {
  const HomeProductEvent();

  @override
  List<Object> get props => [];
}

class HomeProductPageUpdateEvent extends HomeProductEvent {
  final int index;

  const HomeProductPageUpdateEvent({this.index = 0});
}
