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
      fontWeight: FontWeight.bold);

  static TextStyle buttonText = TextStyle(
      fontFamily: 'Trueno',
      fontSize: Responsive.blockSizeVertical * 20,
      color: Colors.white);

  static TextStyle labelText = TextStyle(
      fontFamily: 'Trueno',
      fontSize: Responsive.blockSizeVertical * 25,
      fontWeight: FontWeight.bold);
}
