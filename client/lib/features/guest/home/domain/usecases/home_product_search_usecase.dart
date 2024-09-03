import 'package:client/core/core_export.dart';
import 'package:client/features/guest/guest_export.dart';

class HomeProductSearchUsecase
    implements UseCase<DataState<List<HomeProductResponseEntity>>, String?> {
  final HomeProductRepository _homeProductRepository;

  HomeProductSearchUsecase(this._homeProductRepository);

  @override
  Future<DataState<List<HomeProductResponseEntity>>> call({String? params}) {
    return _homeProductRepository.search(searchText: params!);
  }
}
