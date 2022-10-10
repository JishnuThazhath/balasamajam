import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final String expenseType;
  final String description;
  final String date;
  final String amount;
  final String relatedTo;
  final String addedBy;
  final Function() callBack;

  const DataCard(
      {super.key,
      required this.expenseType,
      required this.description,
      required this.date,
      required this.amount,
      required this.relatedTo,
      required this.addedBy,
      required this.callBack});

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

    return GestureDetector(
      onTap: () => callBack(),
      child: Container(
          padding: EdgeInsets.symmetric(
              vertical: Responsive.blockSizeVertical * 15,
              horizontal: Responsive.blockSizeHorizontal * 30),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 2))
            ],
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Responsive.blockSizeVertical * 2,
                      horizontal: Responsive.blockSizeHorizontal * 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 2))
                    ],
                  ),
                  child: Text(expenseType)),
              Row(
                children: [
                  const Icon(
                    Icons.currency_rupee_sharp,
                    color: Colors.white,
                  ),
                  Text(
                    amount,
                    style: titleText,
                  ),
                ],
              ),
            ]),
            SizedBox(height: Responsive.blockSizeVertical * 5),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                description,
                style: titleText,
              ),
              Text(
                date,
                style: subText,
              )
            ]),
            SizedBox(height: Responsive.blockSizeVertical * 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "ENTERED BY",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                Text(
                  addedBy,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ],
            )
          ])),
    );
  }
}
