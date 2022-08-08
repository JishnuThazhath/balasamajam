import 'package:balasamajam/components/table_component.dart';
import 'package:balasamajam/components/template.dart';
import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';

class WeeklyPirivuDetails extends StatefulWidget {
  String week;
  WeeklyPirivuDetails({super.key, required this.week});

  static const String routeName = "WeeklyPirivuDetails";

  @override
  State<WeeklyPirivuDetails> createState() => _WeeklyPirivuDetailsState();
}

class _WeeklyPirivuDetailsState extends State<WeeklyPirivuDetails> {
  @override
  Widget build(BuildContext context) {
    return Template(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Kavadi - Weekly Pirivu Vivarangal",
              style: LocalThemeData.subTitle),
          SizedBox(height: Responsive.blockSizeHorizontal * 30),
          Text("Week : ${widget.week}", style: LocalThemeData.subTitle),
          SizedBox(height: Responsive.blockSizeHorizontal * 30),
          SizedBox(
            height: Responsive.blockSizeVertical * 400,
            child: TableComponent(
              headers: _getHeaders(),
              data: _getData(),
              rowClickCallback: () {},
            ),
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding:
                  EdgeInsets.only(left: Responsive.blockSizeHorizontal * 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total : 1000 INR", style: LocalThemeData.labelText),
                    Text("Expenses : 3000 INR",
                        style: LocalThemeData.labelText),
                    Text("Net Total : 4000 INR",
                        style: LocalThemeData.labelText),
                  ]),
            ),
          ),
          SizedBox(height: Responsive.blockSizeVertical * 30),
          ElevatedButton(
              onPressed: () => {},
              child: Text("Download PDF", style: LocalThemeData.buttonText),
              style: LocalThemeData.buttonPrimartColor)
        ],
      ),
    );
  }

  _getHeaders() {
    return ["SLNO", "Name", "Amount", "Total", "Collected By"];
  }

  _getData() {
    return [
      ["1", "Ned Stark", "5000 INR", "10000 INR", "Cercei Lanister"],
      ["2", "Lady Mormont", "2000 INR", "40000 INR", "Tyrion Lanister"],
      ["1", "Ned Stark", "5000 INR", "10000 INR", "Cercei Lanister"],
      ["2", "Lady Mormont", "2000 INR", "40000 INR", "Tyrion Lanister"],
      ["1", "Ned Stark", "5000 INR", "10000 INR", "Cercei Lanister"],
      ["2", "Lady Mormont", "2000 INR", "40000 INR", "Tyrion Lanister"],
      ["1", "Ned Stark", "5000 INR", "10000 INR", "Cercei Lanister"],
      ["2", "Lady Mormont", "2000 INR", "40000 INR", "Tyrion Lanister"],
      ["1", "Ned Stark", "5000 INR", "10000 INR", "Cercei Lanister"],
      ["2", "Lady Mormont", "2000 INR", "40000 INR", "Tyrion Lanister"],
      ["1", "Ned Stark", "5000 INR", "10000 INR", "Cercei Lanister"],
      ["2", "Lady Mormont", "2000 INR", "40000 INR", "Tyrion Lanister"],
      ["1", "Ned Stark", "5000 INR", "10000 INR", "Cercei Lanister"],
      ["2", "Lady Mormont", "2000 INR", "40000 INR", "Tyrion Lanister"],
      ["1", "Ned Stark", "5000 INR", "10000 INR", "Cercei Lanister"],
      ["2", "Lady Mormont", "2000 INR", "40000 INR", "Tyrion Lanister"]
    ];
  }
}
