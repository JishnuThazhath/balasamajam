import 'package:balasamajam/components/full_page_header.dart';
import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/configs/shared_state.dart';
import 'package:balasamajam/constants/api_constants.dart';
import 'package:balasamajam/general/models/request_base_model.dart';
import 'package:balasamajam/general/models/response_base_model.dart';
import 'package:balasamajam/network/api_enums.dart';
import 'package:balasamajam/network/api_helper.dart';
import 'package:balasamajam/network/api_service.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/maranasamidhi/member/add/models/add_member_request_model.dart';
import 'package:balasamajam/screens/maranasamidhi/payment/add/models/add_payment_response_model.dart';
import 'package:balasamajam/utils/on_screen_message_util.dart';
import 'package:flutter/material.dart';

class AddMemberPage extends StatefulWidget {
  static String routeName = "AddMemberPage";

  const AddMemberPage({super.key});

  @override
  State<AddMemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<AddMemberPage> {
  final _formKey = GlobalKey<FormState>();

  String? snackBarMessage;

  String? fullName;
  String? localizedFullName;
  String? phone;
  String? address; //This field can be empty
  String? adminId;

  @override
  void initState() {
    adminId = _getAdminIdFromState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FullPageHeader(showBackButton: true),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  padding: EdgeInsets.symmetric(
                      horizontal: Responsive.blockSizeHorizontal * 50,
                      vertical: Responsive.blockSizeVertical * 50),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Add Member",
                                  style: LocalThemeData.subTitle)),
                          const Divider(thickness: 2),
                          SizedBox(height: Responsive.blockSizeVertical * 10),
                          TextFormField(
                            onSaved: (newValue) {
                              fullName = newValue;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                prefixIcon: const Icon(Icons.person),
                                hintText: "Full Name"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Full Name cannot be empty";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: Responsive.blockSizeVertical * 10),
                          TextFormField(
                            onSaved: (newValue) {
                              localizedFullName = newValue;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                prefixIcon: const Icon(Icons.person),
                                hintText: "Enter Name in Malayalam"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Name filed cannot be empty";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: Responsive.blockSizeVertical * 10),
                          TextFormField(
                            onSaved: (newValue) {
                              phone = newValue;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                prefixIcon: const Icon(Icons.phone_callback),
                                hintText: "Phone Number"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Phone Numer cannot be empty";
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
                                address = newValue;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "Address")),
                          SizedBox(
                            height: Responsive.blockSizeVertical * 50,
                            width: Responsive.blockSizeHorizontal * 500,
                            child: OutlinedButton(
                                style: ButtonStyle(backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return Colors.grey;
                                  }
                                  return LocalThemeData.primaryColor;
                                })),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();

                                    _addMemberRequest();
                                  }
                                },
                                child: Text("Submit",
                                    style: LocalThemeData.labelTextW)),
                          )
                        ],
                      )),
                ),
              )
            ],
          ),
        ));
  }

  String? _getAdminIdFromState() {
    String? id = SharedState.getSharedStateWithoutWait(
        LocalAppState.ADMIN_ID.toString());
    return id;
  }

  void _addMemberRequest() async {
    AddMemberRequestModel addMemberRequestModel =
        AddMemberRequestModel(fullName!, address!, phone!, localizedFullName!);

    final token =
        await SharedState.getSharedState(LocalAppState.TOKEN.toString());

    final json = RequestBaseModel.toJson(
        RequestBaseModel(token, addMemberRequestModel),
        (value) => addMemberRequestModel.toJson());

    final response = await APIService.sendRequest(
        requestType: RequestType.POST, url: APIConstants.addMember, body: json);

    ResponseBaseModel? responseBaseModel = APIHelper.filterResponse(
        apiCallback: _apiCallback,
        response: response,
        apiOnFailureCallBackWithMessage: _apiOnFailureCallBackWithMessage);

    if (responseBaseModel != null && responseBaseModel.status == "OK") {
      OnScreenMessageUtil.showSnackBarBottom(
          responseBaseModel.message, context, OnScreenMessageUtil.GREEN);
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
        "Error while adding payment ${p2}", context, OnScreenMessageUtil.RED);
    return null;
  }
}
