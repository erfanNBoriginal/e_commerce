import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/domains/shop_repo.dart';
import 'package:e_commerce/modules/rating/cubit/rating_cubit.dart';
import 'package:e_commerce/modules/rating/rating_btms.dart';
import 'package:e_commerce/modules/rating/rating_length.dart';
import 'package:e_commerce/modules/rating/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingPage extends StatelessWidget {
  static String path = '/ratings/:id';
  final int id;
  final Product? initialProduct;
  const RatingPage({this.initialProduct, super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => RatingCubit(
            initialProduct: initialProduct,
            repo: context.read<ShopRepo>(),
            id: id,
          ),
      child: BlocBuilder<RatingCubit, RatingState>(
        builder: (context, state) {
          return state.loading
              ? Center(child: CircularProgressIndicator())
              : switch (state.contentStatus) {
                RatingContentStatus.empty => Center(
                  child: U.Text('Emptyyyyy', fontSize: U.TextSize.s48),
                ),
                RatingContentStatus.filled => Scaffold(
                  body: Builder(
                    builder: (context) {
                      List<int> intTemp = [];
                      final temp = state.product!.ratings;
                      for (var element in temp) {
                        intTemp.add(element.stars);
                      }
                      return Scaffold(
                        backgroundColor: U.Theme.background,
                        body: Stack(
                          children: [
                            ListView(
                              children: [
                                U.AppBar(title: 'Ratings and Reviews'),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          U.Text(
                                            state.product!.getRating
                                                .ceilToDouble()
                                                .toString(),
                                            fontSize: U.TextSize.s48,
                                            weight: U.TextWeight.semiBold,
                                          ),
                                          // SizedBox(height: 15),
                                          U.Text(
                                            color: U.Theme.gray,
                                            '${state.product!.ratings.length} Ratings'
                                                .toString(),
                                            weight: U.TextWeight.regular,
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 28),
                                      Expanded(
                                        child: RatingLength(ratings: intTemp),
                                      ),
                                      SizedBox(width: 13),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 33),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Row(
                                    children: [
                                      U.Text(
                                        '${state.product!.ratings.length} Ratings',
                                        weight: U.TextWeight.semiBold,
                                        fontSize: U.TextSize.s24,
                                      ),
                                      Spacer(),
                                      U.CheckBox(
                                        color: U.CheckBoxColor.black,
                                        onTap: () {},
                                      ),
                                      // SizedBox(width: 13),
                                      U.Text('with photo'),
                                      SizedBox(width: 28),
                                    ],
                                  ),
                                ),
                                ...state.product!.ratings.expand(
                                  (e) => [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 16.0,
                                      ),
                                      child: ReviewWidget(rating: e),
                                    ),
                                    SizedBox(height: 15),
                                  ],
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Container(
                                height: 121,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.white,
                                      Colors.white,
                                      const Color.fromARGB(0, 255, 255, 255),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              right: 17,
                              bottom: 17,
                              child: U.Button(
                                title: 'Write a review',
                                size: U.ButtonSize.s,
                                onTap: () {
                                  RatingBottomSheet.show(
                                    context,
                                    ratingCubit: context.read<RatingCubit>(),
                                  );
                                },
                                bordeRaius: U.Theme.r25,
                                color: U.Theme.primary,
                                leading: U.Image.Icon(
                                  size: 13,
                                  image: U.Icons.pen,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                RatingContentStatus.error => throw UnimplementedError(),
              };
        },
      ),
    );
  }
}
