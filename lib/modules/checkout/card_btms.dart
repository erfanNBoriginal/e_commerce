import 'package:e_commerce/domains/models/bank_card.dart';
import 'package:e_commerce/modules/checkout/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CardBottomSheet extends StatelessWidget {
final CheckoutCubit checkoutCubit;
static show(BuildContext context,{
  required CheckoutCubit checkoutCubit
}){
  U.BottomSheet.show(context,
   builder: (context)=> BlocProvider.value(
    value: checkoutCubit,
    child: CardBottomSheet(checkoutCubit: checkoutCubit,)) );
}

  const CardBottomSheet({
    required this.checkoutCubit,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(15),
      children: [
          U.Text('Add new card'),
          SizedBox(height: 16,),
          U.TextInput(title: 'Name on Card', textCtrl: checkoutCubit.nameCtrl),
          SizedBox(height: 20,),
          // U.TextInput(title: 'bank name', textCtrl: checkoutCubit.bankNameCtrl),
          // SizedBox(height: 20,),
          U.TextInput(title: 'Card Number', textCtrl: checkoutCubit.numberkCtrl,numbersOnly: true,),
          SizedBox(height: 20,),
          U.TextInput(title: 'Expire Date',numbersOnly: true, textCtrl: checkoutCubit.expireCtrl),
          SizedBox(height: 20,),
          U.TextInput(title: 'CVV',numbersOnly: true, textCtrl: checkoutCubit.cvvCtrl,
          trailing: U.Image.Icon(image: U.Icons.question),),
          SizedBox(height: 29,),
          Row(children: [
            U.CheckBox(color: U.CheckBoxColor.black,
             onTap: (){}),
             SizedBox(width: 13,),
             U.Text('asdasfafaffa')
          ],),
          SizedBox(height: 20,),
          U.Button(title: 'Add Card',
           size: U.ButtonSize.m,
            onTap: ()async{
             final temp = await checkoutCubit.onCardAdded(BankCard(
                color: U.Theme.primary,
                 bankName:checkoutCubit.bankNameCtrl.text,
                  id: int.parse(checkoutCubit.numberkCtrl.text),
                   expire: checkoutCubit.expireCtrl.text,
                    cvv: int.parse(checkoutCubit.cvvCtrl.text),
               name: checkoutCubit.nameCtrl.text));
            if(temp) GoRouter.of(context).pop();
            },
             bordeRaius: U.Theme.r25,
              color: U.Theme.primary)
      ],
    );
  }
}