import 'package:e_commerce/domains/models/bag_item.dart';
import 'package:e_commerce/domains/models/favorite.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/modules/bag/cubit/bag_cubit.dart';
import 'package:e_commerce/modules/favorite/cubit/favorite_cubit.dart';
import 'package:e_commerce/modules/favorite/favorite_color_btms.dart';
import 'package:e_commerce/modules/favorite/favorite_size_btms.dart';
import 'package:e_commerce/modules/product_info/product_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '/ui_kit.dart/ui_kit.dart' as U;

class FavoriteCard extends StatelessWidget {
  final Favorite favorite;
  final double? width;
  final double? height;
  const FavoriteCard({
    super.key,
    required this.favorite,
    this.width = 150,
    this.height = 269,
  });
  double getOff() {
    double temp = 0;
    temp = favorite.product.price * (favorite.product.off! / 100);
    return favorite.product.price - temp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(
          queryParameters: {'id': favorite.product.id.toString()},
          ProductInfoPage.path,
          extra: favorite.product,
        );
      },
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 184,
                  width: width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: U.Image(
                      // height: 104,
                      boxfit: BoxFit.fill,
                      image: favorite.product.image,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    U.Stars(
                      stars: favorite.product.getRating.round(),
                      rateCount: favorite.product.ratings.length,
                    ),
                    SizedBox(width: 4),
                  ],
                ),
                U.Text(
                  fontSize: U.TextSize.s11,
                  weight: U.TextWeight.regular,
                  color: U.Theme.gray,
                  favorite.product.brand,
                ),
                Text(
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  favorite.product.title,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Row(
                  children: [
                    U.Text(
                      fontSize: U.TextSize.s11,
                      weight: U.TextWeight.regular,
                      color: U.Theme.gray,
                      'Color: ',
                    ),
                    U.Text(
                      fontSize: U.TextSize.s11,
                      weight: U.TextWeight.regular,
                      color: U.Theme.gray,
                      'test',
                    ),
                    SizedBox(width: 25),
                    U.Text(
                      fontSize: U.TextSize.s11,
                      weight: U.TextWeight.regular,
                      color: U.Theme.gray,
                      'Size: ',
                    ),
                    U.Text(
                      fontSize: U.TextSize.s11,
                      weight: U.TextWeight.regular,
                      color: U.Theme.gray,
                      ' ${favorite.size}',
                    ),
                  ],
                ),
                Row(
                  children: [
                    U.Text(
                      lineThrough: favorite.product.off != null,
                      '${favorite.product.price.toString()}\$',
                    ),
                    SizedBox(width: 5),
                    if (favorite.product.off != null)
                      U.Text(
                        weight: U.TextWeight.medium,
                        color: U.Theme.primary,
                        '${getOff().toString()}\$',
                      ),
                  ],
                ),
              ],
            ),
            BlocBuilder<BagCubit, BagState>(
              builder: (context, state) {
                final temp =
                    state.bagItems
                        .where((element) => element.product == favorite.product)
                        .firstOrNull;
                return Positioned(
                  left: 1,
                  bottom: 60,
                  child:
                      temp == null
                          ? InkWell(
                            onTap: () {
                              context.read<BagCubit>().onAddedToCart(
                                BagItem(
                                  product: favorite.product,
                                  size: favorite.size,
                                  color: favorite.color,
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                color: U.Theme.white,
                                shape: BoxShape.circle,
                              ),
                              child: U.Image.Icon(size: 13, image: U.Icons.bag),
                            ),
                          )
                          : InkWell(
                            onTap: () {
                              // context.read<FavoriteCubit>().onProductRemoved(
                              //   favorite.product,
                              // );
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                color: U.Theme.primary,
                                shape: BoxShape.circle,
                              ),
                              child: U.Image.Icon(
                                size: 36,
                                image: U.Icons.bagButton,
                              ),
                            ),
                          ),
                );
              },
            ),

            if (favorite.product.off != null || favorite.product.newProduct)
              Positioned(
                top: 8,
                right: 5,
                child: Row(
                  children: [
                    if (favorite.product.off != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Container(
                          width: 40,
                          height: 24,
                          decoration: BoxDecoration(
                            color: U.Theme.primary,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: Center(
                            child: U.Text(
                              fontSize: U.TextSize.s11,
                              weight: U.TextWeight.semiBold,
                              color: U.Theme.white,
                              '- ${favorite.product.off.toString()}%',
                            ),
                          ),
                        ),
                      ),
                    if (favorite.product.newProduct)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Container(
                          width: 40,
                          height: 24,
                          decoration: BoxDecoration(
                            color: U.Theme.black,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: Center(
                            child: U.Text(
                              fontSize: U.TextSize.s11,
                              weight: U.TextWeight.semiBold,
                              color: U.Theme.white,
                              'جدید',
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            Positioned(
              top: 0,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  context.read<FavoriteCubit>().onProductRemoved(
                    favorite.product,
                  );
                },
                child: U.Image.Icon(
                  color: U.Theme.white,
                  image: U.Icons.remove,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
