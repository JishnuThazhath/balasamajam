import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = "LoginScreen";

  void login() {
    print("Logging in...");
    /* 
    TODO: Validate the username and password.
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Balasamajam Nadumuri"),
          // Username
          const SizedBox(
            width: 200,
            height: 30,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          // Password
          const SizedBox(
            width: 200,
            height: 30,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          OutlinedButton(onPressed: login, child: const Text("Login")),
        ],
      )),
    );
  }
}
