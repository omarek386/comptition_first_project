import 'package:comptition_first_project/presentation/screens/Installments_screen.dart';
import 'package:comptition_first_project/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const InstallmentsScreen());
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.installmentsScreen:
        return MaterialPageRoute(builder: (_) => const InstallmentsScreen());
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
