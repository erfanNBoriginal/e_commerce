import 'package:e_commerce/modules/category/category_page.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;
import 'package:go_router/go_router.dart';

class CategoryText extends StatelessWidget {
  final String title;
  final int id;
  const CategoryText({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).goNamed(CategoryPage.path, pathParameters: {'id': id.toString()});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: U.Text(
              title,
              fontSize: U.TextSize.s16,
              weight: U.TextWeight.regular,
            ),
          ),
          SizedBox(height: 17),
          Divider(thickness: 0.4, color: U.Theme.gray),
        ],
      ),
    );
  }
}
