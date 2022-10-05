import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/configs/shared_state.dart';
import 'package:balasamajam/constants/api_constants.dart';
import 'package:balasamajam/general/models/request_base_model.dart';
import 'package:balasamajam/network/api_enums.dart';
import 'package:balasamajam/network/api_helper.dart';
import 'package:balasamajam/network/api_service.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/maranasamidhi/payment/add/add_payment_page.dart';
import 'package:balasamajam/screens/maranasamidhi/payment/data_card.dart';
import 'package:balasamajam/screens/maranasamidhi/payment/models/fetch_payment_request_model.dart';
import 'package:balasamajam/screens/maranasamidhi/payment/models/fetch_payment_response_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController dateController = TextEditingController();
  List<FetchPaymentResponseModel> payments = <FetchPaymentResponseModel>[];

  @override
  void initState() {
    DateTime now = DateTime.now();
    String formattedNow = DateFormat("dd/MM/yyyy").format(now);
    dateController.text = formattedNow;
    _fetchPayments(formattedNow);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Align(
            alignment: Alignment.topRight,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                        width: 3, color: LocalThemeData.primaryColor)),
                onPressed: _addPayment,
                child: Text("Add Payment", style: LocalThemeData.labelTextB)),
          ),
          SizedBox(height: Responsive.blockSizeVertical * 15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Transactions", style: LocalThemeData.labelText),
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
              child: payments.isNotEmpty
                  ? ListView.separated(
                      addAutomaticKeepAlives: false,
                      itemBuilder: (context, index) {
                        return DataCard(
                            callBack: _callBack,
                            collectedFrom: payments[index].memberFullName,
                            paymentDate: payments[index].paymentDate,
                            paymentAmount: payments[index].amount.toString(),
                            collectedBy: payments[index].collectedByFullName);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: Responsive.blockSizeVertical * 10),
                      itemCount: payments.length)
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
      _fetchPayments(formattedDate);
    }
    return formattedDate;
  }

  _callBack() {}

  _fetchPayments(String formattedDate) async {
    setState(() {
      payments = [];
    });

    FetchPaymentRequestModel fetchPaymentRequestModel =
        FetchPaymentRequestModel(formattedDate, "", "");
    final token =
        await SharedState.getSharedState(LocalAppState.TOKEN.toString());

    final json = RequestBaseModel.toJson(
        RequestBaseModel(token, fetchPaymentRequestModel),
        (value) => fetchPaymentRequestModel.toJson());

    final response = await APIService.sendRequest(
        requestType: RequestType.POST,
        url: APIConstants.fetchPayment,
        body: json);

    List<FetchPaymentResponseModel>? maranasamidhiEnquiryResponse =
        APIHelper.filterResponse(
            apiCallback: _apiCallback,
            response: response,
            apiOnFailureCallBackWithMessage: _apiOnFailureCallBackWithMessage);

    if (maranasamidhiEnquiryResponse != null &&
        maranasamidhiEnquiryResponse.isNotEmpty) {
      setState(() {
        payments = maranasamidhiEnquiryResponse;
      });
    }
  }

  _apiCallback(json) {
    if (json['data'] != null) {
      var data = json['data'] as List;
      List<FetchPaymentResponseModel> model =
          data.map((e) => FetchPaymentResponseModel.fromJson(e)).toList();
      return model;
    }
    return null;
  }

  _apiOnFailureCallBackWithMessage(APIResponseErrorType p1, String p2) {
    print("Error Happened! " + p2);
    return null;
  }

  void _addPayment() {
    Navigator.pushNamed(context, AddPaymentPage.routeName);
  }
}
