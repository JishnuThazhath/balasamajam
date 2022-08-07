import 'package:balasamajam/screens/login/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = "SplashScreen";

  @override
  Widget build(BuildContext context) {
    // Splash screen should wait for sometime and load the login screen
    Future.delayed(
        const Duration(seconds: 3),
        () => {
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginScreen.routeName, (route) => false)
            });

    return const Scaffold(
      body: Center(child: Text("Balasamajam Manakody")),
    );
  }
}
