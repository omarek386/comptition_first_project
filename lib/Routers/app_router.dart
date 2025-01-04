import 'package:comptition_first_project/presentation/screens/Installments_screen.dart';
import 'package:comptition_first_project/presentation/screens/home_page.dart';
import 'package:comptition_first_project/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/data_entry.dart';
import 'routes.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.installmentsScreen:
        List notes = settings.arguments as List;
        return MaterialPageRoute(
            builder: (_) => InstallmentsScreen(installments: notes));
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const DataEntry());
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
