import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/configs/shared_state.dart';
import 'package:balasamajam/constants/api_constants.dart';
import 'package:balasamajam/general/models/request_base_model.dart';
import 'package:balasamajam/network/api_enums.dart';
import 'package:balasamajam/network/api_helper.dart';
import 'package:balasamajam/network/api_service.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/maranasamidhi/expense/add/add_expense_page.dart';
import 'package:balasamajam/screens/maranasamidhi/expense/data_card.dart';
import 'package:balasamajam/screens/maranasamidhi/expense/expense_type.dart';
import 'package:balasamajam/screens/maranasamidhi/expense/models/fetch_expense_request_model.dart';
import 'package:balasamajam/screens/maranasamidhi/expense/models/fetch_expense_response_model.dart';
import 'package:balasamajam/utils/on_screen_message_util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  TextEditingController dateController = TextEditingController();
  List<FetchExpenseResponseModel> expenses = <FetchExpenseResponseModel>[];
  ExpenseType selectedValue = ExpenseType.ALL;

  @override
  void initState() {
    DateTime now = DateTime.now();
    String formattedNow = DateFormat("dd/MM/yyyy").format(now);
    dateController.text = formattedNow;
    _fetchExpenses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.blockSizeHorizontal * 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Align(
            alignment: Alignment.topRight,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                        width: 3, color: LocalThemeData.primaryColor)),
                onPressed: _addPayment,
                child: Text("Add Expense", style: LocalThemeData.labelTextB)),
          ),
          SizedBox(height: Responsive.blockSizeVertical * 15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Expenses", style: LocalThemeData.labelText),
            DropdownButton<ExpenseType>(
              value: selectedValue,
              hint: const Text("Expense Type"),
              borderRadius: BorderRadius.circular(5.0),
              items: _getExpenseTypes(),
              onChanged: (ExpenseType? value) {
                setState(() {
                  selectedValue = value!;
                });
                _fetchExpenses();
              },
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () async {
                      String dateString = await _showDatePicker();
                      setState(() {
                        dateController.text = dateString;
                      });
                    },
                    child: const Icon(Icons.calendar_month_outlined)),
                SizedBox(width: Responsive.blockSizeHorizontal * 5),
                Text(
                  dateController.text,
                  style: LocalThemeData.labelTextB,
                )
              ],
            ),
          ]),
          const Divider(thickness: 2),
          Expanded(
              child: expenses.isNotEmpty
                  ? RefreshIndicator(
                      onRefresh: () async {
                        await _fetchExpenses();
                      },
                      child: ListView.separated(
                          addAutomaticKeepAlives: false,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 1,
                              shadowColor: Colors.grey[600],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: DataCard(
                                  expenseType: expenses[index].expenseType.name,
                                  description: expenses[index].description,
                                  date: expenses[index].date,
                                  amount: expenses[index].amount.toString(),
                                  relatedTo:
                                      expenses[index].relatedTo.toString(),
                                  addedBy: expenses[index].addedBy,
                                  callBack: _callBack),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                              height: Responsive.blockSizeVertical * 20),
                          itemCount: expenses.length),
                    )
                  : const Center(child: Text("No Data to display...")))
        ]),
      ),
    );
  }

  Future<String> _showDatePicker() async {
    DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    String formattedDate = dateController.text;

    if (datePicker != null) {
      formattedDate = DateFormat("dd/MM/yyyy").format(datePicker);
      _fetchExpenses();
    }
    return formattedDate;
  }

  _callBack() {}

  _fetchExpenses() async {
    setState(() {
      expenses = [];
    });

    FetchExpenseRequestModel fetchExpenseRequestModel =
        FetchExpenseRequestModel(selectedValue);
    final token =
        await SharedState.getSharedState(LocalAppState.TOKEN.toString());

    final json = RequestBaseModel.toJson(
        RequestBaseModel(token, fetchExpenseRequestModel),
        (value) => fetchExpenseRequestModel.toJson());

    final response = await APIService.sendRequest(
        requestType: RequestType.POST,
        url: APIConstants.fetchExpenses,
        body: json);

    List<FetchExpenseResponseModel>? fetchExpenseResponse =
        APIHelper.filterResponse(
            apiCallback: _apiCallback,
            response: response,
            apiOnFailureCallBackWithMessage: _apiOnFailureCallBackWithMessage);

    if (fetchExpenseResponse != null && fetchExpenseResponse.isNotEmpty) {
      setState(() {
        expenses = fetchExpenseResponse;
      });
    }
  }

  _apiCallback(json) {
    if (json['data'] != null) {
      var data = json['data'] as List;
      if (data.isNotEmpty) {
        List<FetchExpenseResponseModel> model =
            data.map((e) => FetchExpenseResponseModel.fromJson(e)).toList();
        return model;
      }
    }
    return null;
  }

  _apiOnFailureCallBackWithMessage(APIResponseErrorType type, String message) {
    OnScreenMessageUtil.showSnackBarBottom(
        message, context, OnScreenMessageUtil.RED);
    return null;
  }

  void _addPayment() {
    Navigator.pushNamed(context, AddExpensePage.routeName);
  }

  List<DropdownMenuItem<ExpenseType>> _getExpenseTypes() {
    return const [
      DropdownMenuItem(
        value: ExpenseType.ALL,
        child: Text("All"),
      ),
      DropdownMenuItem(
        value: ExpenseType.MARANAM,
        child: Text("Maranam"),
      ),
      DropdownMenuItem(
        value: ExpenseType.OTHERS,
        child: Text("Others"),
      )
    ];
  }
}
