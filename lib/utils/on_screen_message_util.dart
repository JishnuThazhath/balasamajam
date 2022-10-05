import 'package:flutter/material.dart';

class OnScreenMessageUtil {
  static MaterialColor GREEN = Colors.green;
  static MaterialColor RED = Colors.red;

  static void showSnackBarBottom(
      String message, BuildContext context, MaterialColor color) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(backgroundColor: color, content: Text(message)));
  }
}
