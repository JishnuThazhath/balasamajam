import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';

class LocalThemeData {
  static TextStyle mainHeading = TextStyle(
      fontFamily: 'Trueno',
      fontSize: Responsive.blockSizeVertical * 30,
      fontWeight: FontWeight.bold);

  static TextStyle subTitle = TextStyle(
      fontFamily: 'Trueno',
      fontSize: Responsive.blockSizeVertical * 22,
      fontWeight: FontWeight.bold,
      color: Colors.black);

  static TextStyle buttonText = TextStyle(
      fontFamily: 'Trueno',
      fontSize: Responsive.blockSizeVertical * 20,
      color: Colors.white);

  static TextStyle labelText = TextStyle(
      fontFamily: 'Trueno',
      fontSize: Responsive.blockSizeVertical * 20,
      fontWeight: FontWeight.bold);

  static TextStyle labelTextW = TextStyle(
      color: Colors.white,
      fontFamily: 'Trueno',
      fontSize: Responsive.blockSizeVertical * 20,
      fontWeight: FontWeight.bold);

  static TextStyle labelTextB = TextStyle(
      color: Colors.black,
      fontFamily: 'Trueno',
      fontSize: Responsive.blockSizeVertical * 20,
      fontWeight: FontWeight.bold);

  static TextStyle stypePrimaryText = TextStyle(
      fontFamily: 'Trueno',
      fontSize: Responsive.blockSizeVertical * 30,
      fontWeight: FontWeight.bold,
      color: primaryColor);

  static const primaryColor = Colors.blueAccent;
  static Color? backgroundColor =
      Colors.grey[50]; //Color.fromARGB(222, 248, 247, 245);

  static ButtonStyle buttonPrimartColor =
      ElevatedButton.styleFrom(backgroundColor: primaryColor);

  static ButtonStyle longButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.blockSizeHorizontal * 420,
          vertical: Responsive.blockSizeVertical * 30));

  static var errorMessage = TextStyle(
      fontFamily: 'Trueno',
      fontSize: Responsive.blockSizeVertical * 20,
      fontWeight: FontWeight.bold,
      color: Colors.red);
}
