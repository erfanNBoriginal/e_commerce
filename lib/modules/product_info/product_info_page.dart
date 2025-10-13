import 'package:e_commerce/domains/bag_repo.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/domains/shop_repo.dart';
import 'package:e_commerce/modules/bag/cubit/bag_cubit.dart';
import 'package:e_commerce/modules/product_info/color_btms.dart';
import 'package:e_commerce/modules/product_info/cubit/product_cubit.dart';
import 'package:e_commerce/modules/product_info/size_btms.dart';
import 'package:e_commerce/ui_kit.dart/button.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductInfoPage extends StatelessWidget {
  static String path = '/ProductInfoPage';
  final Product? product;
  final int? id;
  const ProductInfoPage({super.key, this.id, this.product});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return BagCubit(repository: context.read<BagRepo>());
          },
        ),
        BlocProvider(
          create: (context) {
            return ProductCubit(
              repo: context.read<ShopRepo>(),
              product: product,
              id: id,
            );
          },
        ),
      ],
      child: BlocBuilder<BagCubit, BagState>(
        builder: (context, state) {
          final bagCubit = BlocProvider.of<BagCubit>(context);
          return BlocBuilder<ProductCubit, ProductState>(
            builder: (context, productState) {
              return productState.loading
                  ? Center(child: CircularProgressIndicator())
                  : Stack(
                    children: [
                      ListView(
                        // padding: EdgeInsets.all(11),
                        scrollDirection: Axis.vertical,
                        children: [
                          SizedBox(height: 20),
                          U.Image(
                            boxfit: BoxFit.scaleDown,
                            image: productState.product!.image,
                            height: 413,
                          ),
                          SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        SizeBottomSheet.show(
                                          context,
                                          bagCubit: bagCubit,
                                          product: productState.product!,
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(9),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                          border: Border.all(
                                            color: U.Theme.gray,
                                            width: 0.4,
                                          ),
                                        ),
                                        height: 40,
                                        width: 138,
                                        child: Row(
                                          children: [
                                            U.Text(
                                              state.bagItems.isEmpty
                                                  ? 'Size'
                                                  : state.bagItems.first.size
                                                      .toString(),
                                            ),
                                            Spacer(),
                                            U.Image.Icon(
                                              size: 9,
                                              image: U.Icons.dropdown,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    GestureDetector(
                                      onTap: () {
                                        ColorBottomSheet.show(
                                          bagCubit: context.read<BagCubit>(),

                                          context,
                                          product: productState.product!,
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(9),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                          border: Border.all(
                                            color: U.Theme.gray,
                                            width: 0.4,
                                          ),
                                        ),
                                        height: 40,
                                        width: 138,
                                        child: Row(
                                          children: [
                                            U.Text(
                                              'Black',
                                              // state.bagItems.isEmpty
                                              //     ? 'Black'
                                              //     : state.bagItems.first.color
                                              //         .toString(),
                                            ),
                                            Spacer(),
                                            U.Image.Icon(
                                              size: 8,
                                              image: U.Icons.dropdown,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 22),
                                Row(
                                  children: [
                                    U.Text(
                                      productState.product!.brand,
                                      fontSize: U.TextSize.s24,
                                    ),
                                    Spacer(),
                                    U.Text(
                                      productState.product!.price.toString(),
                                    ),
                                  ],
                                ),
                                U.Text(
                                  weight: U.TextWeight.regular,
                                  fontSize: U.TextSize.s11,
                                  productState.product!.title,
                                ),
                                U.Stars(
                                  rateCount:
                                      productState.product!.ratings.length,
                                  stars:
                                      productState.product!.getRating.toInt(),
                                ),
                                //SizedBox(height: 16),
                                U.Text(
                                  fontSize: U.TextSize.s14,
                                  color: U.Theme.black,
                                  productState.product!.description,
                                ),
                              ],
                            ),
                          ),

                          Divider(thickness: 0.4),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              SizedBox(width: 15),
                              U.Text(
                                'اطلاعات آیتم ها',
                                weight: U.TextWeight.regular,
                                fontSize: U.TextSize.s16,
                              ),
                              Spacer(),
                              U.Image.Icon(image: U.Icons.chevron),
                              SizedBox(width: 11),
                            ],
                          ),
                          SizedBox(height: 16),
                          //    Divider(thickness: 0.4),
                          Divider(thickness: 0.4),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              SizedBox(width: 15),
                              U.Text(
                                'اطلاعات ارساا',
                                weight: U.TextWeight.regular,
                                fontSize: U.TextSize.s16,
                              ),
                              Spacer(),
                              U.Image.Icon(image: U.Icons.chevron),
                              SizedBox(width: 11),
                            ],
                          ),
                          SizedBox(height: 16),
                          //    Divider(thickness: 0.4),
                          Divider(thickness: 0.4),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              SizedBox(width: 15),
                              U.Text(
                                'خدمات',
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
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: U.Text('مشابه'),
                          ),
                          SizedBox(height: 80),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        child: U.AppBar(title: productState.product!.title),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: BlocBuilder<BagCubit, BagState>(
                          builder: (context, state) {
                            final bagCubit = context.read<BagCubit>();
                            // print('state.bagItems.length');
                            print("state.loading");
                            print(state.loading);
                            final item =
                                state.bagItems
                                    .where(
                                      (element) =>
                                          element.product.id ==
                                          productState.product!.id,
                                    )
                                    .firstOrNull;
                            // if (item != null) {
                            //   // print('item.size');
                            //   // print(item.size);
                            // } else {
                            //   //          print('nulllll');
                            // }
                            return state.loading
                                ? Center(child: CircularProgressIndicator())
                                : Material(
                                  elevation: 7,
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    height: 78,
                                    child: U.Button(
                                      title: 'Add to Cart',
                                      size: ButtonSize.l,
                                      onTap: () async {
                                        await bagCubit.onAddedToCart(item);
                                        print('state.bagItems.length');
                                        print(state.bagItems.length);
                                      },
                                      bordeRaius: U.Theme.r25,
                                      color: U.Theme.primary,
                                    ),
                                  ),
                                );
                          },
                        ),
                      ),
                    ],
                  );
            },
          );
        },
      ),
    );
  }
}
