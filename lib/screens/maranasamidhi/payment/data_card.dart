import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final String collectedFrom;
  final String paymentDate;
  final String paymentAmount;
  final String collectedBy;
  final Function() callBack;

  const DataCard(
      {super.key,
      required this.callBack,
      required this.collectedFrom,
      required this.paymentDate,
      required this.paymentAmount,
      required this.collectedBy});

  @override
  Widget build(BuildContext context) {
    Color forgroundColor = Colors.black;
    Color markerColor = Colors.blue;
    Color markerTextColor = Colors.white;

    TextStyle titleText = TextStyle(
        color: forgroundColor,
        fontFamily: 'Trueno',
        fontSize: Responsive.blockSizeVertical * 20,
        fontWeight: FontWeight.w500);

    TextStyle subText = TextStyle(
        color: forgroundColor,
        fontFamily: 'Trueno',
        fontSize: Responsive.blockSizeVertical * 15,
        fontWeight: FontWeight.w500);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.payment,
              size: Responsive.blockSizeVertical * 120, color: forgroundColor),
          SizedBox(width: Responsive.blockSizeVertical * 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(collectedFrom, style: titleText),
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
                              child: Text("Payment Date",
                                  style: TextStyle(
                                      fontSize: 10, color: markerTextColor))),
                          SizedBox(height: Responsive.blockSizeVertical * 5),
                          Text(paymentDate, style: subText)
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: markerColor,
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.all(5),
                              child: Text("Paid Amount",
                                  style: TextStyle(
                                      fontSize: 10, color: markerTextColor))),
                          SizedBox(height: Responsive.blockSizeVertical * 5),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.currency_rupee_sharp,
                                  color: forgroundColor,
                                  size: Responsive.blockSizeVertical * 15),
                              Text(paymentAmount, style: subText),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: markerColor,
                                  borderRadius: BorderRadius.circular(5)),
                              padding: const EdgeInsets.all(5),
                              child: Text("Collected By",
                                  style: TextStyle(
                                      fontSize: 10, color: markerTextColor))),
                          SizedBox(height: Responsive.blockSizeVertical * 5),
                          Text(collectedBy, style: subText)
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
