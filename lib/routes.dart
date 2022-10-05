import 'package:balasamajam/index.dart';
import 'package:balasamajam/screens/home/home_screen.dart';
import 'package:balasamajam/screens/kavadi/kavadi_home.dart';
import 'package:balasamajam/screens/login/login.dart';
import 'package:balasamajam/screens/maranasamidhi/maranasamidhi_home.dart';
import 'package:balasamajam/screens/maranasamidhi/member/add/add_member_page.dart';
import 'package:balasamajam/screens/maranasamidhi/member/person_enquiry.dart';
import 'package:balasamajam/screens/maranasamidhi/payment/add/add_payment_page.dart';
import 'package:balasamajam/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  IndexScreen.routeName: (context) => const IndexScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginScreen.routeName: ((context) => LoginScreen()),
  HomeScreen.routeName: (context) => const HomeScreen(),
  PersonEnquiry.routeName: (context) => PersonEnquiry(),
  KavadiHome.routeName: (context) => const KavadiHome(),
  MaranasamidhiHome.routeName: (context) => const MaranasamidhiHome(),
  AddPaymentPage.routeName: (context) => AddPaymentPage(),
  AddMemberPage.routeName: (context) => AddMemberPage(),
};
