import 'package:e_commerce/domains/models/promod_code.dart';
import 'package:e_commerce/modules/bag/cubit/bag_cubit.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PromoCard extends StatelessWidget {
  final PromodCode code;
  final bool isSelected;
  final bool loading;
  const PromoCard({
    super.key,
    required this.code,
    required this.isSelected,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24),
      child: Container(
        decoration: BoxDecoration(
          color: U.Theme.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                child: U.Image(
                  boxfit: BoxFit.fill,
                  height: 80,
                  width: 80,
                  image: code.image,
                ),
              ),
              SizedBox(width: 14),
              Column(
                children: [
                  U.Text(
                    code.name,
                    weight: U.TextWeight.medium,
                    fontSize: U.TextSize.s14,
                  ),
                  SizedBox(height: 4),
                  U.Text(
                    code.type,
                    weight: U.TextWeight.regular,
                    fontSize: U.TextSize.s11,
                  ),
                ],
              ),
              Column(
                children: [
                  U.Text(
                    code.remainingDays,
                    weight: U.TextWeight.regular,
                    fontSize: U.TextSize.s11,
                    color: U.Theme.gray,
                  ),
                  SizedBox(height: 7),
                  SizedBox(
                    width: 90,
                    child:
                        loading
                            ? Center(child: CircularProgressIndicator())
                            : isSelected
                            ? U.OutlineButton(
                              onTap: () {},
                              borderType: U.BorderVariants.black,
                              size: U.OutlineButtonSize.small,
                              title: 'اعمال شد',
                            )
                            : U.Button(
                              title: 'اعمال کردن',
                              size: U.ButtonSize.s,
                              onTap: () async {
                                final result = await context
                                    .read<BagCubit>()
                                    .applyPromodCode(code);
                                // if (result) GoRouter.of(context).pop();
                              },
                              bordeRaius: U.Theme.r25,
                              color: U.Theme.primary,
                            ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
