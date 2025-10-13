part of 'category_cubit.dart';

class CategoryState {
  final bool loading;
  final int minValue;
  final int maxValue;
  final List<Color> colors;
  final List<Color> selectedColors;
  final List<String> sizes;
  final List<String> selectedSizes;
  final List<String> categories;
  final List<String>? brands;
  final String selectedCategory;
  final List<String> selectedBrands;
  final CategoryData? category;
  final List<String> sortFilters;
  final int selectedSortFilter;
  final String selectedSortCategory;
  final List<Product> products;

  CategoryState.init({this.category, this.brands})
    : selectedBrands = [],
      categories = [],
      selectedCategory = '',
      selectedSortFilter = 2,
      selectedColors = [],
      selectedSizes = [],
      colors = [],
      sizes = [],
      minValue = 0,
      maxValue = 500,
      selectedSortCategory = '',
      sortFilters = [
        'Newest',
        'Price: Low to High',
        'Price: High to Low',
        'Rating: High to Low',
      ],
      loading = false,
      products = [];

  CategoryState({
    required this.selectedSortFilter,
    required this.minValue,
    required this.maxValue,
    required this.colors,
    required this.selectedColors,
    required this.sizes,
    required this.categories,
    required this.selectedCategory,
    required this.selectedSizes,
    required this.brands,
    required this.selectedBrands,
    required this.sortFilters,
    required this.selectedSortCategory,
    required this.loading,
    required this.category,
    required this.products,
  });

  CategoryState copyWith({
    bool? loading,
    CategoryData? category,
    List<Product>? products,
    List<String>? selectedSizes,
    List<String>? sizes,
    List<String>? categories,
    List<String>? brands,
    List<Color>? colors,
    List<Color>? selectedColors,
    int? minValue,
    int? selectedSortFilter,
    int? maxValue,
    List<String>? selectedBrands,
    List<String>? sortFilters,
    String? selectedSortCategory,
    String? selectedCategory,
  }) {
    return CategoryState(
      minValue: minValue ?? this.minValue,
      categories: categories ?? this.categories,
      selectedSortFilter: selectedSortFilter ?? this.selectedSortFilter,
      maxValue: maxValue ?? this.maxValue,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      colors: colors ?? this.colors,
      selectedColors: selectedColors ?? this.selectedColors,
      sizes: sizes ?? this.sizes,
      selectedSizes: selectedSizes ?? this.selectedSizes,
      brands: brands ?? this.brands,
      selectedBrands: selectedBrands ?? this.selectedBrands,
      loading: loading ?? this.loading,
      sortFilters: sortFilters ?? this.sortFilters,
      selectedSortCategory: selectedSortCategory ?? this.selectedSortCategory,
      category: category ?? this.category,
      products: products ?? this.products,
    );
  }
}
