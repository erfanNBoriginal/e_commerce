import 'package:e_commerce/modules/checkout/banck_card_card.dart';
import 'package:e_commerce/modules/checkout/card_btms.dart';
import 'package:e_commerce/modules/checkout/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';

class BankCardsDialog extends StatelessWidget {

static show(BuildContext context,{
  required CheckoutCubit checkoutCubit
}){
  showDialog(context: context,
   builder:(context){
    return BlocProvider.value(
      value: checkoutCubit,
      child: BankCardsDialog());
   });
}

  const BankCardsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit,CheckoutState>(
      builder: (context,state) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                U.AppBar(title: 'payment methods'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        SizedBox(height: 31,),
                        U.Text('Your payments methods'),
                        SizedBox(height: 31,),
                        ...state.banckCards.expand((e)=>[
                          BanckCardCard(card: e),
                          SizedBox(height: 25,),
                          Row(children: [U.CheckBox(color: U.CheckBoxColor.black,
                          isActive: e == state.selectedCard,
                           onTap: (){
                            context.read<CheckoutCubit>().onBankCardSelected(e);
                           }),
                           SizedBox(width: 13,),
                           U.Text('sdasdasdasd'),
                           ],),
                        SizedBox(height: 15,),
                        ]),
                        SizedBox(height: 15,),
                        U.IconButton(size: U.IconButtonSize.small,color: U.Theme.black,
                         icon: U.Icons.add,
                          onTap: (){
                            // context.read<CheckoutCubit>().onCardAdded(e);
                            CardBottomSheet.show(context,
                             checkoutCubit: context.read<CheckoutCubit>());
                          })
                      ],
                    ),
                  ),
                )
            ],
          ),
        );
      }
    );
  }
}