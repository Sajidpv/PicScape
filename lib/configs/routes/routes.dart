import 'package:flutter/material.dart';
import 'package:picscape/home/view/screens/home_view.dart';
import 'package:picscape/home/view/screens/splash_view.dart';

import 'route_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text(RoutesName.no_route),
            ),
          );
        });
    }
  }
}
