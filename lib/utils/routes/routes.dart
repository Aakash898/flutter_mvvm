import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/view/screens/home/home_screen.dart';
import 'package:flutter_mvvm/view/screens/login/login_screen.dart';
import 'package:flutter_mvvm/view/screens/register/register_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());

      case RoutesName.register:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignUpScreen());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text("No route defined"),
                  ),
                ));
    }
  }
}
