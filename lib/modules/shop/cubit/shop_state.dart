part of 'shop_cubit.dart';

class ShopState {
  final List<CategoryData> categories;
  final bool loading;
  final List<Product> products;
  ShopState.init() : products = [], loading = false, categories = [];

  ShopState({
    required this.products,
    required this.loading,
    required this.categories,
  });

  ShopState copyWith({
    List<CategoryData>? categories,
    List<Product>? products,
    bool? loading,
  }) {
    return ShopState(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      loading: loading ?? this.loading,
    );
  }
}
