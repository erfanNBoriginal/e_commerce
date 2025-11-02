import 'package:e_commerce/domains/settings_repo.dart';
import 'package:e_commerce/modules/profile/cubit/settings_cubit.dart';
import 'package:e_commerce/modules/profile/orders_page.dart';
import 'package:e_commerce/modules/profile/settings_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  
  static String path = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(repo: context.read<SettingsRepo>()),
      child: BlocBuilder<SettingsCubit,SettingsState>(
        builder: (context,state) {
          return 
          state.loading ? Center(child: CircularProgressIndicator(),):
           Scaffold(
            body:ListView(
              children: [
                          U.AppBar(havElevation: false,back: false,),
                          U.Text('My profile',fontSize: U.TextSize.s34,
                          weight: U.TextWeight.bold,),
                          SizedBox(height: 24,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 17.0),
                            child: Row(
                              children: [
                                U.Image(
                                  height: 64,
                                  width: 64,
                                  image: state.profile!.image),
                                SizedBox(width: 19,),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    U.Text(state.profile!.name,weight: U.TextWeight.semiBold,fontSize: U.TextSize.s18,),
                                    U.Text(state.profile!.email,color: U.Theme.gray,)
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 28,),
                          SettingsCard(title: 'My orders', subTitle: 'you have ${state.profile!.orderedItems.length}',
                           onTap: (){
                            GoRouter.of(context).pushNamed(OrdersPage.path);
                           }),
                          SettingsCard(title: 'SAhipping addresses', subTitle: ' ${state.profile!.addresses.length} addresses',
                           onTap: (){}),
                          SettingsCard(title: 'payment methods', subTitle:state.profile!.bankCards.isEmpty ? 'Add payment methods': 'you have ${state.profile!.bankCards.firstOrNull}',
                           onTap: (){}),
                          SettingsCard(title: 'promod codes', subTitle:state.profile!.promoCodes.isEmpty?'earn more points to get promod codes!!' :'you have special promodcodes',
                           onTap: (){}),
                          SettingsCard(title: 'reviews', subTitle: 'you have ${state.profile!.orderedItems.length} reviews',
                           onTap: (){}),
                          SettingsCard(title: 'Settings', subTitle: 'notifications, password',
                           onTap: (){}),
                           SizedBox(height: 55,)
              ],
            ) ,
          );
        }
      ),
    );
  }
}