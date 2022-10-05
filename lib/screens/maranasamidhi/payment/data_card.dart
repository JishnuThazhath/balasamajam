import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final String collectedFrom;
  final String paymentDate;
  final String paymentAmount;
  final String collectedBy;
  final Function() callBack;

  DataCard(
      {super.key,
      required this.callBack,
      required this.collectedFrom,
      required this.paymentDate,
      required this.paymentAmount,
      required this.collectedBy});

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              const Icon(Icons.payment, size: 70),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(collectedFrom, style: LocalThemeData.subTitle),
                  SizedBox(height: Responsive.blockSizeVertical * 10),
                  Container(
                      padding: EdgeInsets.all(2),
                      color: Colors.grey[300],
                      child: const Text("Payment Date",
                          style: TextStyle(fontSize: 10))),
                  Text(paymentDate, style: LocalThemeData.labelTextB)
                ],
              )
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.currency_rupee_sharp),
                    Text("${paymentAmount}", style: LocalThemeData.subTitle),
                  ],
                ),
                SizedBox(height: Responsive.blockSizeVertical * 10),
                Container(
                    padding: const EdgeInsets.all(2),
                    color: Colors.grey[300],
                    child: const Text("Collected By",
                        style: TextStyle(fontSize: 10))),
                Text(collectedBy, style: LocalThemeData.labelTextB)
              ],
            )
          ],
        ),
      ),
    );
  }
}
