import 'package:balasamajam/components/table_component.dart';
import 'package:balasamajam/components/template.dart';
import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';

class PersonEnquiry extends StatelessWidget {
  PersonEnquiry({super.key});

  static const String routeName = "PersonEnquiry";

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Template(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Kavadi - Personal Enquiry", style: LocalThemeData.subTitle),
            SizedBox(height: Responsive.blockSizeHorizontal * 50),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: Responsive.blockSizeHorizontal * 500,
                height: Responsive.blockSizeVertical * 45,
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              SizedBox(width: Responsive.blockSizeHorizontal * 10),
              ElevatedButton(
                  onPressed: () {},
                  child: Text("Go", style: LocalThemeData.buttonText),
                  style: LocalThemeData.buttonPrimartColor),
            ]),
            SizedBox(width: Responsive.blockSizeVertical * 10),
            TableComponent(
              headers: _getHeaders(),
              data: _getData(),
              rowClickCallback: (value) => {},
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    EdgeInsets.only(left: Responsive.blockSizeHorizontal * 30),
                child: Text("Total : ", style: LocalThemeData.labelText),
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text("Download PDF", style: LocalThemeData.buttonText),
                style: LocalThemeData.buttonPrimartColor),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Responsive.blockSizeHorizontal * 500,
                  height: Responsive.blockSizeVertical * 45,
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Payment',
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                SizedBox(width: Responsive.blockSizeVertical * 10),
                ElevatedButton(
                    onPressed: () {},
                    child: Text("Go", style: LocalThemeData.buttonText),
                    style: LocalThemeData.buttonPrimartColor),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getHeaders() {
    return ["Date", "Amount", "Received By"];
  }

  List<List<String>> _getData() {
    return [
      ["18/02/2022", "500 INR", "John Snow"],
      ["18/02/2022", "500 INR", "John Snow"],
      ["18/02/2022", "500 INR", "John Snow"],
      ["18/02/2022", "500 INR", "John Snow"],
      ["18/02/2022", "500 INR", "John Snow"],
      ["18/02/2022", "500 INR", "John Snow"],
      ["18/02/2022", "500 INR", "John Snow"]
    ];
  }
}
