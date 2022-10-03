import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MaranamExpense extends StatefulWidget {
  String descriptionText;
  TextEditingController dateController;
  TextEditingController nameController;
  TextEditingController amountController;
  MaranamExpense(
      {super.key,
      required this.descriptionText,
      required this.dateController,
      required this.nameController,
      required this.amountController});

  @override
  State<MaranamExpense> createState() => _MaranamExpenseState();
}

class _MaranamExpenseState extends State<MaranamExpense> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.blockSizeHorizontal * 20,
              vertical: Responsive.blockSizeVertical * 10),
          child: TextField(
            controller: widget.nameController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              border: const OutlineInputBorder(),
              labelText: widget.descriptionText,
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.blockSizeHorizontal * 20,
              vertical: Responsive.blockSizeVertical * 10),
          child: TextField(
            readOnly: true,
            onTap: () async {
              String dateString = await _showDatePicker();
              setState(() {
                widget.dateController.text = dateString;
              });
            },
            controller: widget.dateController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.calendar_today),
              border: OutlineInputBorder(),
              labelText: "Date",
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.blockSizeHorizontal * 20,
              vertical: Responsive.blockSizeVertical * 10),
          child: TextField(
            controller: widget.amountController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.currency_rupee),
              border: OutlineInputBorder(),
              labelText: "Amount",
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        )
      ],
    );
  }

  Future<String> _showDatePicker() async {
    DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    String formattedDate = "DD/MM/YYYY";

    if (datePicker != null) {
      formattedDate = DateFormat("dd/MM/yyyy").format(datePicker);
    }
    return formattedDate;
  }
}
