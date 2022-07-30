import 'package:balasamajam/screens/login/login.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  balasamajam_navigate() {}

  loginPage_navigate(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Balasamajam Nadumuri"),
            OutlinedButton(
                onPressed: balasamajam_navigate, child: const Text("Kavadi")),
            OutlinedButton(
                onPressed: balasamajam_navigate,
                child: const Text("Balasamajam")),
            OutlinedButton(
                onPressed: () =>
                    {Navigator.pushNamed(context, LoginScreen.routeName)},
                child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
