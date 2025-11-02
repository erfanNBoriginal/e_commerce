import 'package:e_commerce/domains/models/order.dart';
import 'package:e_commerce/domains/settings_repo.dart';
import 'package:e_commerce/modules/profile/cubit/settings_cubit.dart';
import 'package:e_commerce/modules/profile/order_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersPage extends StatelessWidget {

static String path = '/orders';

  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(repo: context.read<SettingsRepo>()),
      child: BlocBuilder<SettingsCubit,SettingsState>(
        builder: (context,state) {
          final cubit = context.read<SettingsCubit>();
          return 
          state.loading?
          Center(child: CircularProgressIndicator(),)
          : 
            Scaffold(
            body:  ListView(
              children: [
                  U.AppBar(havElevation: false,),
                  SizedBox(height: 18,),
                 
                 if(state.profile!.orderedItems.isNotEmpty)
                  ...[ 
                  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: U.Text('Orders',weight: U.TextWeight.bold,fontSize: U.TextSize.s34,),
                  ),
                  SizedBox(height: 24,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                     state.orderStatus.name == 'delivered' ? 
                     U.Button(title: 'Delivered', size: U.ButtonSize.xs,
                       onTap: (){
                        cubit.onOrderStatusChanged(OrderStatus.delivered);
                       }, bordeRaius: U.Theme.r29, color: U.Theme.black):
                       U.TextButton(text: 'Delivered',   onTap: (){
                        cubit.onOrderStatusChanged(OrderStatus.delivered);
                       },),
                    state.orderStatus.name == 'processing' ?  
                     U.Button(title: 'Processing', size: U.ButtonSize.xs,
                       onTap: (){
                        cubit.onOrderStatusChanged(OrderStatus.processing);
                       }, bordeRaius: U.Theme.r29, color: U.Theme.black):
                       U.TextButton(text: 'Proccessing',   onTap: (){
                        cubit.onOrderStatusChanged(OrderStatus.processing);
                       },),
                    state.orderStatus.name == 'cancelled' ?  
                      U.Button(title: 'Cancelled', size: U.ButtonSize.xs,
                       onTap: (){
                        cubit.onOrderStatusChanged(OrderStatus.cancelled);
                       }, bordeRaius: U.Theme.r29, color: U.Theme.black):
                       U.TextButton(text: 'Cancelled',   onTap: (){
                        cubit.onOrderStatusChanged(OrderStatus.cancelled);
                       },),
                    ],),
                  ),
                  SizedBox(height: 30,),
              ...state.profile!.orderedItems.
              where((e)=> e.orderStatus == state.orderStatus).
              map((e)=>OrderCard(order: e))
            ,
              SizedBox(height: 55,)] else 
                          SizedBox(
                  height: MediaQuery.of(context).size.height / 2 - 80,
                ),
                Center(child: U.Text('No Orders yet'),),
          // Expanded(
          //   child: Column(
          //     children: [
          //       SizedBox(
          //         height: MediaQuery.of(context).size.height / 2 - 80,
          //       ),
          //       Center(child: U.Text('No Orders yet'),),
          //     ],
          //   ),
          // )
              ],
            ) 
          )  
              ;       }
      ),
    );
  }
}