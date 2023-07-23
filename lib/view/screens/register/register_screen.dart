// signup_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/RoomDatabase.dart';
import 'package:flutter_mvvm/model/User.dart';
import 'package:flutter_mvvm/repository/user_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signupscreen';

  final UserRepository userRepository = UserRepository(AppDatabase());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(controller: usernameController, decoration: InputDecoration(labelText: 'Username')),
            TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: 'Password')),
            ElevatedButton(
              onPressed: () async {
                final username = usernameController.text;
                final password = passwordController.text;

                if (username.isNotEmpty && password.isNotEmpty) {
                  final newUser = User(username: username, password: password);
                  await userRepository.insertUser(newUser);
                  Fluttertoast.showToast(msg: 'Signup successfully');
                } else {
                  Fluttertoast.showToast(msg: 'Signup Failed');
                }
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
