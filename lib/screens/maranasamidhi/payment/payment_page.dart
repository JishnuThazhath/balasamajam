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
import 'package:balasamajam/screens/maranasamidhi/payment/models/payments_model.dart';
import 'package:balasamajam/utils/common_api_helper.dart';
import 'package:balasamajam/utils/fetch_admins.dart';
import 'package:balasamajam/utils/models/admin_response_model.dart';
import 'package:balasamajam/utils/models/member_response_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController dateController = TextEditingController();

  List<FetchPaymentResponseModel> payments = [];
  PaymentsModel? paymentsModel;

  final _formKey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> membersDropList = [];
  List<DropdownMenuItem<String>> adminDropDownList = [];

  List<MemberResponseModel> membersDropListNew = [];
  List<AdminResponseModel> adminsDropListNew = [];

  String? memberId;
  String? adminId;

  @override
  void initState() {
    // _populateMembersDropList();
    // _populateAdminDropList();
    _populateMembersDropListNew();
    _populateAdminDropListNew();
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
            GestureDetector(
              onTap: _showFilter,
              child: Row(
                children: const [
                  Text("Filter"),
                  Icon(Icons.arrow_downward_outlined)
                ],
              ),
            )
          ]),
          const Divider(thickness: 2),
          Expanded(
              child: payments.isNotEmpty
                  ? RefreshIndicator(
                      onRefresh: () async {
                        await _fetchPayments();
                      },
                      child: ListView.separated(
                          addAutomaticKeepAlives: false,
                          itemBuilder: (context, index) {
                            return DataCard(
                                callBack: _callBack,
                                collectedFrom: payments[index].memberFullName,
                                paymentDate: payments[index].paymentDate,
                                paymentAmount:
                                    payments[index].amount.toString(),
                                collectedBy:
                                    payments[index].collectedByFullName);
                          },
                          separatorBuilder: (context, index) => SizedBox(
                              height: Responsive.blockSizeVertical * 10),
                          itemCount: paymentsModel!.payments.length),
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
    }
    setState(() {
      dateController.text = formattedDate;
    });
    return formattedDate;
  }

  _callBack() {}

  _fetchPayments() async {
    setState(() {
      payments = [];
    });

    FetchPaymentRequestModel fetchPaymentRequestModel =
        FetchPaymentRequestModel(dateController.text, memberId, adminId);
    final token =
        await SharedState.getSharedState(LocalAppState.TOKEN.toString());

    final json = RequestBaseModel.toJson(
        RequestBaseModel(token, fetchPaymentRequestModel),
        (value) => fetchPaymentRequestModel.toJson());

    final response = await APIService.sendRequest(
        requestType: RequestType.POST,
        url: APIConstants.fetchPayment,
        body: json);

    PaymentsModel? maranasamidhiEnquiryResponse = APIHelper.filterResponse(
        apiCallback: _apiCallback,
        response: response,
        apiOnFailureCallBackWithMessage: _apiOnFailureCallBackWithMessage);

    if (maranasamidhiEnquiryResponse != null &&
        maranasamidhiEnquiryResponse.payments.isNotEmpty) {
      setState(() {
        paymentsModel = maranasamidhiEnquiryResponse;
        payments = maranasamidhiEnquiryResponse.payments;
      });
    }
  }

  _apiCallback(json) {
    if (json['data'] != null) {
      var data = json['data'];
      PaymentsModel model = PaymentsModel.fromJson(data);
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

  _populateMembersDropList() async {
    List<MemberResponseModel> members = await CommonApiHelper.getAllMembers();
    setState(() {
      for (var element in members) {
        membersDropList.add(DropdownMenuItem(
            value: element.memberId, child: Text(element.memberFullName)));
      }
    });
  }

  _populateMembersDropListNew() async {
    List<MemberResponseModel> members = await CommonApiHelper.getAllMembers();
    setState(() {
      membersDropListNew = members;
    });
  }

  _populateAdminDropList() async {
    List<AdminResponseModel>? admins = await FetchAdmins.fetchAllAdmins();
    setState(() {
      if (admins == null) {
        adminDropDownList = [];
      } else {
        for (var element in admins) {
          adminDropDownList.add(DropdownMenuItem(
              value: element.adminid, child: Text(element.adminFullName)));
        }
      }
    });
  }

  _populateAdminDropListNew() async {
    List<AdminResponseModel> admins = await FetchAdmins.fetchAllAdmins();
    setState(() {
      if (admins == null) {
        adminsDropListNew = [];
      } else {
        adminsDropListNew = admins;
      }
    });
  }

  _showFilter() {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        isDismissible: true,
        builder: (context) {
          return SizedBox(
            height: Responsive.blockSizeVertical * 400,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                  child: Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(children: [
                              GestureDetector(
                                onTap: () async {
                                  await _showDatePicker();
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.calendar_month_outlined),
                                    SizedBox(
                                        width:
                                            Responsive.blockSizeHorizontal * 5),
                                    Text(
                                      dateController.text,
                                      style: LocalThemeData.labelTextB,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: Responsive.blockSizeVertical * 10),
                              DropdownSearch<AdminResponseModel>(
                                  popupProps: const PopupProps.menu(
                                      //showSelectedItems: true,
                                      showSearchBox: true),
                                  items: adminsDropListNew,
                                  // asyncItems: (text) =>
                                  //     FetchAdmins.fetchAllAdmins(),
                                  itemAsString: (AdminResponseModel model) =>
                                      model.adminFullName,
                                  dropdownDecoratorProps:
                                      const DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Select Admin",
                                      hintText: "Select Admin",
                                    ),
                                  ),
                                  onChanged: (value) {
                                    adminId = value?.adminid;
                                  }),
                              SizedBox(
                                  height: Responsive.blockSizeVertical * 10),
                              DropdownSearch<MemberResponseModel>(
                                  popupProps: const PopupProps.menu(
                                      //showSelectedItems: true,
                                      showSearchBox: true),
                                  items: membersDropListNew,
                                  // asyncItems: (text) =>
                                  //     CommonApiHelper.getAllMembers(),
                                  itemAsString: (MemberResponseModel model) =>
                                      model.memberFullName,
                                  dropdownDecoratorProps:
                                      const DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Select Member",
                                      hintText: "Select Member",
                                    ),
                                  ),
                                  onChanged: (value) {
                                    memberId = value?.memberId;
                                  }),
                              SizedBox(
                                  height: Responsive.blockSizeVertical * 10),
                              SizedBox(
                                height: Responsive.blockSizeVertical * 70,
                                width: Responsive.blockSizeHorizontal * 500,
                                child: OutlinedButton(
                                    style: ButtonStyle(backgroundColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((states) {
                                      if (states
                                          .contains(MaterialState.disabled)) {
                                        return Colors.grey;
                                      }
                                      return LocalThemeData.primaryColor;
                                    })),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();

                                        _fetchPayments();

                                        Navigator.pop(context);
                                      }
                                    },
                                    child: Text("Submit",
                                        style: LocalThemeData.labelTextW)),
                              )
                            ])
                          ]))),
            ),
          );
        });
  }
}
