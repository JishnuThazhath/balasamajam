import 'package:balasamajam/routes.dart';
import 'package:balasamajam/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Manakody Balasamajam",
      initialRoute: HomeScreen.routeName,
      routes: routes,
      theme: ThemeData(
        primaryColor: Colors.white30,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Georgia",
      ),
    );
  }
}
