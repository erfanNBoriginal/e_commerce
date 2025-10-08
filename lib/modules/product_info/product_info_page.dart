import 'package:e_commerce/domains/bag_repo.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/modules/bag/cubit/bag_cubit.dart';
import 'package:e_commerce/modules/product_info/color_btms.dart';
import 'package:e_commerce/modules/product_info/size_btms.dart';
import 'package:e_commerce/ui_kit.dart/button.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductInfoPage extends StatelessWidget {
  static String path = '/ProductInfoPage';

  final Product product;

  const ProductInfoPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return BagCubit(repository: context.read<BagRepo>());
      },
      child: BlocListener<BagCubit, BagState>(
        listenWhen: (previous, current) {
          // final temp =
          //     previous.tempItems.where((e) => e.product == product).firstOrNull;
          // final temp2 =
          //     current.tempItems.where((e) => e.product == product).firstOrNull;
          //  return temp != temp2;
          return current.bagItems != previous.bagItems;
          // return previous.bagItems != current.bagItems;
        },
        listener: (context, state) {
          final bagCubit = context.read<BagCubit>();
          // print('product info page refresh');
          bagCubit.onRefresh();
        },
        child: BlocBuilder<BagCubit, BagState>(
          builder: (context, state) {
            final bagCubit = BlocProvider.of<BagCubit>(context);
            return Stack(
              children: [
                ListView(
                  // padding: EdgeInsets.all(11),
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(height: 20),
                    U.Image(
                      boxfit: BoxFit.scaleDown,
                      image: product.image,
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
                                    bagCubit: bagCubit,
                                    context,
                                    product: product,
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: U.Theme.gray,
                                      width: 0.4,
                                    ),
                                  ),
                                  height: 40,
                                  width: 138,
                                  child: Row(
                                    children: [
                                      U.Text('Size'),
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
                                    product: product,
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: U.Theme.gray,
                                      width: 0.4,
                                    ),
                                  ),
                                  height: 40,
                                  width: 138,
                                  child: Row(
                                    children: [
                                      U.Text('Black'),
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
                              U.Text(product.brand, fontSize: U.TextSize.s24),
                              Spacer(),
                              U.Text(product.price.toString()),
                            ],
                          ),
                          U.Text(
                            weight: U.TextWeight.regular,
                            fontSize: U.TextSize.s11,
                            product.title,
                          ),
                          U.Stars(
                            rateCount: product.ratings.length,
                            stars: product.getRating.toInt(),
                          ),
                          //SizedBox(height: 16),
                          U.Text(
                            fontSize: U.TextSize.s14,
                            color: U.Theme.black,
                            product.description,
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
                  child: U.AppBar(title: product.title),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: BlocBuilder<BagCubit, BagState>(
                    builder: (context, state) {
                      final bagCubit = context.read<BagCubit>();
                      final item =
                          state.bagItems
                              .where((element) => element.product == product)
                              .firstOrNull;
                      return Material(
                        elevation: 7,
                        child: Container(
                          padding: EdgeInsets.all(16),
                          height: 78,
                          child: U.Button(
                            title: 'Add to Cart',
                            size: ButtonSize.l,
                            onTap: () {
                              bagCubit.onAddedToCart(item);
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
        ),
      ),
    );
  }
}
