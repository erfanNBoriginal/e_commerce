import 'package:e_commerce/domains/models/address.dart';
import 'package:e_commerce/domains/models/bag_item.dart';
import 'package:e_commerce/domains/models/bank_card.dart';
import 'package:e_commerce/domains/models/delivery.dart';
import 'package:e_commerce/domains/models/promod_code.dart';

class Order {

final List<BagItem> products ;
final String date ;
final Address address ;
final BankCard bankCard;
final PromodCode discount ;
final int totalAmount ;
final Delivery delivery ;

Order(
 {
required  this.products,
required  this.date,
required    this.address,
required     this.bankCard,
required      this.discount,
required       this.totalAmount, 
required  this.delivery,
 });

}