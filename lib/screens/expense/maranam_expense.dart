import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MaranamExpense extends StatefulWidget {
  String descriptionText;
  MaranamExpense({super.key, required this.descriptionText});

  @override
  State<MaranamExpense> createState() => _MaranamExpenseState();
}

class _MaranamExpenseState extends State<MaranamExpense> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController amountController = TextEditingController();

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.blockSizeHorizontal * 20,
              vertical: Responsive.blockSizeVertical * 10),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
              labelText: widget.descriptionText,
              contentPadding: EdgeInsets.all(10),
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
              DateTime? datePicker = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100));

              if (datePicker != null) {
                String formattedDate =
                    DateFormat("dd/MM/YYYY").format(datePicker);

                setState(() {
                  dateController.text = formattedDate;
                });
              }
            },
            controller: dateController,
            decoration: InputDecoration(
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
            controller: amountController,
            decoration: InputDecoration(
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
}
