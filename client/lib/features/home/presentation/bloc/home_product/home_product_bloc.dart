// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/core/resources/data_state.dart';
import 'package:client/features/home/domain/entities/home_product_response_entity.dart';
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
    on<HomeProductPageUpdateEvent>((event, emit) async {
      emit(HomeProductLoadingState());
      // try {
      await _allCategoriesUsecase().then(
        (allCategoriesDataState) async {
          if (allCategoriesDataState is DataSuccess &&
              allCategoriesDataState.data!.isNotEmpty) {
            final allCategories = allCategoriesDataState.data;
            await _byCategoryUsecase(params: allCategories![event.index]).then(
              (byCategoryDataState) {
                if (byCategoryDataState is DataSuccess &&
                    byCategoryDataState.data!.isNotEmpty) {
                  final product = byCategoryDataState.data;
                  emit(HomeProductDoneState(
                      categories: allCategories.sublist(0, 5),
                      index: event.index,
                      products: product));
                }
              },
            );
          }
        },
      );
      // } catch (e) {
      //   emit(HomeProductErrorState(e.toString()));
      // }
    });
  }
}
