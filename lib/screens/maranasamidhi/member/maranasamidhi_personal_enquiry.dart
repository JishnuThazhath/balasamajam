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
import 'package:balasamajam/screens/maranasamidhi/expense/expense_entry.dart';
import 'package:balasamajam/screens/maranasamidhi/member/member_enquiry_list_component.dart';
import 'package:balasamajam/screens/maranasamidhi/member/models/maranasamidhi_enquiry_request_model.dart';
import 'package:balasamajam/screens/maranasamidhi/member/models/maranasamidhi_enquiry_response_model.dart';
import 'package:flutter/material.dart';

class MaranasamidhiPersonalEnquiry extends StatefulWidget {
  const MaranasamidhiPersonalEnquiry({super.key});

  static const String routeName = "MaranasamidhiPersonalEnquiry";

  @override
  State<MaranasamidhiPersonalEnquiry> createState() =>
      _MaranasamidhiPersonalEnquiryState();
}

class _MaranasamidhiPersonalEnquiryState
    extends State<MaranasamidhiPersonalEnquiry> {
  List<MaranasamidhiEnquiryResponseModel> entries =
      <MaranasamidhiEnquiryResponseModel>[];
  TextEditingController searchController = TextEditingController();

  List<List<String>> tableData = [[]];

  @override
  Widget build(BuildContext context) {
    return Template(
        child: Center(
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          GestureDetector(
            onTap: _addPayment,
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: LocalThemeData.primaryColor, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.blockSizeHorizontal * 20,
                  vertical: Responsive.blockSizeVertical * 10),
              child: Text("Add Payment", style: LocalThemeData.subTitle),
            ),
          )
        ]),
        SizedBox(height: Responsive.blockSizeVertical * 50),
        Text("Maranasamidhi - Personal Enquiry",
            style: LocalThemeData.subTitle),
        SizedBox(height: Responsive.blockSizeVertical * 30),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: Responsive.blockSizeHorizontal * 750,
            height: Responsive.blockSizeVertical * 45,
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(width: Responsive.blockSizeHorizontal * 10),
          ElevatedButton(
              onPressed: _fetchMemberDetails,
              style: LocalThemeData.buttonPrimartColor,
              child: Text("Go", style: LocalThemeData.buttonText)),
        ]),
        SizedBox(height: Responsive.blockSizeVertical * 10),
        Align(
            alignment: Alignment.centerLeft,
            child: entries.length > 0
                ? Text("Mudakkamulla Thuga", style: LocalThemeData.subTitle)
                : null),
        SizedBox(height: Responsive.blockSizeVertical * 10),
        Expanded(
          child: ListView.separated(
            addAutomaticKeepAlives: false,
            itemCount: entries.length,
            padding: const EdgeInsets.all(2.0),
            itemBuilder: ((context, index) {
              return MemberEnquiryListComponent(
                  name: entries[index].name,
                  totalMaranavariAmount:
                      entries[index].totalMaranavariAmount.toString(),
                  totalMasavariAmount:
                      entries[index].totalMasavariAmount.toString(),
                  totalPayableAmount:
                      entries[index].totalPayableAmount.toString());
              ;
            }),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 5.0),
          ),
        ),
        LongCard(
          mainText: "View Payment History",
          callBack: () => _paymentHistory(),
        ),
        SizedBox(height: Responsive.blockSizeVertical * 30),
      ]),
    ));
  }

  List<String> _getHeaders() {
    return ["Maranavari", "Masavari", "Total"];
  }

  List<List<String>> _getData() {
    return [
      ["100 INR", "10 INR", "110"]
    ];
  }

  _paymentHistory() {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => PaymentHistory(name: "Edward Cullen")));
  }

  void _addPayment() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ExpenseEntry(category: "Maranasamidhi")));
  }

  rowOnClick(row) {}

  _fetchMemberDetails() async {
    String searchText = searchController.text;

    setState(() {
      entries = [];
    });

    MaranasamidhiEnquiryRequestModel maranasamidhiEnquiryRequestModel =
        MaranasamidhiEnquiryRequestModel(searchText);

    final token =
        await SharedState.getSharedState(LocalAppState.TOKEN.toString());

    final json = RequestBaseModel.toJson(
        RequestBaseModel(token, maranasamidhiEnquiryRequestModel),
        (value) => maranasamidhiEnquiryRequestModel.toJson());

    final response = await APIService.sendRequest(
        requestType: RequestType.POST,
        url: APIConstants.searchMember,
        body: json);

    List<MaranasamidhiEnquiryResponseModel>? maranasamidhiEnquiryResponse =
        APIHelper.filterResponse(
            apiCallback: apiCallback,
            response: response,
            apiOnFailureCallBackWithMessage: apiOnFailureCallBackWithMessage);

    if (maranasamidhiEnquiryResponse != null) {
      setState(() {
        entries = maranasamidhiEnquiryResponse;
      });
    }
  }

  apiCallback(json) {
    if (json['data'] != null) {
      var data = json['data'] as List;
      List<MaranasamidhiEnquiryResponseModel> model = data
          .map((e) => MaranasamidhiEnquiryResponseModel.fromJson(e))
          .toList();
      return model;
    }
    return null;
  }

  apiOnFailureCallBackWithMessage(APIResponseErrorType type, String message) {
    print("Error Happened! " + message);
    return null;
  }
}
