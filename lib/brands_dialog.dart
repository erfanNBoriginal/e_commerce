import 'package:e_commerce/domains/shop_repo.dart';
import 'package:e_commerce/modules/category/brand_checkbox.dart';
import 'package:e_commerce/modules/category/cubit/category_cubit.dart';
import 'package:e_commerce/modules/favorite/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BrandsDialog extends StatelessWidget {
  static show(
    BuildContext context, {
    FavoriteCubit? favoriteCubit,
    CategoryCubit? categoryCubit,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BrandsDialog(
          favCubit: favoriteCubit,
          categoryCubit: categoryCubit,
        );
      },
    );
  }

  final CategoryCubit? categoryCubit;
  final FavoriteCubit? favCubit;
  const BrandsDialog({super.key, this.favCubit, this.categoryCubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          if (favCubit == null)
            BlocProvider.value(value: categoryCubit!)
          else
            BlocProvider.value(value: favCubit!),
        ],
        child:
            favCubit == null
                ? BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    final categoryCubit = context.read<CategoryCubit>();
                    return Stack(
                      children: [
                        ListView(
                          children: [
                            U.AppBar(title: 'brands'),
                            SizedBox(height: 11),
                            U.SearchInput(
                              controller: TextEditingController(),
                              onSearched: () {},
                              isSearched: false,
                              hintText: 'search',
                            ),
                            SizedBox(height: 11),

                            ListView.builder(
                              itemBuilder: (context, index) {
                                return BrandCheckBox(
                                  title: state.brands![index],
                                  isActive: state.selectedBrands.contains(
                                    state.brands![index],
                                  ),
                                  onTap: () {
                                    categoryCubit.onBrandSelected(
                                      state.brands![index],
                                    );
                                  },
                                );
                              },
                              itemCount: state.brands!.length,
                              shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: U.Theme.white,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                children: [
                                  SizedBox(width: 16),
                                  Expanded(
                                    flex: 1,
                                    child: U.OutlineButton(
                                      onTap: () {
                                        categoryCubit.onBrandsDiscarded();
                                      },
                                      borderType: U.BorderVariants.black,
                                      size: U.OutlineButtonSize.large,
                                      title: 'Discard',
                                    ),
                                  ),
                                  SizedBox(width: 22),
                                  state.loading
                                      ? CircularProgressIndicator()
                                      : Expanded(
                                        flex: 1,
                                        child: U.Button(
                                          title: 'Apply',
                                          size: U.ButtonSize.m,
                                          onTap: () {
                                            // await categoryCubit.onFilterApplied();
                                            GoRouter.of(context).pop();
                                          },
                                          bordeRaius: U.Theme.r25,
                                          color: U.Theme.primary,
                                        ),
                                      ),
                                  SizedBox(width: 16),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )
                : BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                    final favCubit = context.read<FavoriteCubit>();
                    return Stack(
                      children: [
                        ListView(
                          children: [
                            U.AppBar(title: 'brands'),
                            SizedBox(height: 11),
                            U.SearchInput(
                              controller: TextEditingController(),
                              onSearched: () {},
                              isSearched: false,
                              hintText: 'search',
                            ),
                            SizedBox(height: 11),

                            ListView.builder(
                              itemBuilder: (context, index) {
                                return BrandCheckBox(
                                  title: state.brands![index],
                                  isActive: state.selectedBrands.contains(
                                    state.brands![index],
                                  ),
                                  onTap: () {
                                    favCubit.onBrandSelected(
                                      state.brands![index],
                                    );
                                  },
                                );
                              },
                              itemCount: state.brands!.length,
                              shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: U.Theme.white,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
                                children: [
                                  SizedBox(width: 16),
                                  Expanded(
                                    flex: 1,
                                    child: U.OutlineButton(
                                      onTap: () {
                                        favCubit.onBrandsDiscarded();
                                      },
                                      borderType: U.BorderVariants.black,
                                      size: U.OutlineButtonSize.large,
                                      title: 'Discard',
                                    ),
                                  ),
                                  SizedBox(width: 22),
                                  state.loading
                                      ? CircularProgressIndicator()
                                      : Expanded(
                                        flex: 1,
                                        child: U.Button(
                                          title: 'Apply',
                                          size: U.ButtonSize.m,
                                          onTap: () {
                                            // await categoryCubit.onFilterApplied();
                                            GoRouter.of(context).pop();
                                          },
                                          bordeRaius: U.Theme.r25,
                                          color: U.Theme.primary,
                                        ),
                                      ),
                                  SizedBox(width: 16),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
      ),
    );
  }
}
