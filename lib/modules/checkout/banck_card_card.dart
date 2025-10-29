import 'package:e_commerce/domains/models/bank_card.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class BanckCardCard extends StatelessWidget {
  final BankCard card;
  
  const BanckCardCard({
    required this.card,
    super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      padding: EdgeInsets.all(20),
      height: 224,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.green,
          Colors.greenAccent,
        ]),
        color: U.Theme.gray,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            U.Text(card.bankName),Spacer()
          ],),
          SizedBox(height: 20,),
            U.Text(card.name),
          SizedBox(height: 20,),
            Center(child: U.Text(
              fontSize: U.TextSize.s24,
              weight: U.TextWeight.semiBold,
              card.id.toString())),
          SizedBox(height: 25,),
          Row(children: [
            U.Text('cvv: ${card.cvv.toString()}'),
            Spacer(),
            U.Text('${card.expire.toString()} expire date:'),

          ],)    

        ],
      ) ,
    );
  }
}