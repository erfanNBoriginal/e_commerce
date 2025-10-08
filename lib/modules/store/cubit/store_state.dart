part of 'store_cubit.dart';

class StoreState {
  final List<Product> salesProducts;
  final List<Product> newProducts;
  final bool loading;
  StoreState({
    required this.loading,
    required this.newProducts,
    required this.salesProducts,
  });

  StoreState.initial() : loading = false, newProducts = [], salesProducts = [];

  StoreState copywith({
    List<Product>? salesProducts,
    List<Product>? newProducts,
    bool? loading,
  }) {
    return StoreState(
      loading: loading ?? this.loading,

      newProducts: newProducts ?? this.newProducts,
      salesProducts: salesProducts ?? this.salesProducts,
    );
  }
}
