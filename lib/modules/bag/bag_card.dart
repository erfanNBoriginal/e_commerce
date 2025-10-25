import 'package:e_commerce/domains/models/bag_item.dart';
import 'package:e_commerce/domains/models/favorite.dart';
import 'package:e_commerce/modules/bag/cubit/bag_cubit.dart';
import 'package:e_commerce/modules/favorite/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:provider/provider.dart';

class BagCard extends StatelessWidget {
  final BagItem bagItem;
  final bool isFav;
  const BagCard({super.key, required this.bagItem, required this.isFav});

  @override
  Widget build(BuildContext context) {
    final favCubit = context.read<FavoriteCubit>();
    final bagCubit = context.read<BagCubit>();
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 22),
      child: Container(
        height: 116,
        // width: 44,
        decoration: BoxDecoration(
          color: U.Theme.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              child: U.Image(
                boxfit: BoxFit.fill,
                height: 104,
                width: 104,
                image: bagItem.product.image,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 11, top: 11, bottom: 11),

                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    U.Text(bagItem.product.title),
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        U.Text(
                                          'color: color',
                                          color: U.Theme.gray,
                                          fontSize: U.TextSize.s11,
                                          weight: U.TextWeight.regular,
                                        ),
                                        SizedBox(width: 4),
                                        U.Text(
                                          'Size:',
                                          color: U.Theme.gray,
                                          fontSize: U.TextSize.s11,
                                          weight: U.TextWeight.regular,
                                        ),
                                        SizedBox(width: 4),
                                        U.Text(
                                          bagItem.size!,

                                          weight: U.TextWeight.regular,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                //U.Image.Icon(image: U.Icons.more, size: 24),//
                                PopupMenuButton<int>(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  elevation: 4,
                                  offset: const Offset(
                                    0,
                                    40,
                                  ), // positions menu below button
                                  color: Colors.white,
                                  itemBuilder:
                                      (context) => [
                                        PopupMenuItem<int>(
                                          value: 0,
                                          child: U.Text(
                                            isFav
                                                ? 'Remove from Favorites'
                                                : 'Add to favorites',
                                          ),
                                        ),
                                        PopupMenuItem<int>(
                                          value: 1,
                                          child: U.Text('Delete from the list'),
                                        ),
                                      ],
                                  onSelected: (value) {
                                    if (value == 0) {
                                      isFav
                                          ? favCubit.onProductRemoved(
                                            bagItem.product,
                                          )
                                          : favCubit.onAddedtoFavorites(
                                            Favorite(
                                              product: bagItem.product,
                                              color: bagItem.color,
                                              size: bagItem.size,
                                            ),
                                          );
                                    } else if (value == 1) {
                                      // Delete logic
                                    }
                                  },
                                  icon: Icon(Icons.more_vert),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 14),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              U.Counter(
                                onIncremented: () {},
                                onAdded: () {
                                  context.read<BagCubit>().onAddedToCart(
                                    bagItem,
                                  );
                                },
                                count: bagItem.count,
                              ),
                              Spacer(),
                              U.Text(
                                (bagItem.product.price * bagItem.count)
                                    .toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
