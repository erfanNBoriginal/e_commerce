part of 'product_cubit.dart';

class ProductState {
  final Product? product;
  // final List<String> sizes;
  final String? selectedSize;

  ProductState({
    required this.product,
    required this.selectedSize,
    // required this.sizes,
  });
  ProductState.initial({this.product}) : selectedSize = '';
  //  sizes = [];

  ProductState copyWith({Product? product, String? selectedSize}) {
    return ProductState(
      product: product ?? this.product,
      selectedSize: selectedSize ?? this.selectedSize,
    );
  }
}
