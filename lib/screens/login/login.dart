import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/configs/shared_state.dart';
import 'package:balasamajam/constants/api_constants.dart';
import 'package:balasamajam/data/login/objects/login_request_model.dart';
import 'package:balasamajam/network/api_enums.dart';
import 'package:balasamajam/network/api_helper.dart';
import 'package:balasamajam/network/api_service.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/home/home_screen.dart';
import 'package:balasamajam/screens/login/login_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  static const String routeName = "LoginScreen";

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? passwordErrorText = null;
  String? usernameErrorText = null;

  String loginErrorMesssage = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == true) {
              return HomeScreen(key: UniqueKey());
            }
          }
          return _loginScreen();
        });
  }

  _loginScreen() {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.blockSizeHorizontal * 20,
              vertical: Responsive.blockSizeVertical * 10),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                    contentPadding: EdgeInsets.all(10),
                    errorText: usernameErrorText),
              ),
              SizedBox(height: Responsive.blockSizeVertical * 10),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    contentPadding: EdgeInsets.all(10),
                    errorText: passwordErrorText),
              ),
              SizedBox(height: Responsive.blockSizeVertical * 10),
              Text(loginErrorMesssage, style: LocalThemeData.errorMessage),
              ElevatedButton(
                onPressed: () => _login(),
                style: LocalThemeData.buttonPrimartColor,
                child: Text("Login", style: LocalThemeData.buttonText),
              ),
            ],
          )),
        ),
      ),
    );
  }

  _login() async {
    final loginResponse =
        await loginUser(usernameController.text, passwordController.text);
    if (loginResponse != null) {
      final token = loginResponse.token;
      final validateLoginResponse = await validateLogin(token);
      if (validateLoginResponse != null &&
          validateLoginResponse.statusCode == 200) {
        print("you are logged in...");
        SharedState.putIsLoggedInState(
            LocalAppState.IS_LOGGED_IN.toString(), true);
        SharedState.saveLoginToken(LocalAppState.TOKEN.toString(), token);
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (route) => false);
      }
    }
  }

  Future<LoginResponse?> loginUser(String username, String password) async {
    final userCreds = LoginRequestModel(username, password);
    final jsonBody = userCreds.toJson();

    final response = await APIService.sendRequest(
        requestType: RequestType.POST,
        url: "${APIConstants.apiEndpoint}/login",
        body: jsonBody);

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
    setState(() {
      loginErrorMesssage = "Login Failed! - $p2";
    });

    return null; //this returns null response. so that the login logic can handle it.
  }

  getLoginResponse(json) {
    return LoginResponse.fromJson(json);
  }

  _setLoginErrorMessage(String message) {
    setState(() {
      loginErrorMesssage = message;
    });
  }

  _isLoggedIn() async {
    final loggedInState =
        await SharedState.getSharedState(LocalAppState.IS_LOGGED_IN.toString());

    return loggedInState != null && loggedInState == true;
  }
}
