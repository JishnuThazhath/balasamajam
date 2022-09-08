import 'package:balasamajam/data/login/login_user.dart';
import 'package:balasamajam/screens/home/home_screen.dart';
import 'package:balasamajam/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  static String routeName = "IndexScreen";

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomeScreen(key: UniqueKey());
          }
          return SplashScreen(key: UniqueKey());
        });
  }
}
