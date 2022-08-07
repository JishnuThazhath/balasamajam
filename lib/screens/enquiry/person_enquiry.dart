import 'package:balasamajam/components/table_component.dart';
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
            OutlinedButton(onPressed: () {}, child: const Text("Go")),
          ]),
          SizedBox(
            height: 300,
            child: TableComponent(
              headers: _getHeaders(),
              data: _getData(),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Total : ",
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ),
          OutlinedButton(onPressed: () {}, child: const Text("Download PDF")),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 30,
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Payment',
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              OutlinedButton(onPressed: () {}, child: const Text("Go")),
            ],
          ),
        ],
      )),
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
