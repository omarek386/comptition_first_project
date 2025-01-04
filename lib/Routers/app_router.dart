import 'package:comptition_first_project/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.onBoarding:
      // return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      // case '/register':
      //   return MaterialPageRoute(builder: (_) => RegisterScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
