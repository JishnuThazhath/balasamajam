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
    Color forgroundColor = Colors.black;
    Color markerColor = Colors.blue;
    Color markerTextColor = Colors.white;

    TextStyle titleText = TextStyle(
        color: forgroundColor,
        fontFamily: 'Trueno',
        fontSize: Responsive.blockSizeVertical * 25,
        fontWeight: FontWeight.w500);

    TextStyle subText = TextStyle(
        color: forgroundColor,
        fontFamily: 'Trueno',
        fontSize: Responsive.blockSizeVertical * 15,
        fontWeight: FontWeight.w500);

    TextStyle markerTextStyle = TextStyle(
        color: markerTextColor,
        fontFamily: 'Trueno',
        fontSize: Responsive.blockSizeVertical * 12,
        fontWeight: FontWeight.w500);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.attach_money_sharp,
              size: Responsive.blockSizeVertical * 120, color: forgroundColor),
          SizedBox(width: Responsive.blockSizeVertical * 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description, style: titleText),
                SizedBox(height: Responsive.blockSizeVertical * 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: markerColor,
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.all(5),
                              child:
                                  Text("Payment Date", style: markerTextStyle)),
                          SizedBox(height: Responsive.blockSizeVertical * 5),
                          Text(date, style: subText)
                        ],
                      ),
                    ),
                    //SizedBox(width: Responsive.blockSizeHorizontal * 30),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: markerColor,
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.all(5),
                              child:
                                  Text("Paid Amount", style: markerTextStyle)),
                          SizedBox(height: Responsive.blockSizeVertical * 5),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.currency_rupee_sharp,
                                  color: forgroundColor,
                                  size: Responsive.blockSizeVertical * 15),
                              Text(amount, style: subText),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(width: Responsive.blockSizeHorizontal * 30),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: markerColor,
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.all(5),
                              child:
                                  Text("Entered By", style: markerTextStyle)),
                          SizedBox(height: Responsive.blockSizeVertical * 5),
                          Text(addedBy, style: subText)
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
