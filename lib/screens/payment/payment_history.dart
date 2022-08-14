import 'package:balasamajam/components/table_component.dart';
import 'package:balasamajam/components/template.dart';
import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';

class PaymentHistory extends StatefulWidget {
  String name;
  PaymentHistory({super.key, required this.name});

  static const String routeName = "PaymentHistory";

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return Template(
      child: Column(children: [
        SizedBox(height: Responsive.blockSizeVertical * 100),
        Column(children: [
          Text("Payment History of ", style: LocalThemeData.mainHeading),
          Text(widget.name, style: LocalThemeData.stypePrimaryText)
        ]),
        SizedBox(height: Responsive.blockSizeVertical * 30),
        SizedBox(
          height: Responsive.blockSizeVertical * 400,
          child: TableComponent(
              headers: _getHeaders(),
              data: _getData(),
              rowClickCallback: () {}),
        ),
        SizedBox(height: Responsive.blockSizeVertical * 70),
        ElevatedButton(
            onPressed: () {},
            style: LocalThemeData.buttonPrimartColor,
            child: Text("Download PDF", style: LocalThemeData.buttonText)),
      ]),
    );
  }

  List<String> _getHeaders() {
    return ["Date", "Amount", "Received By"];
  }

  List<List<String>> _getData() {
    return [
      ["10/10/2022", "10 INR", "Homelander"],
      ["10/10/2022", "10 INR", "Homelander"],
      ["10/10/2022", "10 INR", "Homelander"],
      ["10/10/2022", "10 INR", "Homelander"],
      ["10/10/2022", "10 INR", "Homelander"],
      ["10/10/2022", "10 INR", "Homelander"],
      ["10/10/2022", "10 INR", "Homelander"],
      ["10/10/2022", "10 INR", "Homelander"],
      ["10/10/2022", "10 INR", "Homelander"],
      ["10/10/2022", "10 INR", "Homelander"],
      ["10/10/2022", "10 INR", "Homelander"],
      ["10/10/2022", "10 INR", "Homelander"],
      ["10/10/2022", "10 INR", "Homelander"],
    ];
  }
}
