import 'package:e_commerce/domains/favorite_repo.dart';
import 'package:e_commerce/domains/repository.dart';
import 'package:e_commerce/modules/favorite/cubit/favorite_cubit.dart';
import 'package:e_commerce/modules/favorite/favorite_color_btms.dart';
import 'package:e_commerce/modules/home/cubit/home_cubit.dart';
import 'package:e_commerce/modules/store/cubit/store_cubit.dart';
import 'package:e_commerce/modules/store/product_card.dart';
import 'package:e_commerce/modules/store/store_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class StrorePage extends StatelessWidget {
  static String path = '/store';
  const StrorePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StoreCubit(repo: context.read<Repository>()),
        ),
        BlocProvider(
          create:
              (context) => FavoriteCubit(repo: context.read<FavoriteRepo>()),
        ),
      ],
      child: BlocListener<HomeCubit, HomeState>(
        listenWhen: (previous, current) => current.selectedIndex == 0,
        listener: (context, state) {
          print('listneddddddd store');
          final favCubit = context.read<FavoriteCubit>();
          favCubit.onRefresh();
        },
        child: BlocBuilder<StoreCubit, StoreState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: U.Theme.background,
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    StoreBanner(),
                    SizedBox(height: 37),
                    Row(
                      children: [
                        U.Text(
                          fontSize: U.TextSize.s34,
                          'فروش ویژه',
                          weight: U.TextWeight.bold,
                        ),
                        Spacer(),
                        U.TextButton(text: 'مشاهده همه', onTap: () {}),
                      ],
                    ),
                    SizedBox(height: 6),
                    U.Text(
                      weight: U.TextWeight.regular,
                      'تخفیفات داغ تابستونی',
                      fontSize: U.TextSize.s11,
                      color: U.Theme.gray,
                    ),
                    SizedBox(height: 22),

                    // ProductCard(
                    //   product: Product(
                    //     id: 1,
                    //     image: 'assets/images/pants2.png',
                    //     title: 'pull over',
                    //     description: 'description',
                    //     price: 51,
                    //     off: 20,
                    //     categoryData: CategoryData(id: 1, title: 'blouse'),
                    //     brand: 'Mango',
                    //     ratings: [
                    //       Rating(rating: 'sdadsd', stars: 3),
                    //       Rating(rating: 'djfhnsd', stars: 2),
                    //     ],
                    //   ),
                    //   //  type: Type.sale,
                    // ),
                    SizedBox(
                      height: 289,
                      child: ListView.separated(
                        padding: EdgeInsets.all(7),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductCard(
                            product: state.salesProducts[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 16);
                        },
                        itemCount: state.salesProducts.length,
                      ),
                    ),
                    SizedBox(height: 37),
                    U.Text(
                      weight: U.TextWeight.bold,
                      fontSize: U.TextSize.s34,
                      'جدید',
                    ),
                    SizedBox(height: 6),
                    U.Text(
                      weight: U.TextWeight.regular,
                      'تاحلا هیچ جا ندیدیش',
                      fontSize: U.TextSize.s11,
                      color: U.Theme.gray,
                    ),
                    SizedBox(height: 22),
                    SizedBox(
                      height: 289,
                      child: ListView.separated(
                        padding: EdgeInsets.all(7),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductCard(product: state.newProducts[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 16);
                        },
                        itemCount: state.newProducts.length,
                      ),
                    ),
                    SizedBox(height: 84),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
