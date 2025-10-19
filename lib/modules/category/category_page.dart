import 'package:e_commerce/domains/favorite_repo.dart';
import 'package:e_commerce/domains/models/category_data.dart';
import 'package:e_commerce/domains/shop_repo.dart';
import 'package:e_commerce/modules/category/categoru_filter_dialog.dart';
import 'package:e_commerce/modules/category/cubit/category_cubit.dart';
import 'package:e_commerce/modules/category/filters_page.dart';
import 'package:e_commerce/modules/category/sort_btms.dart';
import 'package:e_commerce/modules/favorite/cubit/favorite_cubit.dart';
import 'package:e_commerce/modules/favorite/favorite_filter_dialog.dart';
import 'package:e_commerce/modules/home/cubit/home_cubit.dart';
import 'package:e_commerce/modules/shop/cubit/shop_cubit.dart';
import 'package:e_commerce/modules/store/product_card.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoryPage extends StatelessWidget {
  static const String path = '/Category:id';

  final CategoryData? initial;
  final int id;
  const CategoryPage({super.key, this.initial, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => CategoryCubit(
                id: id,
                repo: context.read<ShopRepo>(),
                initial: initial,
              ),
        ),
        BlocProvider(
          create:
              (context) => FavoriteCubit(repo: context.read<FavoriteRepo>()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<HomeCubit, HomeState>(
            listenWhen: (previous, current) => current.selectedIndex == 1,
            listener: (context, state) {
              print('listneddddddd');
              final favCubit = context.read<FavoriteCubit>();
              favCubit.onRefresh();
            },
          ),
        ],
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            final categoyCubit = context.read<CategoryCubit>();
            return state.loading
                ? Center(child: CircularProgressIndicator())
                : Scaffold(
                  body: Column(
                    children: [
                      U.AppBar(title: state.category?.title ?? 'Category'),
                      SizedBox(height: 10),
                      Container(
                        color: U.Theme.background,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              U.Image.Icon(image: U.Icons.filter),
                              SizedBox(width: 7),
                              GestureDetector(
                                onTap: () {
                                  CategoryFilterDialog.show(
                                    context,
                                    categoryCubit:
                                        context.read<CategoryCubit>(),
                                  );
                                  // showDialog(
                                  //   context: context,
                                  //   barrierDismissible:
                                  //       false, // prevents closing on tap outside
                                  //   builder: (context) {
                                  //     return
                                  //   },
                                  // );

                                  // GoRouter.of(context).pushNamed(
                                  //   pathParameters: {'id': id.toString()},
                                  //   FiltersPage.path,
                                  //   extra: categoyCubit,
                                  // );
                                },
                                child: U.Text('Filters'),
                              ),
                              U.Image.Icon(image: U.Icons.highlow),
                              SizedBox(width: 7),
                              GestureDetector(
                                onTap: () {
                                  SortBottomSheet.show(
                                    context,
                                    categoryCubit:
                                        context.read<CategoryCubit>(),
                                  );
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
                      ),
                      SizedBox(height: 17),
                      state.loading
                          ? Expanded(
                            child: Center(child: CircularProgressIndicator()),
                          )
                          : Expanded(
                            child: GridView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              itemCount: state.products.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 26,
                                    // mainAxisExtent: MediaQuery.of(context).size.height * 0.43,
                                    childAspectRatio: 1.1 / 2,
                                  ),
                              itemBuilder: (context, index) {
                                return ProductCard(
                                  // height: ,
                                  width: 185,
                                  product: state.products[index],
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
