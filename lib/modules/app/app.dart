import 'dart:ui';
import 'package:e_commerce/domains/favorite_repo.dart';
import 'package:e_commerce/domains/shop_repo.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:e_commerce/domains/bag_repo.dart';
import 'package:e_commerce/domains/repository.dart';
import 'package:e_commerce/modules/app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => Repository()),
        RepositoryProvider(create: (context) => FavoriteRepo()),
        RepositoryProvider(create: (context) => BagRepo()),
        RepositoryProvider(create: (context) => ShopRepo()),
      ],

      child: OverlaySupport.global(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: {
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          },
          supportedLocales: [Locale('en', 'UK'), Locale('fa', 'IR')],
          builder: (context, child) {
            return MediaQuery.withNoTextScaling(child: child!);
          },
          locale: Locale('fa', 'IR'),
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.stylus,
              PointerDeviceKind.touch,
              PointerDeviceKind.trackpad,
              PointerDeviceKind.invertedStylus,
            },
          ),

          routerConfig: router,
        ),
      ),
    );
  }
}
