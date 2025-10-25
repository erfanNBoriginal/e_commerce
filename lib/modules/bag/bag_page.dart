import 'package:e_commerce/domains/bag_repo.dart';
import 'package:e_commerce/domains/favorite_repo.dart';
import 'package:e_commerce/modules/bag/bag_card.dart';
import 'package:e_commerce/modules/bag/cubit/bag_cubit.dart';
import 'package:e_commerce/modules/bag/promo_btms.dart';
import 'package:e_commerce/modules/favorite/cubit/favorite_cubit.dart';
import 'package:e_commerce/modules/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';

class BagPage extends StatelessWidget {
  static const path = '/bag';

  const BagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BagCubit(repository: context.read<BagRepo>()),
        ),
        BlocProvider(
          create:
              (context) => FavoriteCubit(repo: context.read<FavoriteRepo>()),
        ),
      ],
      child: BlocListener<HomeCubit, HomeState>(
        listenWhen: (previous, current) => current.selectedIndex == 2,
        listener: (context, state) {
          context.read<BagCubit>().onRefresh();
        },
        child: BlocBuilder<BagCubit, BagState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: U.Theme.background,
              body: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  U.AppBar(title: 'سبد', back: false),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: U.Text(
                      'سبد خرید',
                      fontSize: U.TextSize.s34,
                      weight: U.TextWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24),
                  // ...state.bagItems.map((e) => BagCard(bagItem: e)),
                  BlocBuilder<FavoriteCubit, FavoriteState>(
                    builder: (context, fstate) {
                      final temp = fstate.favorites;
                      return Expanded(
                        flex: 1,
                        child:
                            state.loading
                                ? Center(child: CircularProgressIndicator())
                                : ListView.builder(
                                  itemCount: state.bagItems.length,
                                  itemBuilder: (context, index) {
                                    final valid =
                                        temp
                                            .where(
                                              (e) =>
                                                  e.product ==
                                                  state.bagItems[index].product,
                                            )
                                            .firstOrNull;
                                    return BagCard(
                                      isFav: valid != null,
                                      bagItem: state.bagItems[index],
                                    );
                                  },
                                ),
                      );
                    },
                  ),
                  SizedBox(height: 9),

                  GestureDetector(
                    onTap: () {
                      print('object');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: U.TextInput(
                        title: 'کد تخفیف رو وارد کنین',
                        textCtrl: context.read<BagCubit>().textCtrl,
                        trailing: U.IconButton(
                          color: U.Theme.black,
                          size: U.IconButtonSize.large,
                          icon: U.Icons.arrowForward,
                          onTap: () {
                            PromoBottomSheet.show(
                              context,
                              bagCubit: context.read<BagCubit>(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        U.Text(
                          color: U.Theme.gray,
                          'مبلغ نهایی',
                          weight: U.TextWeight.regular,
                        ),
                        Spacer(),
                        U.Text(state.getTotal().toString()),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: U.Button(
                      title: 'پرداخت',
                      size: U.ButtonSize.l,
                      onTap: () {
                        PromoBottomSheet.show(
                          context,
                          bagCubit: context.read<BagCubit>(),
                        );
                      },
                      bordeRaius: U.Theme.r25,
                      color: U.Theme.primary,
                    ),
                  ),
                  SizedBox(height: 77),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
