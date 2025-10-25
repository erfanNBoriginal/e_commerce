import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/domains/bag_repo.dart';
import 'package:e_commerce/domains/models/bag_item.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/domains/models/promod_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

part 'bag_state.dart';

class BagCubit extends Cubit<BagState> {
  final BagRepo _repo;
  Timer? updateTimer;
  final TextEditingController textCtrl = TextEditingController();
  BagCubit({required BagRepo repository})
    : _repo = repository,
      super(BagState.init()) {
    onInit();
  }
  //////// Functions

  Future<BagItem?> check(BagItem item) async {
    // final repotemp = await _repo.getBagItems();
    final repotemp = state.bagItems;
    final result =
        repotemp
            .where(
              (e) =>
                  e.product == item.product &&
                  e.color == item.color &&
                  e.size == item.size,
            )
            .firstOrNull;
    return result;
  }

  ///////// Events

  void onInit() async {
    emit(state.copyWith(loading: true));
    final resBagItems = await _repo.getBagItems();
    final codes = await _repo.getPromoCodes();
    emit(
      state.copyWith(promoCodes: codes, bagItems: resBagItems, loading: false),
    );
  }

  void onRefresh() async {
    print('state.selectedCode');
    print(state.selectedCode?.name);
    final resBagItems = await _repo.getBagItems();
    final codes = await _repo.getPromoCodes();
    emit(
      state.copyWith(
        promoCodes: codes,
        bagItems: resBagItems,
        selectedCode: state.selectedCode,
      ),
    );

    print('state.selectedCode afterrr');
    print(state.selectedCode?.name);
  }

  //
  void onColorSelected({required Product product, required Color color}) {
    var tempItem = state.bagItem;
    if (tempItem != null) {
      final tempSize = tempItem.size;
      tempItem = BagItem(product: product, color: color, size: tempSize);
    } else {
      tempItem = BagItem(product: product, color: color);
    }
    emit(state.copyWith(bagItem: tempItem));
  }
  // void onColorSelected({required Product product, required Color color}) {
  //   List<BagItem> temp = [...state.bagItems];
  //   final tempItem = temp.where((e) => e.product == product).firstOrNull;
  //   if (tempItem != null) {
  //     final tempSize = tempItem.size;
  //     temp.add(BagItem(product: product, color: color, size: tempSize));
  //     temp.remove(tempItem);
  //   } else {
  //     temp.add(BagItem(product: product, color: color));
  //   }
  //   emit(state.copyWith(bagItems: temp));
  // }

  //
  void onSizeSelected({required Product product, required String size}) {
    var tempItem = state.bagItem;
    if (tempItem != null) {
      final tempColor = tempItem.color;
      tempItem = BagItem(color: tempColor, product: product, size: size);
    } else {
      tempItem = BagItem(product: product, size: size);
    }
    emit(state.copyWith(bagItem: tempItem));
  }
  // void onSizeSelected({required Product product, required String size}) {
  //   List<BagItem> temp = [...state.bagItems];
  //   final tempItem = temp.where((e) => e.product.id == product.id).firstOrNull;
  //   if (tempItem != null) {
  //     final tempColor = tempItem.color;
  //     temp.add(BagItem(color: tempColor, product: product, size: size));
  //     temp.remove(tempItem);
  //   } else {
  //     temp.add(BagItem(product: product, size: size));
  //   }
  //   emit(state.copyWith(bagItems: temp));
  // }

  Future<void> onAddedToCart(BagItem? item) async {
    // emit(state.copyWith(loading: true));
    // List<BagItem> repotemp = await _repo.getBagItems();
    List<BagItem> repotemp = state.bagItems;

    // final tempList = [...state.bagItems];
    if (item == null) {
      toast('please select size and color');
    } else {
      if (item.color == null || item.size == null) {
        toast('please select size or color');
      } else {
        final res = await check(item);
        // if (state.bagItems.any(test))
        if (res != null) {
          final tempitem = res;
          //if (tempitem.count != 0)
          repotemp.remove(res);
          repotemp.add(
            BagItem(
              product: tempitem.product,
              color: tempitem.color,
              size: tempitem.size,
              count: tempitem.count + 1,
            ),
          );
          // repotemp = [...tempList];
          print('count ${tempitem.product.title}');
          print(tempitem.count + 1);
          print('same product but  more');
          emit(state.copyWith(bagItems: repotemp));
        } else {
          // tempList.add(item);
          repotemp.add(item);
          emit(state.copyWith(bagItems: repotemp));
        }
        print('state.bagItems.length');
        // emit(state.copyWith(bagItems: tempList));
        print(state.bagItems.length);
        await _repo.addToBag(repotemp);
        toast('product added successfully');
      }
    }
    // await Future.delayed(Duration(seconds: 6));
    emit(state.copyWith(loading: false));
  }

  Future<bool> applyPromodCode(PromodCode code) async {
    emit(state.copyWith(selectedCode: code, loading: true));
    await Future.delayed(Duration(milliseconds: 1000));
    textCtrl.text = code.name;
    emit(state.copyWith(loading: false));
    return true;
  }

  @override
  Future<void> close() {
    updateTimer?.cancel();
    return super.close();
  }
}
