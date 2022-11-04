import 'package:balasamajam/constants/api_constants.dart';
import 'package:balasamajam/network/api_enums.dart';
import 'package:balasamajam/network/api_helper.dart';
import 'package:balasamajam/network/api_service.dart';
import 'package:balasamajam/utils/models/admin_response_model.dart';

class FetchAdmins {
  static Future<List<AdminResponseModel>> fetchAllAdmins() async {
    final response = await APIService.sendRequest(
        requestType: RequestType.GET, url: APIConstants.getAllAdmins);

    print(response?.body);

    List<AdminResponseModel>? memberResponseModelList =
        APIHelper.filterResponse(
            apiCallback: _apiCallback,
            response: response,
            apiOnFailureCallBackWithMessage: _apiOnFailureCallBackWithMessage);
    if (memberResponseModelList != null && memberResponseModelList.isNotEmpty) {
      return memberResponseModelList;
    }

    return [];
  }

  static _apiCallback(json) {
    if (json['data'] != null) {
      var data = json['data'] as List;
      List<AdminResponseModel> model =
          data.map((e) => AdminResponseModel.fromJson(e)).toList();
      return model;
    }
    return null;
  }

  static _apiOnFailureCallBackWithMessage(APIResponseErrorType p1, String p2) {
    print("Error ${p2}");
    return null;
  }
}
