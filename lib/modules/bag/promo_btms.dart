import 'package:e_commerce/domains/bag_repo.dart';
import 'package:e_commerce/modules/bag/cubit/bag_cubit.dart';
import 'package:e_commerce/modules/bag/promo_card.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';

class PromoBottomSheet extends StatelessWidget {
  const PromoBottomSheet({super.key});
  static show(BuildContext context, {required BagCubit bagCubit}) {
    U.BottomSheet.show(
      useNavKey: true,
      context,
      builder: (context) {
        return MultiBlocProvider(
          providers: [BlocProvider.value(value: bagCubit)],
          child: PromoBottomSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bagCubit = context.read<BagCubit>();
    return BlocBuilder<BagCubit, BagState>(
      builder: (context, state) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: U.TextInput(
                title: 'کد تخفیف خود را وارد کنید',
                textCtrl: bagCubit.textCtrl,
              ),
            ),
            SizedBox(height: 30),
            U.Text(
              'کد های تخفیف قابل استفاده',
              weight: U.TextWeight.semiBold,
              fontSize: U.TextSize.s18,
            ),
            SizedBox(height: 18),
            ...state.promoCodes.map((e) {
              return PromoCard(
                loading: state.selectedCode == e && state.loading,
                isSelected: state.selectedCode?.name == e.name,
                code: e,
              );
            }),
          ],
        );
      },
    );
  }
}
