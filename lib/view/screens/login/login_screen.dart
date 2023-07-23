import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/RoomDatabase.dart';
import 'package:flutter_mvvm/repository/user_repository.dart';
import 'package:flutter_mvvm/view/screens/register/register_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository = UserRepository(AppDatabase());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username')),
            TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password')),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                  child: const Text('Forget password?'),
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SignUpScreen.routeName);
                  }),
            ),
            ElevatedButton(
              onPressed: () async {
                final username = usernameController.text;
                final password = passwordController.text;

                if (username.isNotEmpty && password.isNotEmpty) {
                  final user =
                      await userRepository.findUserByUsername(username);
                  if (user != null && user.password == password) {
                    Fluttertoast.showToast(msg: 'Login Successfully');
                  } else {
                    Fluttertoast.showToast(msg: 'Invalid Creds');
                  }
                } else {
                  // Handle invalid input
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
