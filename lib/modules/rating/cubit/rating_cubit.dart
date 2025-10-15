import 'package:bloc/bloc.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/domains/models/rating.dart';
import 'package:e_commerce/domains/shop_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:overlay_support/overlay_support.dart';
part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  final int id;
  final Product? initialProduct;
  final TextEditingController ctrl = TextEditingController();
  final ShopRepo _repo;
  RatingCubit({required ShopRepo repo, required this.id, this.initialProduct})
    : _repo = repo,
      super(RatingState.init(product: initialProduct)) {
    onInit();
  }

  void onInit() async {
    if (initialProduct == null) {
      emit(state.copyWith(loading: true));
      final res = await _repo.getProductById(id);
      emit(
        state.copyWith(
          loading: false,
          product: res,
          contentStatus:
              res == null
                  ? RatingContentStatus.empty
                  : RatingContentStatus.filled,
        ),
      );
    } else {
      emit(state.copyWith(contentStatus: RatingContentStatus.filled));
    }
  }

  void onStarsSelected(int count) {
    emit(state.copyWith(stars: count + 1));
  }

  void onReviewAdded(String review) {
    print('fucking review');
    print(ctrl.text);
    emit(state.copyWith(review: review));
    // print('state.review');
    // print(state.review);
  }

  Future<bool> onAddReviewPressed(Rating rating) async {
    emit(state.copyWith(loading: true));
    if (state.stars == 0) {
      toast('please rate the product');
      emit(state.copyWith(loading: false));

      return false;
    } else {
      print('rating.rating');
      print(rating.rating);
      final res = await _repo.getProducts();
      final temp = res.indexWhere((e) => e.id == state.product!.id);
      print('indexxx');
      print(temp);
      Product tempPro = state.product!;
      tempPro.ratings.add(rating);
      await _repo.updateProducts(index: temp, product: tempPro);
    }
    emit(state.copyWith(loading: false));
    toast('Review dded sucsessfully');
    return true;
  }
}
