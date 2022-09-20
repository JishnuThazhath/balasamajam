import 'package:flutter/material.dart';

class MemberEnquiryListComponent extends StatelessWidget {
  String name;
  String totalMaranavariAmount;
  String totalMasavariAmount;
  String totalPayableAmount;

  MemberEnquiryListComponent(
      {super.key,
      required this.name,
      required this.totalMaranavariAmount,
      required this.totalMasavariAmount,
      required this.totalPayableAmount});

  final List<int> colorCodes = <int>[500, 100];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.amber[colorCodes[1]],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.person),
          Text(name),
          Column(
            children: [
              Text("Maranavari : $totalMaranavariAmount"),
              Text("Masavari : $totalMasavariAmount"),
              Text("Total : $totalPayableAmount")
            ],
          )
        ],
      ),
    );
  }
}
