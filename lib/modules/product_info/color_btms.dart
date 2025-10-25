import 'package:e_commerce/domains/bag_repo.dart';
import 'package:e_commerce/domains/models/bag_item.dart';
import 'package:e_commerce/domains/models/product.dart';
import 'package:e_commerce/modules/bag/cubit/bag_cubit.dart';
import 'package:e_commerce/modules/product_info/cubit/product_cubit.dart';
import 'package:e_commerce/modules/product_info/not_selected_button.dart';
import 'package:e_commerce/modules/product_info/select_color.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorBottomSheet extends StatelessWidget {
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
          child: ColorBottomSheet(product: product),
        );
      },
    );
  }

  const ColorBottomSheet({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bagCubit = context.read<BagCubit>();
    return BlocBuilder<BagCubit, BagState>(
      builder: (context, state) {
        final temp = state.bagItem;

        return ListView(
          children: [
            Center(
              child: U.Text(
                'Select Color',
                fontSize: U.TextSize.s18,
                weight: U.TextWeight.semiBold,
              ),
            ),
            SizedBox(height: 22),
            SizedBox(
              height: 292,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: product.colors.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      3 > product.colors.length ? product.colors.length : 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.5 / 1,
                ),
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return SelectColor(
                    color: product.colors[index],
                    onPressed: () {
                      bagCubit.onColorSelected(
                        product: product,
                        color: product.colors[index],
                      );
                    },
                    isSelected:
                        temp == null
                            ? false
                            : temp.color == product.colors[index]
                            ? true
                            : false,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
