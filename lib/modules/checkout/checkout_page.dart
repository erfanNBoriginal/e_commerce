import 'package:e_commerce/domains/checkout_repo.dart';
import 'package:e_commerce/domains/models/bag_item.dart';
import 'package:e_commerce/modules/checkout/bank_cards.dart';
import 'package:e_commerce/modules/checkout/card_btms.dart';
import 'package:e_commerce/modules/checkout/cubit/checkout_cubit.dart';
import 'package:e_commerce/modules/checkout/shipping_address_dialog.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';
class CheckoutPage extends StatelessWidget {

static final path = '/checkout';
  final List<BagItem>? bagItems;
  const CheckoutPage({super.key, this.bagItems});

  @override
  Widget build(BuildContext context) {
    print('bagItems?.length');
    print(bagItems?.length);
    return Scaffold(
      backgroundColor: U.Theme.background,
      body: BlocProvider(
        create:(context) =>  CheckoutCubit(
          products: bagItems,
          repo: context.read<CheckoutRepo>()),
        child: BlocBuilder<CheckoutCubit,CheckoutState>(
          builder:  (context,state) {
          return
               Column(
                children: [
                  // TODO //column??
                  U.AppBar(title: 'checkout',),
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(16.0),
                     child: Column(children: [
                    
                       Expanded(
                         child:
                          state.loading ? Center(child: CircularProgressIndicator()): 
                          ListView(children: [
                                 state.selectedAddress==null  ? 
                                 Center(
                                  child: Expanded(
                                    child: Column(
                                      children: [
                                        U.Text(
                                          
                                          'add shipping address!!'),
                                        SizedBox(height: 14,),
                                        U.IconButton(size: U.IconButtonSize.large,color: U.Theme.primary,
                                         icon: U.Icons.add,
                                          onTap:(){}),
                                      ],
                                    ),
                                  ),
                                 ): Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   U.Text('Shipping Address',fontSize: U.TextSize.s16,
                                          weight: U.TextWeight.semiBold,),
                                   SizedBox(height: 21,),
                                   
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: U.Card(
                                      // elevation: 6, // controls shadow depth
                                        // shadowColor: Colors.grey.withOpacity(0.5), // shadow color
                                        // shape: RoundedRectangleBorder(
                                          // borderRadius: BorderRadius.circular(15), // rounded corners
                                          // side: const BorderSide(
                                          //   color: Colors.blueAccent, // border color
                                          //   width: 2, // border width
                                          // ),
                                        // ),
                                      padding: EdgeInsets.only(top: 18,left: 28,bottom: 21,right: 23),
                                    radius: 15,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                 
                                                Row(children: [
                                                  U.Text(state.selectedAddress!.name),
                                                  Spacer(),
                                                  U.TextButton(text: 'Change',color: U.Theme.primary ,
                                                   onTap: (){
                                                       ShippingAddressDialog.show(context,
                                                        checkoutCubit: context.read<CheckoutCubit>());
                                                   })
                                                ],),
                                                SizedBox(height: 7,),
                                                U.Text(state.selectedAddress!.address),
                                                SizedBox(height: 3,),
                                                U.Text(
                                                  weight: U.TextWeight.regular,
                                                  '${state.selectedAddress!.address},${state.selectedAddress!.region},${state.selectedAddress!.zipCode}'),
                                              ],
                                            ),
                                     ),
                                   ),
                                 ],),
                                   SizedBox(height: 51,),
                                               state.selectedCard == null ?   
                                               Center(
                                  child: Column(
                                    children: [
                                      U.Text('add payment method!!'),
                                      SizedBox(height: 14,),
                                      U.IconButton(size: U.IconButtonSize.large,color: U.Theme.primary,
                                         icon: U.Icons.add,
                                          onTap:(){
                                            CardBottomSheet.show(context,
                                             checkoutCubit: context.read<CheckoutCubit>());
                                          }),

                                    ],
                                  ),
                                 )
                                                :    Column(children: [
                              Row(children: [U.Text(
                                weight : U.TextWeight.semiBold,
                                fontSize: U.TextSize.s16,
                                'Payment'),Spacer(),   U.TextButton(text: 'Change',color: U.Theme.primary ,
                                                   onTap: (){
                                                      BankCardsDialog.show(context,
                                                       checkoutCubit:  context.read<CheckoutCubit>());
                                                   })],)
                                   ,SizedBox(height: 17,),
                                  Row(
                                    children: [
                                      U.Text(
                                        weight : U.TextWeight.regular,
                                        state.selectedCard!.bankName),
                                      SizedBox(width: 17,),
                                      U.Text(
                                        weight : U.TextWeight.regular,
                                        state.selectedCard!.id.toString())
                                    ],
                                  ),
                             ],),
                                  
                                   SizedBox(height: 51,),
                                   U.Text(
                                    weight: U.TextWeight.semiBold,
                                    fontSize: U.TextSize.s16,
                                    'delivey method'),
                                   SizedBox(height: 21,),
                                   SizedBox(
                                    height: 72,
                                     child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context,index){return 
                                     GestureDetector(
                                      onTap: (){
                                        context.read<CheckoutCubit>().onDeliverySelected(state.deliveryMethods[index]);
                                      },
                                       child: U.Card(
                                        height: 72,
                                        width: 120,
                                        borderColor: state.deliveryMethods[index]
                                          == state.selectedDeliveryMethod? U.Theme.primary : U.Theme.white ,
                                        // decoration: BoxDecoration(
                                        //  border: Border.all(color: state.deliveryMethods[index]
                                        //   == state.selectedDeliveryMethod? U.Theme.primary : U.Theme.white  ),
                                        //   borderRadius: BorderRadius.circular(8)
                                        // ,color: U.Theme.white
                                        // ),
                                        child: Column(
                                        children: [
                                          U.Image(
                                            height: 43,
                                            width: 81,
                                            image :state.deliveryMethods[index].image),
                                        SizedBox(height: 11,),
                                        U.Text(
                                          fontSize: U.TextSize.s11,
                                          color: U.Theme.gray,
                                          state.deliveryMethods[index].days)
                                        ],
                                       ),),
                                     );
                                     }  ,
                                      separatorBuilder:(context, index) {
                                        return SizedBox(width: 22,);
                                      }, itemCount: state.deliveryMethods.length),
                                   ),
                                   SizedBox(height: 10,)
                                           ],),
                       ),
                      SizedBox(height: 8,),
                     state.bagItems.isEmpty ?  SizedBox(): Column(
                      children: [Row(
                        children: [
                          U.Text('Order:',color: U.Theme.gray,),
                          Spacer(),
                          U.Text(state.getTotal.toString(),weight: U.TextWeight.semiBold),
                        ],
                      ),
                      SizedBox(height:14 ,),
                      Row(
                        children: [
                          U.Text('Delivery:',color: U.Theme.gray,),
                          Spacer(),
                          U.Text(15.toString(),weight: U.TextWeight.semiBold,),
                        ],
                      ),
                                 
                      SizedBox(height:14 ,),
                      Row(
                        children: [
                          U.Text('summary:',weight: U.TextWeight.semiBold,color: U.Theme.gray,),
                        Spacer(),
                          U.Text((state.getTotal + 15).toString()),
                        ],
                      ),
                      SizedBox(height:23 ,),
                      U.Button(title: 'Submit Order',
                       size: U.ButtonSize.l,
                        onTap: (){},
                         bordeRaius: U.Theme.r25,
                          color: U.Theme.primary)
                                   ],
                     )
                                
                      
                     ],),
                   ),
                 ) ]        );
          }
        ),
      ) ,
    );
  }
}