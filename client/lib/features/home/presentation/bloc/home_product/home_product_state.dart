part of 'home_product_bloc.dart';

sealed class HomeProductState extends Equatable {
  final List<String>? allCategories;
  final int currentIndex;
  const HomeProductState({this.allCategories, this.currentIndex = 0});
  @override
  List<Object?> get props => [allCategories!, currentIndex];
}

final class HomeProductInitial extends HomeProductState {}

final class HomeProductLoadingState extends HomeProductState {}

final class HomeProductDoneState extends HomeProductState {
  const HomeProductDoneState(List<String> allCategories)
      : super(allCategories: allCategories);
}

final class HomeProductChangeCategoryState extends HomeProductState {
  const HomeProductChangeCategoryState(int currentIndex)
      : super(currentIndex: currentIndex);
}

final class HomeProductErrorState extends HomeProductState {}
