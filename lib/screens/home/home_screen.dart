import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/kavadi/kavadi_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Manakody Balasamajam", style: LocalThemeData.mainHeading),
            SizedBox(height: Responsive.blockSizeVertical * 50),
            SizedBox(
              width: Responsive.blockSizeHorizontal * 450,
              height: Responsive.blockSizeVertical * 50,
              child: ElevatedButton(
                onPressed: () => _kavadi(context),
                child: Text("Kavadi", style: LocalThemeData.buttonText),
              ),
            ),
            SizedBox(height: Responsive.blockSizeVertical * 30),
            SizedBox(
              width: Responsive.blockSizeHorizontal * 450,
              height: Responsive.blockSizeVertical * 50,
              child: ElevatedButton(
                  onPressed: () => _maranasamidhi(context),
                  child:
                      Text("Maranasamidhi", style: LocalThemeData.buttonText)),
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
