import 'package:e_commerce/domains/models/address.dart';
import 'package:e_commerce/domains/models/bag_item.dart';
import 'package:e_commerce/domains/models/bank_card.dart';
import 'package:e_commerce/domains/models/delivery.dart';
import 'package:e_commerce/domains/models/promod_code.dart';

enum OrderStatus {
  delivered,
  processing,
  cancelled
}

class Order {

final List<BagItem> products ;
final String date ;
final OrderStatus orderStatus ;
final String trackingNumber ;
final Address address ;
final BankCard bankCard;
final PromodCode? discount ;
final int totalAmount ;
final Delivery delivery ;

Order(
 {
  required  this.orderStatus,
required  this.products,
required  this.trackingNumber,
required  this.date,
required    this.address,
required     this.bankCard,
      this.discount,
required       this.totalAmount, 
required  this.delivery,
 });

}