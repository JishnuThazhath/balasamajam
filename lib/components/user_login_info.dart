import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:flutter/material.dart';

class UserLoginInfo extends StatelessWidget {
  const UserLoginInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Nadumuri Balasamajam", style: LocalThemeData.subTitle),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.person),
          ),
        ),
      ],
    );
  }
}
