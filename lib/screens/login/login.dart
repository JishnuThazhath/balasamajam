import 'package:balasamajam/components/template.dart';
import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/responsive.dart';
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
    String? passwordErrorText = null;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.blockSizeHorizontal * 20,
              vertical: Responsive.blockSizeVertical * 10),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
              SizedBox(height: Responsive.blockSizeVertical * 10),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    contentPadding: EdgeInsets.all(10),
                    errorText: passwordErrorText),
              ),
              SizedBox(height: Responsive.blockSizeVertical * 10),
              ElevatedButton(
                onPressed: () => _login(),
                style: LocalThemeData.buttonPrimartColor,
                child: Text("Login", style: LocalThemeData.buttonText),
              ),
            ],
          )),
        ),
      ),
    );
  }

  _login() {
    bool isLoggedIn =
        loginUser(usernameController.text, passwordController.text);

    if (isLoggedIn == true) {
      Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }
}
