import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/src/splash_screen.dart';

import '../src/entry.dart';
import '../src/onboard.dart';
import '../src/product_deatil/product_deatil.dart';
import 'route_constanst.dart';

class MyRouter {
  /// The route configuration.
  static final GlobalKey<NavigatorState> _rootNavKey =
      GlobalKey<NavigatorState>();
  static final router = GoRouter(
      navigatorKey: _rootNavKey,
      initialLocation: RoutesConstants.initialPath,
      debugLogDiagnostics: true,
      routes: [
        //*----(Initial view)
        GoRoute(
          path: RoutesConstants.initialPath,
          name: RoutesConstants.initialName,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: RoutesConstants.onboardPath,
          name: RoutesConstants.onboardName,
          builder: (context, state) => OnboardView(),
        ),
        GoRoute(
          path: RoutesConstants.entryPath,
          name: RoutesConstants.entryName,
          builder: (context, state) => const EntryPoint(),
        ),

        GoRoute(
          path: RoutesConstants.productDetailPath,
          name: RoutesConstants.productDetailName,
          builder: (context, state) => const ProductDeatil(),
        ),
      ]);
}
