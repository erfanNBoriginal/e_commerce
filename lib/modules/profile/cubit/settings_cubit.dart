import 'package:bloc/bloc.dart';
import 'package:e_commerce/domains/models/address.dart';
import 'package:e_commerce/domains/models/bank_card.dart';
import 'package:e_commerce/domains/models/order.dart';
import 'package:e_commerce/domains/models/profile.dart';
import 'package:e_commerce/domains/models/promod_code.dart';
import 'package:e_commerce/domains/settings_repo.dart';
import 'package:overlay_support/overlay_support.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  
  final SettingsRepo _repo;

  SettingsCubit({required SettingsRepo repo}):
  _repo = repo, 
  super(SettingsState.init()){
    onInit();
  }
  
  
void onInit() async{
  emit(state.copyWith(loading: true));
final res = await _repo.getProfile();
emit(state.copyWith(profile: res,loading: false));

}

void onOrderStatusChanged(OrderStatus order){
  emit(state.copyWith(orderStatus: order ));
}


Future<bool> onSubmitted(Order order) async{
  emit(state.copyWith(loading: true));
await _repo.addOrder(order);
  emit(state.copyWith(loading: false));
  toast('Orderes submitted');
  return true;
}

}