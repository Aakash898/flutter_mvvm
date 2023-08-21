import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/view/screens/home/home_screen.dart';
import 'package:flutter_mvvm/view/screens/login/login_screen.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
    routes: {
      RoutesName.home: (context) => const HomeScreen()
    }
  ));
}
