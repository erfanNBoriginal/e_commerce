import 'package:bloc/bloc.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/domains/repository.dart';
import 'package:meta/meta.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  final Repository _repository;

  StoreCubit({required Repository repo})
    : _repository = repo,
      super(StoreState.initial()) {
    onInit();
  }

  //events

  Future<void> onInit() async {
    emit(state.copywith(loading: true));

    final newRes = await _repository.getNewProducts();
    final salesRes = await _repository.getSaleProducts();

    emit(
      state.copywith(
        salesProducts: salesRes,
        newProducts: newRes,
        loading: false,
      ),
    );

    // _repository.ge
  }

  //functions
}
