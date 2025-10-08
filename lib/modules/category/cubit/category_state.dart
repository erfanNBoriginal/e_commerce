part of 'category_cubit.dart';

class CategoryState {
  final bool loading;
  final CategoryData? category;
  final List<Product> products;

  CategoryState.init({this.category}) : loading = false, products = [];

  CategoryState({
    required this.loading,
    required this.category,
    required this.products,
  });

  CategoryState copyWith({
    bool? loading,
    CategoryData? category,
    List<Product>? products,
  }) {
    return CategoryState(
      loading: loading ?? this.loading,
      category: category ?? this.category,
      products: products ?? this.products,
    );
  }
}
