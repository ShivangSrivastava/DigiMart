part of 'home_product_bloc.dart';

sealed class HomeProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class HomeProductInitial extends HomeProductState {}

final class HomeProductLoadingState extends HomeProductState {}

final class HomeProductDoneState extends HomeProductState {
  final List<String>? categories;
  final int? index;
  final List<HomeProductResponseEntity>? products;
  HomeProductDoneState(
      {required this.categories, required this.products, required this.index});
}

final class HomeProductErrorState extends HomeProductState {
  final String error;

  HomeProductErrorState(this.error);
}
