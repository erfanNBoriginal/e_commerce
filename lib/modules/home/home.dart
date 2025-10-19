import 'package:e_commerce/modules/home/cubit/home_cubit.dart';
import 'package:e_commerce/ui_kit.dart/navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce/ui_kit.dart/ui_kit.dart' as U;

class HomeShell extends StatelessWidget {
  static final String path = '/home';
  final StatefulNavigationShell page;
  final bool hideNavBar;
  const HomeShell({super.key, required this.page, required this.hideNavBar});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(
        builder: (context) {
          final homeCubit = BlocProvider.of<HomeCubit>(context);
          homeCubit.onIndexChanged(page.currentIndex);
          return Scaffold(
            body: Stack(
              children: [
                Column(children: [Expanded(child: page)]),
                AnimatedPositioned(
                  left: 0,
                  right: 0,
                  bottom: hideNavBar ? -50 : 0,
                  duration: Duration(milliseconds: 1000),
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return U.BottomNavigationBar(
                        selectedIndex: page.currentIndex,
                        onTap: page.goBranch,
                        items: [
                          U.NavigationBarItem(
                            // onTap: () {},
                            size: 30,
                            notActivePath: U.Icons.home,
                            activePath: U.Icons.homeActivate,
                            title: 'home',
                            // isSelected: page.currentIndex == 1,
                          ),
                          U.NavigationBarItem(
                            size: 30,
                            notActivePath: U.Icons.shop,
                            activePath: U.Icons.shopActivated,

                            title: 'shop',
                          ),
                          U.NavigationBarItem(
                            size: 30,
                            notActivePath: U.Icons.favorite,
                            activePath: U.Icons.favoriteActive,

                            title: 'favorites',
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
