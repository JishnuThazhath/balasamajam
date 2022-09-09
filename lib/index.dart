import 'package:balasamajam/configs/shared_state.dart';
import 'package:balasamajam/constants/api_constants.dart';
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
        future: _isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomeScreen(key: UniqueKey());
          }
          return SplashScreen(key: UniqueKey());
        });
  }

  _isLoggedIn() async {
    final _loggedInState =
        await SharedState.getSharedState(LocalAppState.IS_LOGGED_IN.toString());

    return _loggedInState != null && _loggedInState == true;
  }
}
