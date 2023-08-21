import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/db/RoomDatabase.dart';
import 'package:flutter_mvvm/repository/user_repository.dart';
import 'package:flutter_mvvm/view/screens/register/register_screen.dart';
import 'package:flutter_mvvm/view_model/auth_view_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final UserRepository userRepository = UserRepository(AppDatabase());

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

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
                    /*Navigator.of(context)
                        .pushReplacementNamed(SignUpScreen.routeName);*/
                  }),
            ),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });

                  final emailController = usernameController.text;
                  final passController = passwordController.text;

                  if(emailController.isEmpty){
                    Fluttertoast.showToast(msg: "Email should not be null");
                  }else if(passController.isEmpty){
                    Fluttertoast.showToast(msg: "password should not be null");
                  }else{
                    Map data = {
                      "email": emailController.toString(),
                      "password": passController.toString()
                    };
                    final authViewModel = Provider.of<AuthViewModel>(context);

                    await authViewModel.loginApi(data, context);
                    setState(() {
                      _isLoading = false;
                    });
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
