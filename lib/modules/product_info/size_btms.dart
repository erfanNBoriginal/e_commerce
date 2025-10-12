import 'package:e_commerce/domains/bag_repo.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/modules/bag/cubit/bag_cubit.dart';
import 'package:e_commerce/modules/product_info/not_selected_button.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';

class SizeBottomSheet extends StatelessWidget {
  final Product product;
  static show(
    BuildContext context, {
    required Product product,
    required BagCubit bagCubit,
  }) {
    U.BottomSheet.show(
      maxWidth: 450,
      maxHeight: 368,
      context,

      builder: (context) {
        return MultiBlocProvider(
          providers: [BlocProvider.value(value: bagCubit)],
          child: SizeBottomSheet(product: product),
        );
      },
    );
  }

  const SizeBottomSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final bagCubit = context.read<BagCubit>();

    return BlocBuilder<BagCubit, BagState>(
      builder: (context, state) {
        print('state.bagItems.length');
        print(state.bagItems.length);

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
                  // print(state.bagItems)
                  for (var item in state.bagItems) {
                    print(
                      '${item.size} ${item.count} ${item.product.title} ${item.color?.a} ${item.color?.g} ${item.color?.b}',
                    );
                  }
                  // print('index');
                  // print(index);
                  // print('state.bagItems.length');
                  // print(state.bagItems.length);
                  // print(state.)
                  return
                  //  Container(color: Colors.red, width: 22, height: 22);
                  // temp.size == widget.product.sizes[index]
                  state.bagItems.indexWhere((e) {
                            return e.product.id == product.id;
                          }) ==
                          -1
                      ? NotSelectedButton(
                        onPressed: () {
                          print('index');
                          print(index);
                          // print(temp!.product.title);

                          // selectedSize = widget.product.sizes[index];
                          bagCubit.onSizeSelected(
                            product: product,
                            size: product.sizes[index],
                          );
                          // selectedSize = widget.product.sizes[index];
                          // setState(() {});
                        },
                        title: product.sizes[index],
                      )
                      : state
                              .bagItems[state.bagItems.indexWhere((e) {
                                return e.product.id == product.id;
                              })]
                              .size ==
                          product.sizes[index]
                      ? U.Button(
                        title: product.sizes[index],
                        size: U.ButtonSize.s,
                        onTap: () {
                          // cubit.onProductSizeChanged(
                          //   widget.product.sizes[index],
                          // );
                          // selectedSize = '';
                          // setState(() {});
                        },
                        bordeRaius: U.Theme.r8,
                        color: U.Theme.primary,
                      )
                      : NotSelectedButton(
                        onPressed: () {
                          print('index');
                          print(index);
                          bagCubit.onSizeSelected(
                            product: product,
                            size: product.sizes[index],
                          );
                          // selectedSize = widget.product.sizes[index];
                          // setState(() {});
                        },
                        title: product.sizes[index],
                      );
                  // selectedSize == widget.product.sizes[index]
                  //     ? U.Button(
                  //       title: widget.product.sizes[index],
                  //       size: U.ButtonSize.s,
                  //       onTap: () {
                  //         selectedSize = '';
                  //         setState(() {});
                  //       },
                  //       bordeRaius: U.Theme.r8,
                  //       color: U.Theme.primary,
                  //     )
                  //     : NotSelectedButton(
                  //       onPressed: () {
                  //         selectedSize = widget.product.sizes[index];
                  //         setState(() {});
                  //       },
                  //       title: widget.product.sizes[index],
                  //     );
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
            // Row(children: [

            //   ],
            //  ),//
          ],
        );
      },
    );
  }
}
