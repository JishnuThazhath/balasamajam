import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final String fullName;
  final String localFullName;
  final String phone;
  final String maranavari;
  final String masavari;
  final String total;
  final Function() callBack;

  const DataCard(
      {super.key,
      required this.fullName,
      required this.localFullName,
      required this.phone,
      required this.maranavari,
      required this.masavari,
      required this.total,
      required this.callBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callBack(),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.blockSizeHorizontal * 10,
            vertical: Responsive.blockSizeVertical * 10),
        child: Row(
          children: [
            const Icon(Icons.person, size: 70),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fullName, style: LocalThemeData.subTitle),
                SizedBox(height: Responsive.blockSizeVertical * 10),
                Text(phone, style: LocalThemeData.labelTextB),
                SizedBox(height: Responsive.blockSizeVertical * 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          color: Colors.grey[300],
                          child: const Text("MARANAVARI",
                              style: TextStyle(fontSize: 10)),
                        ),
                        Text(maranavari, style: LocalThemeData.labelTextB),
                      ],
                    ),
                    SizedBox(width: Responsive.blockSizeHorizontal * 20),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          color: Colors.grey[300],
                          child: const Text("MASAVARI",
                              style: TextStyle(fontSize: 10)),
                        ),
                        Text(masavari, style: LocalThemeData.labelTextB),
                      ],
                    ),
                    SizedBox(width: Responsive.blockSizeHorizontal * 20),
                    Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(3.0),
                            color: Colors.grey[300],
                            child: const Text("TOTAL",
                                style: TextStyle(fontSize: 10))),
                        Text(total, style: LocalThemeData.labelTextB),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
