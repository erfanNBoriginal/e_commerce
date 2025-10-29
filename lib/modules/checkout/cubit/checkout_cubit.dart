import 'package:bloc/bloc.dart';
import 'package:e_commerce/domains/checkout_repo.dart';
import 'package:e_commerce/domains/models/address.dart';
import 'package:e_commerce/domains/models/bag_item.dart';
import 'package:e_commerce/domains/models/bank_card.dart';
import 'package:e_commerce/domains/models/delivery.dart';
import 'package:flutter/cupertino.dart';
import 'package:overlay_support/overlay_support.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  
  final CheckoutRepo _repo;

  final TextEditingController nameCtrl = TextEditingController() ;
  final TextEditingController bankNameCtrl = TextEditingController() ;
  final TextEditingController numberkCtrl = TextEditingController() ;
  final TextEditingController expireCtrl = TextEditingController() ;
  final TextEditingController cvvCtrl = TextEditingController() ;
  
  CheckoutCubit({
    List<BagItem>? products,
    required CheckoutRepo repo
  }) :
  _repo = repo,
   super(CheckoutState.init(
    products: products
   )){
    onInit();
   }
/////////events
      void onInit()  async{
        emit(state.copyWith(loading: true));
            final adrdes =     await _repo.getAdresses();
           final deliveryRes = await _repo.getDelivery();
           final cardRes =     await _repo.getCards();
           final itemsRes =    await _repo.getCheckoutItems();
            emit(state.copyWith(
              shippingAdresses: adrdes,
              selectedAddress: adrdes.firstOrNull,
              bagItems: state.bagItems.isEmpty ? itemsRes : state.bagItems  ,
              selectedCard: cardRes.firstOrNull,
              loading: false,
              banckCards: cardRes,
              deliveryMethods: deliveryRes));
      }

Future<bool> onCardAdded(BankCard card) async{
final temp = [...state.banckCards];
temp.add(card);
emit(state.copyWith(banckCards: temp,selectedCard: card,cardLoading: true ));
_repo.onCardAdded(card);
emit(state.copyWith(cardLoading: false));
toast('card added');
print('state.banckCards');
print(state.banckCards);
return true;

}

void onDeliverySelected(Delivery delivery){
  emit(state.copyWith(selectedDeliveryMethod: delivery));
}

void  onShippingAddressSelected(Address address){
  if(state.selectedAddress != address)
{
  emit(state.copyWith(selectedAddress: address));
}
}

void onBankCardSelected(BankCard card){
  if(state.selectedCard != card){
  emit(state.copyWith(selectedCard: card));

  }
}

Future<bool> onAddressEdited(Address address)async{
  emit(state.copyWith(addressLoading: true));
final tempList = [...state.shippingAdresses];
final temp = state.shippingAdresses.indexWhere((e)=> e.address==address.address );
tempList.removeAt(temp);
tempList.insert(temp,address);
_repo.onAddressUpdated(index: temp,address: address);
emit(state.copyWith(selectedAddress: address,shippingAdresses: tempList,addressLoading: false));
return true;
}


 Future<bool> onShippingAddressAdded(Address address) async{
emit(state.copyWith(addressLoading: true));
print('state.addressLoading');
print(state.addressLoading);
final temp = [...state.shippingAdresses];
temp.add(address);
  await _repo.onAddressAdded(address);
  emit(state.copyWith(selectedAddress: address,
  addressLoading: false,
  shippingAdresses: temp));
 return true;
 }

/////////functions

}