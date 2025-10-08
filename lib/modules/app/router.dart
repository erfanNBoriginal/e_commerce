import 'package:e_commerce/gallery_page.dart';
import 'package:e_commerce/modules/category/category_page.dart';
import 'package:e_commerce/modules/home/home.dart';
import 'package:e_commerce/modules/product_info/product_shell.dart';
import 'package:e_commerce/modules/shop/shop_page.dart';
import 'package:e_commerce/modules/product_info/product_info_page.dart';
import 'package:e_commerce/modules/store/store_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  initialLocation: StrorePage.path,
  navigatorKey: rootNavKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) => HomeShell(
            hideNavBar: state.topRoute!.name == ProductInfoPage.path,
            page: navigationShell,
          ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: StrorePage.path,
              builder: (context, state) {
                return StrorePage();
              },
              routes: [
                GoRoute(
                  //  parentNavigatorKey: rootNavKey,
                  path: ProductInfoPage.path,
                  name: ProductInfoPage.path,
                  builder:
                      (context, state) =>
                          ProductInfoPage(product: state.extra as dynamic),
                ),

                // StatefulShellRoute.indexedStack(
                //   builder:
                //       (context, state, navigationShell) =>
                //           ProductShell(child: navigationShell),
                //   branches: [
                //     StatefulShellBranch(
                //       routes: [
                //         GoRoute(
                //           //  parentNavigatorKey: rootNavKey,
                //           path: ProductInfoPage.path,
                //           name: ProductInfoPage.path,
                //           builder:
                //               (context, state) => ProductInfoPage(
                //                 product: state.extra as dynamic,
                //               ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ShopPage.path,
              builder: (context, state) {
                return ShopPage();
              },
              routes: [
                GoRoute(
                  path: CategoryPage.path,
                  name: CategoryPage.path,
                  builder:
                      (context, state) => CategoryPage(
                        id: int.parse(state.pathParameters['id']!),
                      ),
                ),
              ],
            ),
          ],
        ),
        // StatefulShellBranch(
        //   routes: [
        //     GoRoute(
        //       path: GalleryPage.path,
        //       builder: (context, state) {
        //         return GalleryPage();
        //       },
        //     ),
        //   ],
        // ),
      ],
    ),
  ],
);
