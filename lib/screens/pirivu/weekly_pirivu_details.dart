import 'package:balasamajam/components/table_component.dart';
import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';

class WeeklyPirivuDetails extends StatefulWidget {
  const WeeklyPirivuDetails({super.key});

  @override
  State<WeeklyPirivuDetails> createState() => _WeeklyPirivuDetailsState();
}

class _WeeklyPirivuDetailsState extends State<WeeklyPirivuDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Manakody Balasamajam", style: LocalThemeData.mainHeading),
          SizedBox(height: Responsive.blockSizeHorizontal * 30),
          Text("Kavadi - Weekly Pirivu Vivarangal",
              style: LocalThemeData.subTitle),
          SizedBox(height: Responsive.blockSizeHorizontal * 50),
          Text("Week : 01/Aug - 07/Aug", style: LocalThemeData.subTitle),
          SizedBox(height: Responsive.blockSizeHorizontal * 30),
          SizedBox(
            height: Responsive.blockSizeVertical * 400,
            child: TableComponent(
              headers: _getHeaders(),
              data: _getData(),
              clickEvent: () => {},
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(children: const [
              Text("Total : 1000 INR", style: TextStyle(fontSize: 25.0)),
              Text("Expenses : 3000 INR", style: TextStyle(fontSize: 25.0)),
              Text("Net Total : 4000 INR", style: TextStyle(fontSize: 25.0)),
            ]),
          ),
          ElevatedButton(
              onPressed: () => {},
              child: Text("Download PDF", style: LocalThemeData.buttonText))
        ],
      )),
    );
  }

  _getHeaders() {}

  _getData() {}
}
