import 'package:flutter/material.dart';

class Responsive {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;

  void init(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);

    screenWidth = deviceData.size.width;
    screenHeight = deviceData.size.height;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}
