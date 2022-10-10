import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/configs/shared_state.dart';
import 'package:balasamajam/constants/api_constants.dart';
import 'package:balasamajam/general/models/request_base_model.dart';
import 'package:balasamajam/network/api_enums.dart';
import 'package:balasamajam/network/api_helper.dart';
import 'package:balasamajam/network/api_service.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/maranasamidhi/member/add/add_member_page.dart';
import 'package:balasamajam/screens/maranasamidhi/member/data_card.dart';
import 'package:balasamajam/screens/maranasamidhi/member/models/fetch_member_request_model.dart';
import 'package:balasamajam/screens/maranasamidhi/member/models/fetch_member_response_model.dart';
import 'package:balasamajam/utils/on_screen_message_util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController dateController = TextEditingController();
  List<FetchMemberResponseModel> members = <FetchMemberResponseModel>[];

  String? searchText;

  @override
  void initState() {
    DateTime now = DateTime.now();
    String formattedNow = DateFormat("dd/MM/yyyy").format(now);
    dateController.text = formattedNow;
    _fetchMembers();
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
                onPressed: _addMember,
                child: Text("Add Member", style: LocalThemeData.labelTextB)),
          ),
          Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: Responsive.blockSizeHorizontal * 720,
                    child: TextFormField(
                      onSaved: (newValue) {
                        searchText = newValue;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Member Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Member Name cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                      height: Responsive.blockSizeVertical * 60,
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

                            _fetchMembers();

                            OnScreenMessageUtil.showSnackBarBottom(
                                "Fetchin data...",
                                context,
                                OnScreenMessageUtil.GREEN);
                          }
                        },
                        child: const Icon(Icons.search, color: Colors.white),
                      ))
                ],
              )),
          SizedBox(height: Responsive.blockSizeVertical * 15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Member Summary", style: LocalThemeData.labelText),
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
              child: members.isNotEmpty
                  ? ListView.separated(
                      addAutomaticKeepAlives: false,
                      itemBuilder: (context, index) {
                        return DataCard(
                            fullName: members[index].memberFullName,
                            localFullName: members[index].memberLocalName,
                            phone: members[index].phoneNumber,
                            maranavari: members[index].maranavari.toString(),
                            masavari: members[index].masavari.toString(),
                            total: members[index].total.toString(),
                            callBack: _callBack);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: Responsive.blockSizeVertical * 10),
                      itemCount: members.length)
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
    return formattedDate;
  }

  // CALL TO FETCH MEMBERS INFORMATION
  _fetchMembers() async {
    setState(() {
      members = [];
    });

    String formattedDate = dateController.text;
    print("Selected Date is : " + formattedDate);

    FetchMemberRequestModel fetchMemberRequestModel =
        FetchMemberRequestModel(searchText);

    final token =
        await SharedState.getSharedState(LocalAppState.TOKEN.toString());

    final json = RequestBaseModel.toJson(
        RequestBaseModel(token, fetchMemberRequestModel),
        (value) => fetchMemberRequestModel.toJson());

    final response = await APIService.sendRequest(
        requestType: RequestType.POST,
        url: APIConstants.fetchMembers,
        body: json);

    List<FetchMemberResponseModel>? memberResponseModel =
        APIHelper.filterResponse(
            apiCallback: _apiCallback,
            response: response,
            apiOnFailureCallBackWithMessage: _apiOnFailureCallBackWithMessage);

    if (memberResponseModel != null && memberResponseModel.isNotEmpty) {
      setState(() {
        members = memberResponseModel;
      });
    }
  }

  _apiCallback(json) {
    if (json['data'] != null) {
      var data = json['data'] as List;
      List<FetchMemberResponseModel> model =
          data.map((e) => FetchMemberResponseModel.fromJson(e)).toList();
      return model;
    }
    return null;
  }

  _apiOnFailureCallBackWithMessage(APIResponseErrorType type, String message) {
    OnScreenMessageUtil.showSnackBarBottom(
        "Error Happened! ${message}", context, OnScreenMessageUtil.RED);
    return null;
  }

  void _addMember() {
    Navigator.pushNamed(context, AddMemberPage.routeName);
  }

  _callBack() {}
}
