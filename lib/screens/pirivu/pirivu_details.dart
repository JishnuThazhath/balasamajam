import 'package:balasamajam/components/table_component.dart';
import 'package:balasamajam/components/template.dart';
import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/pirivu/weekly_pirivu_details.dart';
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
    return Template(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Kavadi - Pirivu Vivarangal", style: LocalThemeData.subTitle),
            SizedBox(height: Responsive.blockSizeHorizontal * 50),
            SizedBox(
              height: Responsive.blockSizeVertical * 400,
              child: TableComponent(
                headers: _getHeaders(),
                data: _getData(),
                rowClickCallback: onRowClick,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("Total : ", style: LocalThemeData.labelText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getHeaders() {
    return ["Week", "Total Amount"];
  }

  _getData() {
    return [
      ["Week1", "500 INR"],
      ["Week2", "500 INR"],
      ["Week3", "500 INR"],
      ["Week4", "500 INR"],
      ["Week5", "500 INR"],
      ["Week6", "500 INR"],
      ["Week1", "500 INR"],
      ["Week2", "500 INR"],
      ["Week3", "500 INR"],
      ["Week4", "500 INR"],
      ["Week5", "500 INR"],
      ["Week6", "500 INR"]
    ];
  }

  onRowClick(List<String> row) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WeeklyPirivuDetails(week: row[0])));
  }
}
