import 'package:balasamajam/components/long_card.dart';
import 'package:balasamajam/components/template.dart';
import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/expense/maranam_expense.dart';
import 'package:flutter/material.dart';

class ExpenseEntry extends StatefulWidget {
  String category;
  ExpenseEntry({super.key, required this.category});

  @override
  State<ExpenseEntry> createState() => _ExpenseEntryState();
}

class _ExpenseEntryState extends State<ExpenseEntry> {
  String? _dropdownValue = "death";
  TextEditingController searchController = TextEditingController();
  late TextEditingController notesController;

  @override
  void initState() {
    super.initState();
    notesController = TextEditingController();
  }

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Template(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${widget.category} - Expense Entry",
              style: LocalThemeData.subTitle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Expense Type ", style: LocalThemeData.labelText),
              DropdownButton<String>(
                value: _dropdownValue,
                items: const [
                  DropdownMenuItem<String>(
                      value: "death", child: Text("Death")),
                  DropdownMenuItem<String>(
                      value: "others", child: Text("Others"))
                ],
                onChanged: (value) => {_whenExpenseTypeSelected(value)},
              ),
            ],
          ),
          MaranamExpense(
              descriptionText: _dropdownValue == "death"
                  ? "Name"
                  : "Description of the Expense"),
          SizedBox(height: Responsive.blockSizeVertical * 30),
          LongCard(mainText: "Add Notes", callBack: _notesOnClick),
          SizedBox(height: Responsive.blockSizeVertical * 100),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: () {},
                style: LocalThemeData.longButtonStyle,
                child: Text("Go", style: LocalThemeData.buttonText)),
          ),
        ],
      ),
    );
  }

  void _whenExpenseTypeSelected(String? value) {
    setState(() {
      _dropdownValue = value;
    });
  }

  _notesOnClick() async {
    String? note = await openDialog();
    print(note);
  }

  Future<String?> openDialog() => showDialog<String>(
      context: context,
      builder: ((context) => AlertDialog(
            title: Text("Add Notes"),
            content: TextField(
                minLines: 1,
                maxLines: 5,
                maxLength: 100,
                controller: notesController,
                autofocus: true,
                decoration: InputDecoration(labelText: "Enter here"),
                onSubmitted: (_) => _onSubmit()),
            actions: [TextButton(onPressed: _onSubmit, child: Text("SUBMIT"))],
          )));

  void _onSubmit() {
    Navigator.of(context).pop(notesController.text);
    notesController.clear();
  }
}
