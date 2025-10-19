import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/domains/favorite_repo.dart';
import 'package:e_commerce/domains/models/favorite.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:meta/meta.dart';
import 'package:overlay_support/overlay_support.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo _repo;

  FavoriteCubit({required FavoriteRepo repo})
    : _repo = repo,
      super(FavoriteState.init()) {
    print('state.favorites.length');
    print(state.favorites.length);
    onInit();
  }

  ////////Functions//////////

  ////////events//////////

  void onInit() async {
    emit(state.copyWith(loading: true));
    final colors = await _repo.getColors();
    final sizes = await _repo.getSizes();
    final brands = await _repo.getBrands();
    final categories = await _repo.getAllCategories();
    final res = await _repo.getFavorites();
    emit(
      state.copyWith(
        favorites: res,
        loading: false,
        categories: categories,
        brands: brands,
        sizes: sizes,
        colors: colors,
      ),
    );
  }

  void onRefresh() async {
    emit(state.copyWith(loading: true));
    final res = await _repo.getFavorites();
    emit(state.copyWith(favorites: res, loading: false));
  }

  bool onSizeSelected({required String size, required Product item}) {
    emit(state.copyWith(favorite: Favorite(product: item, size: size)));
    return true;
  }

  void onBrandSelected(String brand) {
    final selectedBrands = [...state.selectedBrands];
    if (selectedBrands.contains(brand)) {
      selectedBrands.remove(brand);
    } else {
      selectedBrands.add(brand);
    }
    emit(state.copyWith(selectedBrands: selectedBrands));
  }

  void onPriceRangeChanged(double min, double max) {
    emit(state.copyWith(minValue: min.round(), maxValue: max.round()));
  }

  void onCategorySelected(String category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void onSizeChanged(String size) {
    // final selectedSizes = List<String>.from(state.selectedSizes);
    final selectedSizes = [...state.selectedSizes];
    if (selectedSizes.contains(size)) {
      selectedSizes.remove(size);
    } else {
      selectedSizes.add(size);
    }
    emit(state.copyWith(selectedSizes: selectedSizes));
  }

  void onBrandsDiscarded() {
    emit(state.copyWith(selectedBrands: []));
  }

  void onFiltersDiscarded() {
    emit(
      state.copyWith(
        selectedColors: [],
        selectedCategory: '',
        selectedSizes: [],
        selectedBrands: [],
        minValue: 0,
        maxValue: 500,
      ),
    );
  }

  void onColorChanged(Color color) {
    // final selectedColors = List<Color>.from(state.selectedColors);
    final selectedColors = [...state.selectedColors];
    if (selectedColors.contains(color)) {
      selectedColors.remove(color);
    } else {
      selectedColors.add(color);
    }
    emit(state.copyWith(selectedColors: selectedColors));
  }

  void onSortPressed(int selected, {required String title}) async {
    emit(state.copyWith(loading: true));
    emit(
      state.copyWith(selectedSortFilter: selected, selectedSortCategory: title),
    );
    // final resProducts = await _repo.getProducts(id: id, sortId: selected);
    final res = await _repo.getFavorites(
      minvalue: state.minValue,
      maxValue: state.maxValue,
      sortId: selected,
      colors: state.selectedColors,
      sizes: state.selectedSizes,
      brands: state.selectedBrands,
    );
    emit(state.copyWith(products: res, loading: false));
  }

  Future<bool> onFilterApplied() async {
    emit(state.copyWith(loading: true));
    await Future.delayed(const Duration(seconds: 1));
    final res = await _repo.getFavorites(
      category: state.selectedCategory,
      minvalue: state.minValue,
      maxValue: state.maxValue,
      sortId: state.selectedSortFilter,
      colors: state.selectedColors,
      sizes: state.selectedSizes,
      brands: state.selectedBrands,
    );
    emit(state.copyWith(favorites: res));
    emit(state.copyWith(loading: false));
    return true;
  }

  Future<bool> onColorSelected(Color color) async {
    final fav = Favorite(
      product: state.favorite!.product,
      color: color,
      size: state.favorite!.size,
    );
    final temp = [...state.favorites];
    temp.add(fav);
    await _repo.updateFavorites(temp);
    emit(state.copyWith(favorites: temp));
    toast('product added to favorites');
    print(state.favorites.length);
    return true;
  }

  void onProductRemoved(Product product) {
    final tempList = [...state.favorites];
    final temp = state.favorites.indexWhere((e) => e.product == product);
    tempList.removeAt(temp);
    emit(state.copyWith(favorites: tempList));
    _repo.updateFavorites(state.favorites);
  }

  void changeFav() {
    emit(state.copyWith(favorite: null));
  }
}
