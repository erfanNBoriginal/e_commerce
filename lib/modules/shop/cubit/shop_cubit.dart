import 'package:bloc/bloc.dart';
import 'package:e_commerce/domains/models/category_data.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/domains/shop_repo.dart';
import 'package:meta/meta.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  final ShopRepo _repo;

  ShopCubit({required ShopRepo repo}) : _repo = repo, super(ShopState.init()) {
    oninit();
  }

  //Events

  Future<void> oninit() async {
    emit(state.copyWith(loading: true));
    final catRes = await _repo.getCategories();
    final productsRes = await _repo.getProducts();
    print('catRes.length');
    print(catRes.length);
    emit(
      state.copyWith(loading: false, products: productsRes, categories: catRes),
    );
  }

  //Functions
}
