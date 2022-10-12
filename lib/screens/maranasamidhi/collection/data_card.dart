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
    TextStyle titleText = const TextStyle(
        color: Colors.white,
        fontFamily: 'Trueno',
        fontSize: 20,
        fontWeight: FontWeight.w500);

    TextStyle subText = const TextStyle(
        color: Colors.white,
        fontFamily: 'Trueno',
        fontSize: 15,
        fontWeight: FontWeight.w500);

    TextStyle markerText = const TextStyle(
        color: Colors.white,
        fontFamily: 'Trueno',
        fontSize: 10,
        fontWeight: FontWeight.w500);

    return GestureDetector(
      onTap: () => callBack(),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue[500],
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 2))
            ],
            // border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.blockSizeHorizontal * 10,
            vertical: Responsive.blockSizeVertical * 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              const Icon(
                Icons.payment,
                size: 70,
                color: Colors.white,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(collectedFrom, style: titleText),
                  SizedBox(height: Responsive.blockSizeVertical * 10),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.all(2),
                      child: const Text("Payment Date",
                          style: TextStyle(fontSize: 10))),
                  Text(paymentDate, style: subText)
                ],
              )
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.currency_rupee_sharp,
                      color: Colors.white,
                    ),
                    Text("${paymentAmount}", style: titleText),
                  ],
                ),
                SizedBox(height: Responsive.blockSizeVertical * 10),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.all(2),
                    child: const Text("Collected By",
                        style: TextStyle(fontSize: 10))),
                Text(collectedBy, style: subText)
              ],
            )
          ],
        ),
      ),
    );
  }
}
