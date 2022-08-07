import 'package:balasamajam/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../data/login/login_user.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  static const String routeName = "LoginScreen";

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Balasamajam Nadumuri"),
          // Username
          SizedBox(
            width: 200,
            height: 30,
            child: TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          // Password
          SizedBox(
            width: 200,
            height: 30,
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          OutlinedButton(onPressed: () => login(), child: const Text("Login")),
        ],
      )),
    );
  }

  login() {
    print("Logging in...");
    bool isLoggedIn =
        loginUser(usernameController.text, passwordController.text);

    if (isLoggedIn == true) {
      Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }
}
