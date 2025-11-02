import 'package:e_commerce/domains/models/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class OrderCard extends StatelessWidget {
  
  final Order order;

  const OrderCard({
    required this.order,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: U.Card(
        boxShadows: [
           BoxShadow(
       color:  Color.fromARGB(30, 0, 0, 0),
       spreadRadius: 2,
       blurRadius: 15,
       offset:  Offset(0, 0), 
       // ↑ negative Y offset = shadow on top only
     ),
        ],
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                U.Text(order.trackingNumber,weight: U.TextWeight.semiBold,fontSize: U.TextSize.s16,),
                Spacer(),
                U.Text(order.date,weight: U.TextWeight.regular,color: U.Theme.gray,)
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(children: [U.Text('Tracking Number: ',weight: U.TextWeight.regular,color: U.Theme.gray,),
            U.Text('${order.trackingNumber}'),],),
            Row(children: [
            U.Text('Quantity:',weight: U.TextWeight.regular,color: U.Theme.gray),
            SizedBox(width: 10,),
            U.Text(order.products.length.toString(),weight: U.TextWeight.semiBold,fontSize: U.TextSize.s16),
        Spacer(),
            U.Text('Total Amount:',weight: U.TextWeight.regular,color: U.Theme.gray,),
            SizedBox(width: 10,),
            
            U.Text(order.totalAmount.toString(),weight: U.TextWeight.semiBold,fontSize: U.TextSize.s16),
            ],),
            SizedBox(
              height: 15,
            ),
            Row(children: [
              U.OutlineButton(onTap: (){},
               borderType: U.BorderVariants.black,
                size: U.OutlineButtonSize.small,
                 title: 'Details'),
                 Spacer(),
                 U.Text(order.orderStatus.name,color: U.Theme.success)
            ],)
          ],
            
        ),
      ),
    );
  }
}