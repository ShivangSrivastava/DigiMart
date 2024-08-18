// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/core/resources/data_state.dart';
import 'package:client/features/home/domain/usecases/home_product_get_all_categories_usecase.dart';
import 'package:client/features/home/domain/usecases/home_product_get_by_category_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_product_event.dart';
part 'home_product_state.dart';

class HomeProductBloc extends Bloc<HomeProductEvent, HomeProductState> {
  final HomeProductGetAllCategoriesUsecase _allCategoriesUsecase;
  final HomeProductGetByCategoryUsecase _byCategoryUsecase;
  HomeProductBloc(
    this._allCategoriesUsecase,
    this._byCategoryUsecase,
  ) : super(HomeProductInitial()) {
    on<HomeProductPageInitEvent>((event, emit) async {
      final allCategoriesDataState = await _allCategoriesUsecase();
      if (allCategoriesDataState is DataSuccess &&
          allCategoriesDataState.data!.isNotEmpty) {
        emit(HomeProductDoneState(allCategoriesDataState.data!));
      }
    });
    on<HomeProductChangeCategoryEvent>(
      (event, emit) {
        print(event.currentIndex);
        
        emit(HomeProductChangeCategoryState(event.currentIndex));
      },
    );
  }
}
