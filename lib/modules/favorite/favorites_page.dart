import 'package:e_commerce/domains/bag_repo.dart';
import 'package:e_commerce/domains/favorite_repo.dart';
import 'package:e_commerce/domains/shop_repo.dart';
import 'package:e_commerce/modules/bag/cubit/bag_cubit.dart';
import 'package:e_commerce/modules/category/filters_page.dart';
import 'package:e_commerce/modules/favorite/cubit/favorite_cubit.dart';
import 'package:e_commerce/modules/favorite/favorite_card.dart';
import 'package:e_commerce/modules/favorite/favorite_filter_dialog.dart';
import 'package:e_commerce/modules/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '/ui_kit.dart/ui_kit.dart' as U;

class FavoritesPage extends StatelessWidget {
  static const path = '/favorites';

  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => FavoriteCubit(repo: context.read<FavoriteRepo>()),
        ),
        BlocProvider(
          create: (context) => BagCubit(repository: context.read<BagRepo>()),
        ),
      ],
      child: BlocListener<HomeCubit, HomeState>(
        listenWhen: (previous, current) => current.selectedIndex == 3,
        listener: (context, state) {
          final favCubit = context.read<FavoriteCubit>();
          final bagCubit = context.read<BagCubit>();
          favCubit.onRefresh();
          bagCubit.onRefresh();
        },
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            final favCubit = context.read<FavoriteCubit>();
            return Scaffold(
              body: Column(
                children: [
                  U.AppBar(back: false, 
                  havElevation: false,
                  title: 'Favorites'),
                  SizedBox(height: 5),
                  state.loading
                      ? Expanded(
                        child: Center(child: CircularProgressIndicator()),
                      )
                      : Container(
                         padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16.0),
                    decoration: BoxDecoration(
                    color: U.Theme.background,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          color: const Color.fromARGB(20, 0, 0, 0),
                          spreadRadius: 1,
                          blurRadius: 4
                        )
                      ]
                    ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            U.Image.Icon(image: U.Icons.filter),
                            SizedBox(width: 7),
                            GestureDetector(
                              onTap: () {
                                FavoriteFilterDialog.show(
                                  context,
                                  favCubit: favCubit,
                                );
                              },
                              child: U.Text('Filters'),
                            ),
                            U.Image.Icon(image: U.Icons.highlow),
                            SizedBox(width: 7),
                            GestureDetector(
                              onTap: () {
                                // SortBottomSheet.show(
                                //   context,
                                //   categoryCubit: context.read<CategoryCubit>(),
                                // );
                              },
                              child: U.Text(
                                state.selectedSortCategory == ''
                                    ? 'price : highest to lowest'
                                    : state.selectedSortCategory,
                              ),
                            ),
                            U.Image.Icon(image: U.Icons.viewList),
                          ],
                        ),
                      ),
                  SizedBox(height: 15),

                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: state.favorites.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 26,
                        childAspectRatio: 1.1 / 2,
                      ),
                      itemBuilder: (context, index) {
                        return FavoriteCard(
                          // height: ,
                          width: 185,
                          favorite: state.favorites[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
