import 'package:balasamajam/screens/enquiry/person_enquiry.dart';
import 'package:flutter/material.dart';

class KavadiHome extends StatelessWidget {
  const KavadiHome({super.key});

  static const String routeName = "KavadiHome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Balasamajam Nadumuri"),
          OutlinedButton(
              onPressed: () => _pirivu_details(context),
              child: const Text("Pirivu Vivarangal")),
          OutlinedButton(
              onPressed: () => _personal_enquiry(context),
              child: const Text("Personal Enquiry")),
        ],
      )),
    );
  }

  _pirivu_details(BuildContext context) {}

  _personal_enquiry(BuildContext context) {
    Navigator.pushNamed(context, PersonEnquiry.routeName);
  }
}
