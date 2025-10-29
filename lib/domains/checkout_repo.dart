import 'package:e_commerce/domains/models/address.dart';
import 'package:e_commerce/domains/models/bag_item.dart';
import 'package:e_commerce/domains/models/bank_card.dart';
import 'package:e_commerce/domains/models/delivery.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class CheckoutRepo {
  
List<BagItem> items = [];
List<BankCard> cards = [];
List<Address> addresses = [
  Address(name: 'name', region:' region', address:' address', city: 'city', zipCode: 11)
];
List<Delivery> deliveryMethods= [
  Delivery(days: '4-5',
   name: 'tipax',
    image: U.Icons.tipax),
  Delivery(days: '5-6',
   name: 'post',
    image: U.Icons.post)
];
Future<List<BagItem>> getCheckoutItems() async{
 await Future.delayed(Duration(milliseconds: 100));
  return items;
}

Future<void> onCardAdded(BankCard card) async{
 await Future.delayed(Duration(milliseconds: 100));
cards.add(card);
}
Future<void> onAddressAdded(Address address) async{
 await Future.delayed(Duration(milliseconds: 100));
addresses.add(address);
}

Future<void> onAddressUpdated({required Address address,required int index}) async{
 await Future.delayed(Duration(milliseconds: 100));
 addresses.removeAt(index);
addresses.insert(index,address);
}


Future<List<BankCard>> getCards() async{
 await Future.delayed(Duration(milliseconds: 100));

return cards;
}

Future<List<Address>> getAdresses() async{
 await Future.delayed(Duration(milliseconds: 100));

  return addresses;
}

Future<List<Delivery>> getDelivery() async{
 await Future.delayed(Duration(milliseconds: 100));

  return deliveryMethods;
}

}