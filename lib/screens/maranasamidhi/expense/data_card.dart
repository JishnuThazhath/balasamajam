import 'package:balasamajam/configs/local_theme_data.dart';
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
    return GestureDetector(
      onTap: () => callBack(),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.blockSizeHorizontal * 10,
              vertical: Responsive.blockSizeVertical * 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(expenseType), Text(amount)]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(description), Text(date)]),
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text(addedBy)])
          ])),
    );
  }
}
