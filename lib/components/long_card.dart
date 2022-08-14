import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';

class LongCard extends StatelessWidget {
  String mainText;
  Function callBack;
  LongCard({super.key, required this.mainText, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callBack();
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.blockSizeHorizontal * 50,
            vertical: Responsive.blockSizeVertical * 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(mainText, style: LocalThemeData.subTitle),
            Icon(Icons.arrow_right)
          ],
        ),
      ),
    );
  }
}
