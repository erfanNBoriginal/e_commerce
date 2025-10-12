part of 'product_cubit.dart';

class ProductState {
  final Product? product;
  final bool loading;
  ProductState({required this.product, required this.loading});
  ProductState.initial({this.product}) : loading = false;

  ProductState copyWith({Product? product, bool? loading}) {
    return ProductState(
      product: product ?? this.product,
      loading: loading ?? this.loading,
    );
  }
}
