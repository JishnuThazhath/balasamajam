import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';
import 'dart:convert' show utf8;

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
    Color forgroundColor = Colors.black;
    Color markerColor = Colors.blue;
    Color markerTextColor = Colors.white;

    TextStyle titleText = TextStyle(
        color: forgroundColor,
        fontFamily: 'Trueno',
        fontSize: Responsive.blockSizeVertical * 20,
        fontWeight: FontWeight.w500);

    TextStyle amountText = TextStyle(
        color: forgroundColor,
        fontFamily: 'Trueno',
        fontSize: Responsive.blockSizeVertical * 15,
        fontWeight: FontWeight.w500);

    TextStyle subText = TextStyle(
        color: forgroundColor,
        fontFamily: 'Trueno',
        fontSize: Responsive.blockSizeVertical * 5,
        fontWeight: FontWeight.w500);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.person, size: 100, color: forgroundColor),
          SizedBox(width: Responsive.blockSizeHorizontal * 70),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_getMemberName(), style: titleText), // Name
                SizedBox(height: Responsive.blockSizeVertical * 5),
                phone.isNotEmpty
                    ? Text(phone, style: subText)
                    : const SizedBox(height: 0), // Phone
                SizedBox(height: Responsive.blockSizeVertical * 15),
                // Details Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Maranavari
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: markerColor,
                            ),
                            padding: const EdgeInsets.all(3.0),
                            child: Text("MARANAVARI",
                                style: TextStyle(
                                    fontSize: 10, color: markerTextColor)),
                          ),
                          SizedBox(height: Responsive.blockSizeVertical * 5),
                          Row(
                            children: [
                              Icon(Icons.currency_rupee_sharp,
                                  color: markerColor),
                              Text(maranavari, style: amountText),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Masavari
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: markerColor),
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "MASAVARI",
                              style: TextStyle(
                                  fontSize: 10, color: markerTextColor),
                            ),
                          ),
                          SizedBox(height: Responsive.blockSizeVertical * 5),
                          Row(
                            children: [
                              Icon(Icons.currency_rupee_sharp,
                                  color: markerColor),
                              Text(masavari, style: amountText),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Total
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: markerColor,
                              ),
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                "TOTAL",
                                style: TextStyle(
                                    fontSize: 10, color: markerTextColor),
                              )),
                          SizedBox(height: Responsive.blockSizeVertical * 5),
                          Row(
                            children: [
                              Icon(Icons.currency_rupee_sharp,
                                  color: markerColor),
                              Text(total, style: amountText), // Total
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // By defualt dart converts all the strings to utf-16.
  // This method converts the string to utf-8, which is the original encoding the api uses.
  _getMemberName() {
    String utf8Encoded = localFullName;

    if (utf8Encoded.isNotEmpty) {
      var utf8Runes = utf8Encoded.runes.toList();
      return utf8.decode(utf8Runes);
    }

    return fullName;
  }
}
