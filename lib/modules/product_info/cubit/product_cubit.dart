import 'package:bloc/bloc.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final Product product;
  ProductCubit({required this.product}) : super(ProductState.initial());

  onProductSizeChanged(String size) {
    emit(state.copyWith(selectedSize: size));
    print(state.selectedSize);
  }
}
