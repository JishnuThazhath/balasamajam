import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/configs/shared_state.dart';
import 'package:balasamajam/routes.dart';
import 'package:balasamajam/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Manakody Balasamajam",
      initialRoute: SplashScreen.routeName,
      routes: routes,
      theme: ThemeData(
        primaryColor: LocalThemeData.primaryColor,
        scaffoldBackgroundColor: LocalThemeData.backgroundColor,
        fontFamily: "Trueno",
      ),
    );
  }
}
