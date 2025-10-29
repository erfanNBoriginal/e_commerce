

part of 'checkout_cubit.dart';

class CheckoutState  {
  final bool loading;
  final bool cardLoading;
  final bool addressLoading;
  final List<BagItem> bagItems;
  final List<Address> shippingAdresses;
  final List<BankCard> banckCards;
  final List<Delivery> deliveryMethods;
  final BankCard? selectedCard ;
  final Delivery? selectedDeliveryMethod ;
  final Address? selectedAddress ;

  CheckoutState({
    required this.loading, 
    required this.addressLoading, 
    required this.cardLoading, 
    required this.selectedAddress, 
    required this.selectedCard, 
    required this.selectedDeliveryMethod, 
    required this.shippingAdresses, 
    required this.deliveryMethods, 
    required this.banckCards, 
    required this.bagItems
  });

CheckoutState.init({List<BagItem>? products }) :
 bagItems =products ?? [], 
 selectedAddress = null,
 selectedDeliveryMethod = null,
 selectedCard = null,
 loading = false,
 addressLoading = false,
 cardLoading = false,
 deliveryMethods =[], 
 banckCards =[] ,
shippingAdresses = [];

CheckoutState copyWith({
   List<BagItem>? bagItems,
   bool? loading,
   bool? addressLoading,
   bool? cardLoading,
   BankCard? selectedCard,
   Delivery? selectedDeliveryMethod ,
   Address? selectedAddress ,
 List<Address>? shippingAdresses,
 List<BankCard>? banckCards,
 List<Delivery>? deliveryMethods
}){
  return CheckoutState(
    shippingAdresses: shippingAdresses ?? this.shippingAdresses ,
    cardLoading: cardLoading ?? this.cardLoading ,
    selectedCard: selectedCard ?? this.selectedCard ,
    addressLoading: addressLoading ?? this.addressLoading ,
    selectedDeliveryMethod: selectedDeliveryMethod ?? this.selectedDeliveryMethod ,
    selectedAddress: selectedAddress ?? this.selectedAddress ,
    loading: loading ?? this.loading ,
   deliveryMethods: deliveryMethods ?? this.deliveryMethods,
    banckCards: banckCards??this.banckCards,
     bagItems: bagItems??this.bagItems );
}


 int get getTotal {
   int temp = 0 ;
    bagItems.forEach((bagItem) {
      temp += bagItem.product.price * bagItem.count;
    } );
return temp;
}

}