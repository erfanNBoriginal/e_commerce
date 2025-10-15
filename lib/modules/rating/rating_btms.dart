import 'package:e_commerce/domains/models/rating.dart';
import 'package:e_commerce/domains/shop_repo.dart';
import 'package:e_commerce/modules/rating/cubit/rating_cubit.dart';
import 'package:e_commerce/ui_kit.dart/pick_star.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RatingBottomSheet extends StatelessWidget {
  static show(BuildContext context, {required RatingCubit ratingCubit}) {
    U.BottomSheet.show(
      context,
      maxHeight: 612,
      builder: (context) {
        return MultiBlocProvider(
          providers: [BlocProvider.value(value: ratingCubit)],
          child: RatingBottomSheet(),
        );
      },
    );
  }

  const RatingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ratingCubit = context.read<RatingCubit>();
    return BlocBuilder<RatingCubit, RatingState>(
      builder: (context, state) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  U.Text(
                    'What is your rate?',
                    fontSize: U.TextSize.s18,
                    weight: U.TextWeight.semiBold,
                  ),
                  SizedBox(height: 17),
                  PickStar(onTap: ratingCubit.onStarsSelected),
                  SizedBox(height: 32),
                  U.Text(
                    'Please enter your oponion?',
                    fontSize: U.TextSize.s18,
                    weight: U.TextWeight.semiBold,
                  ),
                  SizedBox(height: 16),
                  U.TextInput(
                    title: 'Your review',
                    textCtrl: ratingCubit.ctrl,
                    height: 148,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16,
              left: 16,
              bottom: 16,
              child:
                  state.loading
                      ? Center(child: CircularProgressIndicator())
                      : U.Button(
                        title: 'send review',
                        size: U.ButtonSize.l,
                        onTap: () async {
                          final temp = await ratingCubit.onAddReviewPressed(
                            Rating(
                              rating: ratingCubit.ctrl.text,
                              stars: state.stars,
                            ),
                          );
                          if (temp) {
                            GoRouter.of(context).pop();
                          }
                        },
                        bordeRaius: U.Theme.r25,
                        color: U.Theme.primary,
                      ),
            ),
          ],
        );
      },
    );
  }
}
