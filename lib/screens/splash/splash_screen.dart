import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/login/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = "SplashScreen";

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    // Splash screen should wait for sometime and load the login screen
    Future.delayed(
        const Duration(seconds: 5),
        () => {
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginScreen.routeName, (route) => false)
            });

    return Scaffold(
      body: Center(
          child: Text(
        "Manakody Balasamajam",
        style: LocalThemeData.mainHeading,
      )),
    );
  }
}
