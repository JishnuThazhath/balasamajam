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
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 2))
            ],
            color: Colors.blue,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.blockSizeHorizontal * 10,
            vertical: Responsive.blockSizeVertical * 10),
        child: Row(
          children: [
            const Icon(Icons.person, size: 100, color: Colors.white),
            SizedBox(width: Responsive.blockSizeHorizontal * 70),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullName,
                  style: titleText,
                ),
                SizedBox(height: Responsive.blockSizeVertical * 5),
                Text(phone, style: subText),
                SizedBox(height: Responsive.blockSizeVertical * 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(3.0),
                          child: const Text("MARANAVARI",
                              style: TextStyle(
                                fontSize: 10,
                              )),
                        ),
                        SizedBox(height: Responsive.blockSizeVertical * 5),
                        Row(
                          children: [
                            const Icon(Icons.currency_rupee_sharp,
                                color: Colors.white),
                            Text(
                              "${maranavari}",
                              style: titleText,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: Responsive.blockSizeHorizontal * 20),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(3.0),
                          child: const Text(
                            "MASAVARI",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        SizedBox(height: Responsive.blockSizeVertical * 5),
                        Row(
                          children: [
                            const Icon(Icons.currency_rupee_sharp,
                                color: Colors.white),
                            Text(
                              "${masavari}",
                              style: titleText,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: Responsive.blockSizeHorizontal * 20),
                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(3.0),
                            child: const Text(
                              "TOTAL",
                              style: TextStyle(fontSize: 10),
                            )),
                        SizedBox(height: Responsive.blockSizeVertical * 5),
                        Row(
                          children: [
                            const Icon(Icons.currency_rupee_sharp,
                                color: Colors.white),
                            Text(
                              "${total}",
                              style: titleText,
                            ),
                          ],
                        ),
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
