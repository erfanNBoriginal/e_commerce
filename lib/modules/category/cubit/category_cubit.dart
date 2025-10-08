import 'package:bloc/bloc.dart';
import 'package:e_commerce/domains/models/category_data.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/domains/shop_repo.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final ShopRepo _repo;
  final int id;
  final CategoryData? initial;
  CategoryCubit({this.initial, required this.id, required ShopRepo repo})
    : _repo = repo,
      super(CategoryState.init(category: initial)) {
    onInit();
  }

  /////////functions

  /////////events

  Future<void> onInit() async {
    emit(state.copyWith(loading: true));
    final res = await _repo.getCategory(id);
    final resProducts = await _repo.getProducts(id: id);
    emit(state.copyWith(category: res, products: resProducts, loading: false));
  }
}
