import 'package:e_commerce/domains/shop_repo.dart';
import 'package:e_commerce/modules/shop/category_text.dart';
import 'package:e_commerce/modules/shop/cubit/shop_cubit.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopPage extends StatelessWidget {
  static final String path = '/shop';
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(repo: context.read<ShopRepo>()),
      child: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          return ListView(
            children: [
              U.AppBar(back: false, title: 'دسته بندی ها'),
              SizedBox(height: 16),
             if(state.loading) SizedBox(
              height: MediaQuery.of(context).size.height - 88,
              child: Center(child: CircularProgressIndicator()))
              else
             ...[Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: U.Button(
                  title: 'مشاهده همه آیتم ها',
                  size: U.ButtonSize.l,
                  onTap: () {},
                  bordeRaius: U.Theme.r25,
                  color: U.Theme.primary,
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: U.Text('دسته بندی انتخاب کن', color: U.Theme.gray),
              ),
              SizedBox(height: 17),
              ...state.categories.expand((e) =>[
                 CategoryText(category: e),
                   Container(
              color: U.Theme.gray,height: 0.2,
            width: double.infinity,
            )
                 ]),
              SizedBox(height: 111),]
              // SizedBox(
              //   height: 482,
              //   child: ListView.builder(
              //     itemCount: state.categories.length,
              //     itemBuilder: (context, index) {
              //       return CategoryText(title: state.categories[index].title);
              //     },
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
