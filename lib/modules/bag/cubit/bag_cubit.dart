import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/domains/bag_repo.dart';
import 'package:e_commerce/domains/models/bag_item.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';
import 'package:overlay_support/overlay_support.dart';

part 'bag_state.dart';

class BagCubit extends Cubit<BagState> {
  final BagRepo _repo;

  BagCubit({required BagRepo repository})
    : _repo = repository,
      super(BagState.init()) {
    onInit();
  }
  //////// Functions

  Future<int> check(BagItem item) async {
    // if (item.count == 0) {
    //   return -1;
    // }
    final repotemp = await _repo.getBagItems();
    final result = repotemp.indexWhere(
      (e) =>
          e.product == item.product &&
          e.color == item.color &&
          e.size == item.size,
      // &&
      // item.count != 0,
    );
    print('checkkk');
    print(result);
    return result;
  }

  ///////// Events

  // Future<void> onRefresh() async {
  //   final res = _repo.getTempItems();
  //   emit(state.copyWith(bagItems: res, loading: false));
  // }
  Future<void> onRefresh() async {
    emit(state.copyWith(loading: true));
    final resBagItems = await _repo.getBagItems();
    emit(state.copyWith(bagItems: resBagItems, loading: false));
  }

  void onInit() async {
    emit(state.copyWith(loading: true));
    // final res = _repo.getTempItems();
    final resBagItems = await _repo.getBagItems();
    // print(res.length);
    emit(state.copyWith(bagItems: resBagItems, loading: false));
  }

  //
  void onColorSelected({required Product product, required Color color}) {
    List<BagItem> temp = [...state.bagItems];
    final tempItem = temp.where((e) => e.product == product).firstOrNull;
    if (tempItem != null) {
      final tempSize = tempItem.size;
      temp.add(BagItem(product: product, color: color, size: tempSize));
      temp.remove(tempItem);
    } else {
      temp.add(BagItem(product: product, color: color));
    }
    emit(state.copyWith(bagItems: temp));
    print(
      '${state.bagItems[0].size} ${state.bagItems[0].count} ${state.bagItems[0].product.title}',
    );
    // _repo.addTempItems(state.bagItems);
  }

  //
  void onSizeSelected({required Product product, required String size}) {
    List<BagItem> temp = [...state.bagItems];
    final tempItem = temp.where((e) => e.product.id == product.id).firstOrNull;
    if (tempItem != null) {
      final tempColor = tempItem.color;
      temp.add(BagItem(color: tempColor, product: product, size: size));
      temp.remove(tempItem);
    } else {
      temp.add(BagItem(product: product, size: size));
    }

    emit(state.copyWith(bagItems: temp));
    print(
      '${state.bagItems[0].size} ${state.bagItems[0].count} ${state.bagItems[0].product.title}',
    );
    // _repo.addTempItems(state.bagItems);
  }

  Future<void> onAddedToCart(BagItem? item) async {
    final repotemp = _repo.getBagItems();
    final tempList = [...state.bagItems];
    if (item == null) {
      toast('please select size and color');
    } else {
      if (item.color == null || item.size == null) {
        toast('please select size or color');
      } else {
        final res = await check(item);
        // if (state.bagItems.any(test))
        // if (res != -1) {
        final tempitem = tempList.elementAt(res);

        //if (tempitem.count != 0)
        tempList.removeAt(res);
        tempList.add(
          BagItem(
            product: tempitem.product,
            color: tempitem.color,
            size: tempitem.size,
            count: tempitem.count + 1,
          ),
        );
        print('count ${tempitem.product.title}');
        print(tempitem.count + 1);
        print('same product but  more');
        // } else {
        //   tempList.add(item);
        // }
        print('state.bagItems.length');
        emit(state.copyWith(bagItems: tempList));
        print(state.bagItems.length);
        await _repo.addToBag(state.bagItems);
        toast('product added successfully');
      }
    }
  }
}
