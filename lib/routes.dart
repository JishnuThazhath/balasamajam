import 'package:balasamajam/screens/enquiry/person_enquiry.dart';
import 'package:balasamajam/screens/home/home_screen.dart';
import 'package:balasamajam/screens/login/login.dart';
import 'package:balasamajam/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: ((context) => LoginScreen()),
  HomeScreen.routeName: (context) => const HomeScreen(),
  PersonEnquiry.routeName: (context) => PersonEnquiry(),
};
