import 'package:flutter/material.dart';
import 'package:mvvm_practice_app/utils/routes/routes_names.dart';

import 'package:mvvm_practice_app/view/ZExtra/splashView.dart';
import 'package:mvvm_practice_app/view/auth_ui/LoginScreen.dart';
import 'package:mvvm_practice_app/view/users_ui/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) {
          return HomeScreen();
        });
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) {
          return LoginScreen();
        });
      case RoutesName.signup:
        return MaterialPageRoute(builder: (context) {
          return LoginScreen();
        });
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) {
          return SplashView();
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text('No Routes'),
            ),
          );
        });
    }
  }
}
