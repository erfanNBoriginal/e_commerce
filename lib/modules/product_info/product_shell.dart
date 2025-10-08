import 'package:e_commerce/domains/bag_repo.dart';
import 'package:e_commerce/modules/bag/cubit/bag_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class ProductShell extends StatelessWidget {
  static final String path = '/ProductSHell';

  final StatefulNavigationShell child;

  const ProductShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return BagCubit(repository: context.read<BagRepo>());
      },
      child: Builder(
        builder: (context) {
          final bagCubit = context.read<BagCubit>();
          return Stack(
            children: [
              child,
              // Positioned(
              //   left: 0,
              //   right: 0,
              //   bottom: 0,
              //   child: Material(
              //     elevation: 7,
              //     child: Container(
              //       padding: EdgeInsets.all(16),
              //       height: 78,
              //       child: U.Button(
              //         title: 'افزودن به سبد خرید',
              //         size: U.ButtonSize.l,
              //         onTap: () {},
              //         bordeRaius: U.Theme.r25,
              //         color: U.Theme.primary,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
