import 'package:balasamajam/constants/api_constants.dart';
import 'package:balasamajam/network/api_enums.dart';
import 'package:balasamajam/network/api_helper.dart';
import 'package:balasamajam/network/api_service.dart';
import 'package:balasamajam/utils/models/member_response_model.dart';

class CommonApiHelper {
  static Future<List<MemberResponseModel>> getAllMembers() async {
    List<MemberResponseModel> result = await getAllMembersRequest();
    return result;
  }

  static getAllMembersRequest() async {
    final response = await APIService.sendRequest(
        requestType: RequestType.GET, url: APIConstants.getAllMembers);

    print(response?.body);

    List<MemberResponseModel>? memberResponseModelList =
        APIHelper.filterResponse(
            apiCallback: _apiCallback,
            response: response,
            apiOnFailureCallBackWithMessage: _apiOnFailureCallBackWithMessage);
    if (memberResponseModelList != null && memberResponseModelList.isNotEmpty) {
      return memberResponseModelList;
    }
    return null;
  }

  static _apiCallback(json) {
    if (json['data'] != null) {
      var data = json['data'] as List;
      List<MemberResponseModel> model =
          data.map((e) => MemberResponseModel.fromJson(e)).toList();
      return model;
    }
    return null;
  }

  static _apiOnFailureCallBackWithMessage(APIResponseErrorType p1, String p2) {
    print("Error ${p2}");
    return null;
  }
}
