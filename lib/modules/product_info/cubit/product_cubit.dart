import 'package:bloc/bloc.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/domains/shop_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final int? id;
  final ShopRepo _repo;
  final Product? product;
  ProductCubit({required ShopRepo repo, this.id, this.product})
    : _repo = repo,
      super(ProductState.initial(product: product)) {
    onInit();
  }

  ///////////functions

  ///////////events
  Future<void> onInit() async {
    if (id != null) {
      emit(state.copyWith(loading: true));
      final productRes = await _repo.getProductById(id!);
      emit(state.copyWith(loading: false, product: productRes));
    }
  }
}
