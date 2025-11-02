import 'package:e_commerce/domains/models/address.dart';
import 'package:e_commerce/domains/models/bank_card.dart';
import 'package:e_commerce/domains/models/order.dart';
import 'package:e_commerce/domains/models/promod_code.dart';

class Profile {

final String image ;
final String name ;
final String email ;
final List<Order> orderedItems;
final List<Address> addresses;
final List<PromodCode> promoCodes;
final List<BankCard> bankCards;
 Profile({
  required this.bankCards,
  required this.addresses,
  required this.promoCodes,
 required this.image,
 required  this.name,
 required   this.email,
 required    this.orderedItems});

}
