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
    return Template(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Responsive.blockSizeHorizontal * 500,
            height: Responsive.blockSizeVertical * 45,
            child: TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(height: Responsive.blockSizeVertical * 10),
          SizedBox(
            width: Responsive.blockSizeHorizontal * 500,
            height: Responsive.blockSizeVertical * 45,
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(height: Responsive.blockSizeVertical * 10),
          ElevatedButton(
            onPressed: () => _login(),
            style: LocalThemeData.buttonPrimartColor,
            child: Text("Login", style: LocalThemeData.buttonText),
          ),
        ],
      )),
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
