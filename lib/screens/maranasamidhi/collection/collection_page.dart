import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/configs/shared_state.dart';
import 'package:balasamajam/constants/api_constants.dart';
import 'package:balasamajam/general/models/request_base_model.dart';
import 'package:balasamajam/network/api_enums.dart';
import 'package:balasamajam/network/api_helper.dart';
import 'package:balasamajam/network/api_service.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/maranasamidhi/collection/data_card.dart';
import 'package:balasamajam/screens/maranasamidhi/collection/models/collection_request_model.dart';
import 'package:balasamajam/screens/maranasamidhi/collection/models/collection_response_model.dart';
import 'package:balasamajam/screens/maranasamidhi/payment/add/add_payment_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  TextEditingController dateController = TextEditingController();
  List<CollectionResponseModel> collections = <CollectionResponseModel>[];
  String? adminId;

  @override
  void initState() {
    adminId = _getAdminIdFromState();
    DateTime now = DateTime.now();
    String formattedNow = DateFormat("dd/MM/yyyy").format(now);
    dateController.text = formattedNow;
    _fetchPayments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Weekly Collection", style: LocalThemeData.labelText),
            Row(
              children: [
                GestureDetector(
                    onTap: () async {
                      await _showDatePicker();
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
              child: collections.isNotEmpty
                  ? RefreshIndicator(
                      onRefresh: () async {
                        await _fetchPayments();
                      },
                      child: ListView.separated(
                          addAutomaticKeepAlives: false,
                          itemBuilder: (context, index) {
                            return DataCard(
                                callBack: _callBack,
                                collectedFrom:
                                    collections[index].collectedFromFullName,
                                paymentDate: collections[index].paymentDate,
                                paymentAmount:
                                    collections[index].paidAmount.toString(),
                                collectedBy:
                                    collections[index].collectedByFullName);
                          },
                          separatorBuilder: (context, index) => SizedBox(
                              height: Responsive.blockSizeVertical * 10),
                          itemCount: collections.length),
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
      _fetchPayments();
    }
    setState(() {
      dateController.text = formattedDate;
    });
    return formattedDate;
  }

  _callBack() {}

  _fetchPayments() async {
    setState(() {
      collections = [];
    });

    CollectionRequestModel fetchPaymentRequestModel =
        CollectionRequestModel(dateController.text, adminId!);
    final token =
        await SharedState.getSharedState(LocalAppState.TOKEN.toString());

    final json = RequestBaseModel.toJson(
        RequestBaseModel(token, fetchPaymentRequestModel),
        (value) => fetchPaymentRequestModel.toJson());

    final response = await APIService.sendRequest(
        requestType: RequestType.POST,
        url: APIConstants.fetchPayment,
        body: json);

    List<CollectionResponseModel>? maranasamidhiEnquiryResponse =
        APIHelper.filterResponse(
            apiCallback: _apiCallback,
            response: response,
            apiOnFailureCallBackWithMessage: _apiOnFailureCallBackWithMessage);

    if (maranasamidhiEnquiryResponse != null &&
        maranasamidhiEnquiryResponse.isNotEmpty) {
      setState(() {
        collections = maranasamidhiEnquiryResponse;
      });
    }
  }

  _apiCallback(json) {
    if (json['data'] != null) {
      var data = json['data'] as List;
      List<CollectionResponseModel> model =
          data.map((e) => CollectionResponseModel.fromJson(e)).toList();
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

  String? _getAdminIdFromState() {
    String? id = SharedState.getSharedStateWithoutWait(
        LocalAppState.ADMIN_ID.toString());
    return id;
  }
}
