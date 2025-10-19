import 'package:e_commerce/domains/bag_repo.dart';
import 'package:e_commerce/domains/favorite_repo.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/domains/shop_repo.dart';
import 'package:e_commerce/modules/bag/cubit/bag_cubit.dart';
import 'package:e_commerce/modules/favorite/cubit/favorite_cubit.dart';
import 'package:e_commerce/modules/favorite/favorite_color_btms.dart';
import 'package:e_commerce/modules/product_info/not_selected_button.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoriteSizeBtms extends StatelessWidget {
  final Product product;
  static show(
    BuildContext context, {
    required Product product,
    FavoriteCubit? favCubit,
  }) {
    U.BottomSheet.show(
      maxWidth: 450,
      maxHeight: 368,
      context,

      builder: (context) {
        return MultiBlocProvider(
          providers: [
            favCubit == null
                ? BlocProvider(
                  create:
                      (context) =>
                          FavoriteCubit(repo: context.read<FavoriteRepo>()),
                )
                : BlocProvider.value(value: favCubit),
          ],
          child: FavoriteSizeBtms(product: product),
        );
      },
    );
  }

  const FavoriteSizeBtms({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final favCubit = context.read<FavoriteCubit>();

    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return ListView(
          // padding: EdgeInsets.all(9),
          children: [
            Center(
              child: U.Text(
                'سایزت رو مشخص کن',
                fontSize: U.TextSize.s18,
                weight: U.TextWeight.semiBold,
              ),
            ),
            SizedBox(height: 22),
            //Text(widget.product.sizes[1]),
            SizedBox(
              height: 166,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 2.2 / 1,
                ),
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return state.favorite == null ||
                          product != state.favorite?.product
                      ? NotSelectedButton(
                        onPressed: () {
                          final temp = favCubit.onSizeSelected(
                            item: product,
                            size: product.sizes[index],
                          );
                          if (temp) {
                            GoRouter.of(context).pop();
                            FavoriteColorBtms.show(
                              context,
                              product: product,
                              favCubit: context.read<FavoriteCubit>(),
                            );
                          }
                        },
                        title: product.sizes[index],
                      )
                      : state.favorite!.size == product.sizes[index]
                      ? U.Button(
                        title: product.sizes[index],
                        size: U.ButtonSize.s,
                        onTap: () {},
                        bordeRaius: U.Theme.r8,
                        color: U.Theme.primary,
                      )
                      : NotSelectedButton(
                        onPressed: () {
                          final temp = favCubit.onSizeSelected(
                            item: product,
                            size: product.sizes[index],
                          );
                          if (temp) {
                            print('fucking A');
                            FavoriteColorBtms.show(
                              context,
                              product: product,
                              favCubit: context.read<FavoriteCubit>(),
                            );
                            // GoRouter.of(context).pop();
                          }
                        },
                        title: product.sizes[index],
                      );
                },
              ),
            ),
            Divider(thickness: 0.4),
            SizedBox(height: 16),
            Row(
              children: [
                SizedBox(width: 15),
                U.Text(
                  'اطلاعات سایز ها',
                  weight: U.TextWeight.regular,

                  fontSize: U.TextSize.s16,
                ),
                Spacer(),
                U.Image.Icon(image: U.Icons.chevron),
                SizedBox(width: 11),
              ],
            ),
            SizedBox(height: 16),
            Divider(thickness: 0.4),

            SizedBox(height: 116),
          ],
        );
      },
    );
  }
}
