import 'package:e_commerce/gallery_page.dart';
import 'package:e_commerce/modules/bag/bag_page.dart';
import 'package:e_commerce/modules/category/brands.dart';
import 'package:e_commerce/modules/category/category_page.dart';
import 'package:e_commerce/modules/category/cubit/category_cubit.dart';
import 'package:e_commerce/modules/category/filters_page.dart';
import 'package:e_commerce/modules/checkout/checkout_page.dart';
import 'package:e_commerce/modules/favorite/favorites_page.dart';
import 'package:e_commerce/modules/home/home.dart';
import 'package:e_commerce/modules/rating/rating_page.dart';
import 'package:e_commerce/modules/profile/orders_page.dart';
import 'package:e_commerce/modules/profile/settings_page.dart';
import 'package:e_commerce/modules/shop/shop_page.dart';
import 'package:e_commerce/modules/product_info/product_info_page.dart';
import 'package:e_commerce/modules/store/store_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  initialLocation: StrorePage.path,
  navigatorKey: rootNavKey,
  redirect: (context, state) {
    // print(state.fullPath);
    // print('state.fullPath');
    return null;
  },
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        bool check() {
          if (state.fullPath!.contains(FiltersPage.path) ||
              state.fullPath!.contains(ProductInfoPage.path) ||
              state.fullPath!.contains(CheckoutPage.path) ||
              state.fullPath!.contains(RatingPage.path)) {
            return true;
          }
          return false;
        }

        return HomeShell(
          hideNavBar: check(),
          // [
          // FiltersPage.path,
          // ProductInfoPage.path,
          // ].contains(state.topRoute!.name),
          page: navigationShell,
        );
      },
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
                  path: RatingPage.path,
                  name: RatingPage.path,
                  builder:
                      (context, state) => RatingPage(
                        initialProduct: state.extra as dynamic,
                        id: int.parse(state.pathParameters['id']!),
                      ),
                ),
                GoRoute(
                  //  parentNavigatorKey: rootNavKey,
                  path: ProductInfoPage.path,
                  name: ProductInfoPage.path,
                  builder:
                      (context, state) => ProductInfoPage(
                        id:
                            state.uri.queryParameters['id'] != null
                                ? int.parse(state.uri.queryParameters['id']!)
                                : null,
                        product: state.extra as dynamic,
                      ),
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
                  redirect: (context, state) {
                    // print('categoryyyy state.extraaaaaaaaaaaaaaaaaaaa');
                    // print(state.extra);
                    // print(state.pathParameters['id']);
                    // print('state.topRoute!.name');
                    // print(state.topRoute!.name);

                    // return null;
                  },
                  path: CategoryPage.path,
                  name: CategoryPage.path,
                  builder:
                      (context, state) => CategoryPage(
                        id: int.parse(state.pathParameters['id']!),
                        initial: state.extra as dynamic,
                      ),
                  routes: [
                    GoRoute(
                      redirect: (context, state) {
                        // print('state.extraaaaaaaaaaaaaaaaaaaa');
                        // print(state.extra);
                        // print(
                        //   'state.pathParameters['
                        //   ']',
                        // );

                        // print('state.topRoute!.name');
                        // print(state.topRoute!.name);
                        // print('filter extraddd');
                        // print(state.extra);
                        // return null;
                      },
                      path: FiltersPage.path,
                      name: FiltersPage.path,
                      builder:
                          (context, state) => FiltersPage(
                            categoryCubit: state.extra as CategoryCubit,
                            id: int.parse(state.pathParameters['id']!),
                          ),
                      routes: [
                        GoRoute(
                          redirect: (context, state) {
                            // print('brands id');
                            // print(state.pathParameters['id']);
                            // return null;
                          },
                          path: BrandsPage.path,
                          name: BrandsPage.path,
                          builder:
                              (context, state) => BrandsPage(
                                id: int.parse(state.pathParameters['id']!),
                                categoryCubit: state.extra as CategoryCubit,
                              ),
                        ),
                      ],
                    ),
                  ],
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
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: BagPage.path,
              name: BagPage.path,
              builder: (context, state) => BagPage(),
            routes: [
              GoRoute(path: CheckoutPage.path,
              name: CheckoutPage.path,
              builder: (context, state) => CheckoutPage(
                bagItems: state.extra as dynamic,
              ),
              )
            ]
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: FavoritesPage.path,
              name: FavoritesPage.path,
              builder: (context, state) => FavoritesPage(),
            ),
          ],
        ),
        StatefulShellBranch(routes: [
          GoRoute(
            path: ProfilePage.path,name: ProfilePage.path,
            builder: (context, state) => ProfilePage(),
            routes: [
              GoRoute(path: OrdersPage.path,
              name: OrdersPage.path,
              builder: (context, state) => OrdersPage(),
              )
            ]
          )
        ])
      ],
    ),
  ],
);
