import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view/screens/home/home_screen.dart';
import 'package:flutter_mvvm/view/screens/login/login_screen.dart';
import 'package:flutter_mvvm/view/screens/register/register_screen.dart';

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
    debugShowCheckedModeBanner: false,
    routes: {
      HomeScreen.routeName: (context) => HomeScreen(),
      SignUpScreen.routeName: (context) => SignUpScreen(),
    },
  ));
}
