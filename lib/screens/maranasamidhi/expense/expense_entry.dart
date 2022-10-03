import 'package:balasamajam/components/long_card.dart';
import 'package:balasamajam/components/template.dart';
import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/configs/shared_state.dart';
import 'package:balasamajam/constants/api_constants.dart';
import 'package:balasamajam/general/models/request_base_model.dart';
import 'package:balasamajam/network/api_enums.dart';
import 'package:balasamajam/network/api_helper.dart';
import 'package:balasamajam/network/api_service.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/maranasamidhi/expense/maranam_expense.dart';
import 'package:balasamajam/screens/maranasamidhi/expense/models/expense_response_model.dart';
import 'package:balasamajam/screens/maranasamidhi/expense/models/maranam_expense_request_model.dart';
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
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  TextEditingController notesController = TextEditingController();

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
                  : "Description of the Expense",
              amountController: amountController,
              dateController: dateController,
              nameController: nameController),
          SizedBox(height: Responsive.blockSizeVertical * 30),
          LongCard(mainText: "Add Notes", callBack: _notesOnClick),
          SizedBox(height: Responsive.blockSizeVertical * 100),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: _addExpenseDetails,
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

  _addExpenseDetails() async {
    final token =
        await SharedState.getSharedState(LocalAppState.TOKEN.toString());
    final expenseType = _dropdownValue == "death" ? "MARANAM" : "OTHERS";
    MaranamExpenseRequestModel maranamExpenseRequestModel =
        MaranamExpenseRequestModel(nameController.text, dateController.text,
            amountController.text, expenseType);

    final json = RequestBaseModel.toJson(
        RequestBaseModel(token, maranamExpenseRequestModel),
        (value) => maranamExpenseRequestModel.toJson());

    final response = await APIService.sendRequest(
        requestType: RequestType.POST,
        url: APIConstants.addExpense,
        body: json);

    final expenseResponseModel = APIHelper.filterResponse(
        apiCallback: apiCallback,
        response: response,
        apiOnFailureCallBackWithMessage: apiOnFailureCallBackWithMessage);

    if (expenseResponseModel != null) {
      _showAfterAddExpenseDlg(expenseResponseModel.message);
    }
  }

  apiCallback(json) {
    return ExpenseResponseModel.fromJson(json);
  }

  apiOnFailureCallBackWithMessage(
      APIResponseErrorType errorType, String errorMessage) {
    _showAfterAddExpenseDlg(errorMessage);
    return null;
  }

  _showAfterAddExpenseDlg(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok"))
              ],
            ));
  }
}
