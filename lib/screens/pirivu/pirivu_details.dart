import 'package:balasamajam/components/table_component.dart';
import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';

class PirivuDetails extends StatefulWidget {
  const PirivuDetails({super.key});

  static const routeName = "PirivuDetails";

  @override
  State<PirivuDetails> createState() => _PirivuDetailsState();
}

class _PirivuDetailsState extends State<PirivuDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Manakody Balasamajam", style: LocalThemeData.mainHeading),
          SizedBox(height: Responsive.blockSizeHorizontal * 30),
          Text("Kavadi - Pirivu Vivarangal", style: LocalThemeData.subTitle),
          SizedBox(height: Responsive.blockSizeHorizontal * 50),
          SizedBox(
            height: Responsive.blockSizeVertical * 400,
            child: TableComponent(
              headers: _getHeaders(),
              data: _getData(),
              clickEvent: () => onRowClick,
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text("Total : ", style: TextStyle(fontSize: 25.0)),
            ),
          ),
        ],
      )),
    );
  }

  _getHeaders() {
    return ["Week", "Total Amount"];
  }

  _getData() {
    return [
      ["Week1", "500 INR"],
      ["Week1", "500 INR"],
      ["Week1", "500 INR"],
      ["Week1", "500 INR"],
      ["Week1", "500 INR"],
      ["Week1", "500 INR"]
    ];
  }

  onRowClick() {
    print("row clicked !");
  }
}
