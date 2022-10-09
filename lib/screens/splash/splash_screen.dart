import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = "SplashScreen";

  @override
  Widget build(BuildContext context) {
    TextStyle logText1 = const TextStyle(
        color: Colors.white,
        fontFamily: 'Trueno',
        fontSize: 16,
        fontWeight: FontWeight.w500);

    TextStyle logText2 = const TextStyle(
        color: Colors.white,
        fontFamily: 'Trueno',
        fontSize: 20,
        fontWeight: FontWeight.w800);

    Responsive.init(context);
    // Splash screen should wait for sometime and load the login screen
    Future.delayed(
        const Duration(seconds: 5),
        () => {
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginPage.routeName, (route) => false)
            });

    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.blockSizeHorizontal * 100,
                vertical: Responsive.blockSizeVertical * 100),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset("images/chineese_lan.png", scale: 10),
                  SizedBox(width: Responsive.blockSizeHorizontal * 20),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Nadumuri", style: logText1),
                        Text("Balasamajam", style: logText2),
                      ])
                ])),
      ),
    );
  }
}
