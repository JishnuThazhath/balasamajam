import 'package:balasamajam/components/template.dart';
import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/configs/shared_state.dart';
import 'package:balasamajam/constants/api_constants.dart';
import 'package:balasamajam/general/models/request_base_model.dart';
import 'package:balasamajam/general/models/response_base_model.dart';
import 'package:balasamajam/network/api_enums.dart';
import 'package:balasamajam/network/api_helper.dart';
import 'package:balasamajam/network/api_service.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/maranasamidhi/payment/add/models/add_payment_request_model.dart';
import 'package:balasamajam/screens/maranasamidhi/payment/add/models/add_payment_response_model.dart';
import 'package:balasamajam/utils/common_api_helper.dart';
import 'package:balasamajam/utils/models/member_response_model.dart';
import 'package:balasamajam/utils/on_screen_message_util.dart';
import 'package:flutter/material.dart';

class AddPaymentPage extends StatefulWidget {
  const AddPaymentPage({super.key});

  static String routeName = "AddPaymentPage";

  @override
  State<AddPaymentPage> createState() => _AddPaymentPageState();
}

class _AddPaymentPageState extends State<AddPaymentPage> {
  final _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> membersDropList = [];

  String? snackBarMessage;

  String? memberId;
  double? paymentAmount;
  String? comments;
  String? adminId;

  @override
  void initState() {
    adminId = _getAdminIdFromState();
    _populateMembersDropList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Template(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
            size: Responsive.blockSizeVertical * 300,
            Icons.currency_rupee_sharp),
        Expanded(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child:
                          Text("Add Payment", style: LocalThemeData.subTitle)),
                  const Divider(thickness: 2),
                  DropdownButtonFormField(
                    onSaved: (newValue) {
                      memberId = newValue;
                    },
                    decoration: InputDecoration(
                        hintText: "Select Member",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    items: membersDropList,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: Responsive.blockSizeVertical * 10),
                  TextFormField(
                    onSaved: (newValue) {
                      paymentAmount = double.parse(newValue!);
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Amount"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Amount cannot be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: Responsive.blockSizeVertical * 10),
                  TextFormField(
                      minLines: 1,
                      maxLines: 5,
                      maxLength: 100,
                      onSaved: (newValue) {
                        comments = newValue;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Comments")),
                  SizedBox(
                    height: Responsive.blockSizeVertical * 50,
                    width: Responsive.blockSizeHorizontal * 500,
                    child: OutlinedButton(
                        style: ButtonStyle(backgroundColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.grey;
                          }
                          return LocalThemeData.primaryColor;
                        })),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            _addPaymentRequest();
                          }
                        },
                        child:
                            Text("Submit", style: LocalThemeData.labelTextW)),
                  )
                ],
              )),
        )
      ],
    ));
  }

  String? _getAdminIdFromState() {
    String? id = SharedState.getSharedStateWithoutWait(
        LocalAppState.ADMIN_ID.toString());
    return id;
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

  void _addPaymentRequest() async {
    AddPaymentRequestModel addPaymentRequestModel =
        AddPaymentRequestModel(memberId!, adminId!, paymentAmount!, comments!);

    final token =
        await SharedState.getSharedState(LocalAppState.TOKEN.toString());

    final json = RequestBaseModel.toJson(
        RequestBaseModel(token, addPaymentRequestModel),
        (value) => addPaymentRequestModel.toJson());

    final response = await APIService.sendRequest(
        requestType: RequestType.POST,
        url: APIConstants.addPayment,
        body: json);

    ResponseBaseModel? responseBaseModel = APIHelper.filterResponse(
        apiCallback: _apiCallback,
        response: response,
        apiOnFailureCallBackWithMessage: _apiOnFailureCallBackWithMessage);

    if (responseBaseModel != null && responseBaseModel.status == "OK") {
      OnScreenMessageUtil.showSnackBarBottom(
          responseBaseModel.message, context, OnScreenMessageUtil.GREEN);
      _formKey.currentState!.reset();
    }
  }

  _apiCallback(json) {
    if (json != null) {
      ResponseBaseModel response = ResponseBaseModel.fromJson(
          json, (json) => AddPaymentResponseModel.fromJson);
      return response;
    }
    return null;
  }

  _apiOnFailureCallBackWithMessage(APIResponseErrorType p1, String p2) {
    OnScreenMessageUtil.showSnackBarBottom(
        p2, context, OnScreenMessageUtil.RED);
    return null;
  }
}
