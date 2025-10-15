import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/domains/models/category_data.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/domains/shop_repo.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final ShopRepo _repo;
  final List<String>? initialBrands;
  final int id;
  final CategoryData? initial;
  CategoryCubit({
    this.initial,
    this.initialBrands,
    required this.id,
    required ShopRepo repo,
  }) : _repo = repo,
       super(CategoryState.init(category: initial, brands: initialBrands)) {
    onInit();
  }

  /////////functions

  /////////events

  void onInit() async {
    emit(state.copyWith(loading: true));
    final colors = await _repo.getColors();
    final categories = await _repo.getAllCategories();
    final sizes = await _repo.getSizes();
    final brands = await _repo.getBrands();
    final res = await _repo.getCategory(id);
    final resProducts = await _repo.getProducts(id: id);
    emit(
      state.copyWith(
        categories: categories,
        category: res,
        brands: brands,
        colors: colors,
        sizes: sizes,
        products: resProducts,
        loading: false,
      ),
    );
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
    final res = await _repo.getProducts(
      id: id,
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
    final res = await _repo.getProducts(
      id: id,
      category: state.selectedCategory,
      minvalue: state.minValue,
      maxValue: state.maxValue,
      sortId: state.selectedSortFilter,
      colors: state.selectedColors,
      sizes: state.selectedSizes,
      brands: state.selectedBrands,
    );
    emit(state.copyWith(products: res));
    emit(state.copyWith(loading: false));
    return true;
  }
}
