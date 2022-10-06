import 'package:balasamajam/components/template.dart';
import 'package:balasamajam/screens/kavadi/kavadi_home.dart';
import 'package:balasamajam/screens/login/login_page.dart';
import 'package:balasamajam/screens/maranasamidhi/expense/add/add_expense_page.dart';
import 'package:balasamajam/screens/maranasamidhi/maranasamidhi_home.dart';
import 'package:balasamajam/screens/maranasamidhi/member/add/add_member_page.dart';
import 'package:balasamajam/screens/maranasamidhi/payment/add/add_payment_page.dart';
import 'package:balasamajam/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginPage.routeName: ((context) => LoginPage()),
  KavadiHome.routeName: (context) => const KavadiHome(),
  MaranasamidhiHome.routeName: (context) => const MaranasamidhiHome(),
  AddPaymentPage.routeName: (context) => AddPaymentPage(),
  AddMemberPage.routeName: (context) => AddMemberPage(),
  AddExpensePage.routeName: (context) => AddExpensePage(),
  Template.routeName: (context) => Template(),
};
