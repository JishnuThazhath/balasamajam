import 'package:balasamajam/components/template.dart';
import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/kavadi/kavadi_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Template(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Responsive.blockSizeHorizontal * 800,
              height: Responsive.blockSizeVertical * 100,
              child: ElevatedButton(
                onPressed: () => _kavadi(context),
                child: Text("Kavadi", style: LocalThemeData.buttonText),
                style: LocalThemeData.buttonPrimartColor,
              ),
            ),
            SizedBox(height: Responsive.blockSizeVertical * 30),
            SizedBox(
              width: Responsive.blockSizeHorizontal * 800,
              height: Responsive.blockSizeVertical * 100,
              child: ElevatedButton(
                onPressed: () => _maranasamidhi(context),
                child: Text("Maranasamidhi", style: LocalThemeData.buttonText),
                style: LocalThemeData.buttonPrimartColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _maranasamidhi(BuildContext context) {}

  _kavadi(BuildContext context) {
    Navigator.pushNamed(context, KavadiHome.routeName);
  }
}
