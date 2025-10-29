import 'package:e_commerce/modules/checkout/add_shipping_address.dart';
import 'package:e_commerce/modules/checkout/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressDialog extends StatelessWidget {

static show(BuildContext context,{
  required CheckoutCubit checkoutCubit
}){
  showDialog(context: context,
   builder: (context){
    return BlocProvider.value(
     value: checkoutCubit,
      child: ShippingAddressDialog());
   });
}

  const ShippingAddressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit,CheckoutState>(
      builder: (BuildContext context, state) {
return  Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            U.AppBar(title: 'Add shipping address',),
            SizedBox(height: 20,),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [...
                  state.shippingAdresses.expand((e)=>
                 [ U.Card(
                                      padding: EdgeInsets.only(top: 18,left: 28,bottom: 21,right: 23),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(children: [
                                                  U.Text(e!.name),
                                                  Spacer(),
                                                 U.TextButton(text: 'Edit',
                                                 color: U.Theme.primary,
                                                  onTap: (){
                                                  AddShippingAddressDialog.show(
                                                    context,
                                                   checkoutCubit: context.read<CheckoutCubit>(),
                                                   address: e
                                                   );
                                                 })
                                                ],),
                                                SizedBox(height: 7,),
                                                U.Text(e!.address),
                                                SizedBox(height: 3,),
                                                U.Text('${e!.address},${e!.region},${e!.zipCode}'),
                                                SizedBox(height: 14,),
                                                Row(children: [
                                                  U.CheckBox(color: U.CheckBoxColor.black,
                                                  isActive: e == state.selectedAddress,
                                                   onTap: (){
                                                    context.read<CheckoutCubit>().onShippingAddressSelected(e);
                                                   }),
                                                   SizedBox(width: 13,),
                                                   U.Text('Use as the Shipping Address')
                                                ],)
                                              ],
                                            ),
                                     ),
                                     SizedBox(height: 24,)
                                     ] ),
                                     U.IconButton(
                                      color: U.Theme.black,
                                      size: U.IconButtonSize.small,
                                      icon: U.Icons.add,
                                       onTap: (){
                                        AddShippingAddressDialog.show(context,
                                         checkoutCubit: context.read<CheckoutCubit>());
                                       })
                ],
              ),
            )
          ],
        ),
      );

        },
      
    );
  }
}