import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';

class FullPageHeader extends StatelessWidget {
  FullPageHeader({super.key, required this.showBackButton});

  bool showBackButton = false;

  @override
  Widget build(BuildContext context) {
    TextStyle logText1 = const TextStyle(
        color: Colors.black,
        fontFamily: 'Trueno',
        fontSize: 16,
        fontWeight: FontWeight.w500);

    TextStyle logText2 = const TextStyle(
        color: Colors.black,
        fontFamily: 'Trueno',
        fontSize: 20,
        fontWeight: FontWeight.w800);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.blockSizeHorizontal * 50,
          vertical: Responsive.blockSizeVertical * 20),
      child: Row(children: [
        if (showBackButton)
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                width: Responsive.blockSizeHorizontal * 100,
                height: Responsive.blockSizeVertical * 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.arrow_back, color: Colors.black)),
          ),
        SizedBox(width: Responsive.blockSizeHorizontal * 50),
        Image.asset("images/chineese_lan.png", scale: 10),
        SizedBox(width: Responsive.blockSizeHorizontal * 20),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Nadumuri", style: logText1),
          Text("Balasamajam", style: logText2),
        ])
      ]),
    );
  }
}
