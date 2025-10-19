part of 'favorite_cubit.dart';

class FavoriteState {
  final List<Favorite> favorites;
  final Favorite? favorite;
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
  final List<String> sortFilters;
  final int selectedSortFilter;
  final String selectedSortCategory;
  final bool loading;
  FavoriteState({
    required this.selectedColors,
    required this.minValue,
    required this.maxValue,
    required this.colors,
    required this.sizes,
    required this.selectedSizes,
    required this.categories,
    required this.brands,
    required this.selectedCategory,
    required this.selectedBrands,
    required this.sortFilters,
    required this.selectedSortFilter,
    required this.selectedSortCategory,
    required this.loading,
    required this.favorite,
    required this.favorites,
  });

  FavoriteState.init()
    : selectedBrands = [],
      brands = [],
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
      favorite = null,
      loading = false,
      favorites = [];

  FavoriteState copyWith({
    bool? loading,
    List<Favorite>? favorites,
    List<Favorite>? products,
    List<String>? selectedSizes,
    List<String>? sizes,
    Favorite? favorite,
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
    return FavoriteState(
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
      favorites: favorites ?? this.favorites,
      favorite: favorite,
    );
  }
}
