import 'package:e_commerce/brands_dialog.dart';
import 'package:e_commerce/modules/favorite/cubit/favorite_cubit.dart';
import 'package:e_commerce/modules/product_info/not_selected_button.dart';
import 'package:e_commerce/modules/product_info/select_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:go_router/go_router.dart';

class FavoriteFilterDialog extends StatelessWidget {
  final FavoriteCubit favCubit;

  const FavoriteFilterDialog({super.key, required this.favCubit});
  static show(BuildContext context, {required FavoriteCubit favCubit}) {
    showDialog(
      context: context,
      builder: (context) => FavoriteFilterDialog(favCubit: favCubit),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return MultiBlocProvider(
      providers: [BlocProvider.value(value: favCubit)],
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          final favCubit = context.read<FavoriteCubit>();
          return Scaffold(
            backgroundColor: U.Theme.background,
            body: Stack(
              children: [
                ListView(
                  children: [
                    U.AppBar(title: 'filters'),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 14.0,
                        right: 16,
                        bottom: 12,
                      ),
                      child: U.Text('Price Range', fontSize: U.TextSize.s16),
                    ),
                    Container(
                      color: U.Theme.white,
                      height: 88,
                      child: U.RangeSlider(
                        minValue: 0,
                        maxValue: 500,
                        minRangeValue: state.minValue.toDouble(),
                        maxRangeValue: state.maxValue.toDouble(),
                        onChanged: (min, max) {
                          favCubit.onPriceRangeChanged(min, max);
                        },
                        showType: U.RangeSliderShowType.price,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 14.0,
                        right: 16,
                        bottom: 12,
                      ),
                      child: U.Text('Colors', fontSize: U.TextSize.s16),
                    ),
                    Container(
                      height: 118,
                      color: U.Theme.white,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.colors.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          // mainAxisExtent: 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1.5 / 1,
                        ),
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (context, index) {
                          return SelectColor(
                            color: state.colors[index],
                            onPressed: () {
                              favCubit.onColorChanged(state.colors[index]);
                            },
                            isSelected: state.selectedColors.contains(
                              state.colors[index],
                            ),
                          );
                          //     );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 14.0,
                        right: 16,
                        bottom: 12,
                      ),
                      child: U.Text('Sizes', fontSize: U.TextSize.s16),
                    ),
                    Container(
                      color: U.Theme.white,

                      height: 80,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.sizes.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1 / 1,
                        ),
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (context, index) {
                          return state.selectedSizes.contains(
                                state.sizes[index],
                              )
                              ? U.Button(
                                title: state.sizes[index],
                                size: U.ButtonSize.s,
                                onTap: () {
                                  favCubit.onSizeChanged(state.sizes[index]);
                                },
                                bordeRaius: U.Theme.r8,
                                color: U.Theme.primary,
                              )
                              : NotSelectedButton(
                                onPressed: () {
                                  favCubit.onSizeChanged(state.sizes[index]);
                                },
                                title: state.sizes[index],
                              );
                          //     );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 14.0,
                        right: 16,
                        bottom: 12,
                      ),
                      child: U.Text('Category', fontSize: U.TextSize.s16),
                    ),
                    Container(
                      color: U.Theme.white,
                      // height: 198,
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: state.categories.length + 1,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: width ~/ 140,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 2.2 / 1,
                        ),
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (context, index) {
                          // print('MediaQuery.of(context).size.width');
                          // print(MediaQuery.of(context).size.width);
                          if (index == state.categories.length) {
                            return state.selectedCategory != ''
                                ? NotSelectedButton(
                                  onPressed: () {
                                    favCubit.onCategorySelected('');
                                  },
                                  title: 'All',
                                )
                                : U.Button(
                                  title: 'All',
                                  size: U.ButtonSize.s,
                                  onTap: () {},
                                  bordeRaius: U.Theme.r8,
                                  color: U.Theme.primary,
                                );
                          } else {
                            return state.selectedCategory !=
                                    state.categories[index]
                                ? NotSelectedButton(
                                  onPressed: () {
                                    favCubit.onCategorySelected(
                                      state.categories[index],
                                    );
                                  },
                                  title: state.categories[index],
                                )
                                : U.Button(
                                  title: state.categories[index],
                                  size: U.ButtonSize.s,
                                  onTap: () {},
                                  bordeRaius: U.Theme.r8,
                                  color: U.Theme.primary,
                                );
                          }
                        },
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        BrandsDialog.show(context, favoriteCubit: favCubit);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 14.0,
                          right: 16,
                          bottom: 12,
                          left: 16,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                U.Text('Brands', fontSize: U.TextSize.s16),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    ...state.selectedBrands.asMap().entries.map(
                                      (e) => U.Text(
                                        e.key == state.selectedBrands.length - 1
                                            ? ' ${e.value}'
                                            : ' ${e.value},',
                                        fontSize: U.TextSize.s11,
                                        color: U.Theme.gray,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                // GoRouter.of(context).pushNamed(
                                //   BrandsPage.path,
                                //   pathParameters: {'id': id.toString()},
                                //   extra: favCubit,
                                // );
                              },
                              child: U.Image.Icon(image: U.Icons.chevron),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 77),
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
                                favCubit.onFiltersDiscarded();
                              },
                              borderType: U.BorderVariants.black,
                              size: U.OutlineButtonSize.large,
                              title: 'Discard',
                            ),
                          ),
                          SizedBox(width: 22),
                          state.loading
                              ? Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [CircularProgressIndicator()],
                                ),
                              )
                              : Expanded(
                                flex: 1,
                                child: U.Button(
                                  title: 'Apply',
                                  size: U.ButtonSize.m,
                                  onTap: () async {
                                    await favCubit.onFilterApplied();
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
            ),
          );
        },
      ),
    );
  }
}
