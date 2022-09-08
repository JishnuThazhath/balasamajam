import 'package:balasamajam/configs/shared_state.dart';
import 'package:balasamajam/constants/api_constants.dart';
import 'package:balasamajam/network/api_enums.dart';
import 'package:balasamajam/network/api_helper.dart';
import 'package:balasamajam/network/api_service.dart';
import 'package:balasamajam/objects/user_credentials.dart';
import 'package:balasamajam/screens/login/login_response.dart';
import 'package:http/http.dart' as http;

Future<LoginResponse?> loginUser(String username, String password) async {
  final _userCreds = UserCredentials(username, password);
  final _jsonBody = _userCreds.toJson();

  final response = await APIService.sendRequest(
      requestType: RequestType.POST,
      url: "${APIConstants.apiEndpoint}/login",
      body: _jsonBody);

  final loginResponse = APIHelper.filterResponse(
      apiCallback: getLoginResponse,
      response: response,
      apiOnFailureCallBackWithMessage: apiOnFailureCallBackWithMessage);

  return loginResponse;
}

Future<http.Response?> validateLogin(String token) async {
  final response = await APIService.sendRequest(
      requestType: RequestType.GET,
      url: "${APIConstants.apiEndpoint}/validate/$token");
  return response;
}

apiOnFailureCallBackWithMessage(APIResponseErrorType p1, String p2) {
  print("ERROR WHILE LOGGING IN! $p1.toString(), $p2");
}

getLoginResponse(json) {
  return LoginResponse.fromJson(json);
}

Future<bool> isLoggedIn() async {
  final _token =
      await SharedState.getSharedState(LocalAppState.TOKEN.toString());

  if (_token != null) {
    final response = await validateLogin(_token);
    if (response != null) {
      if (response.statusCode == 200) {
        return true;
      }
    }
  }

  return false;
}

Future<bool> isLoggedInState() async {
  final isLoggedState =
      await SharedState.getSharedState(LocalAppState.IS_LOGGED_IN.toString());

  if (isLoggedState != null) {
    return isLoggedState;
  }

  return false;
}
