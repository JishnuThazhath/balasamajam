import 'package:flutter/material.dart';

class PersonEnquiry extends StatelessWidget {
  PersonEnquiry({super.key});

  static const String routeName = "PersonEnquiry";

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Balasamajam Nadumuri"),
          const Text("Kavadi - Personal Enquiry"),
          // Search
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 200,
              height: 30,
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            OutlinedButton(onPressed: () => {}, child: const Text("Go")),
          ]),
          Container(
            child: DataTable(
              columns: [
                DataColumn(label: Text("Date")),
                DataColumn(label: Text("Amount")),
                DataColumn(label: Text("Received By")),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text("10/08/2022")),
                  DataCell(Text("100 INR")),
                  DataCell(Text("John Snow")),
                ]),
                DataRow(cells: [
                  DataCell(Text("14/08/2022")),
                  DataCell(Text("500 INR")),
                  DataCell(Text("Cercei Lanister")),
                ]),
                DataRow(cells: [
                  DataCell(Text("22/08/2022")),
                  DataCell(Text("30 INR")),
                  DataCell(Text("White Walker")),
                ])
              ],
            ),
          )
        ],
      )),
    );
  }
}
