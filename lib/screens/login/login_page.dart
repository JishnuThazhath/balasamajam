import 'package:balasamajam/components/template.dart';
import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/configs/shared_state.dart';
import 'package:balasamajam/constants/api_constants.dart';
import 'package:balasamajam/network/api_enums.dart';
import 'package:balasamajam/network/api_helper.dart';
import 'package:balasamajam/network/api_service.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/login/models/login_request_model.dart';
import 'package:balasamajam/screens/login/models/login_response.dart';
import 'package:balasamajam/utils/on_screen_message_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  static const String routeName = "LoginScreen";

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String? username;
  String? password;

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
              return Template(key: UniqueKey());
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
              horizontal: Responsive.blockSizeHorizontal * 30,
              vertical: Responsive.blockSizeVertical * 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(child: Image.asset("images/logo.png")),
              SizedBox(height: Responsive.blockSizeVertical * 50),
              const Text("Login.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: Responsive.blockSizeVertical * 10),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onSaved: (newValue) {
                          username = newValue;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Username",
                            prefixIcon: Icon(Icons.lock_outline_sharp)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Responsive.blockSizeVertical * 10),
                      TextFormField(
                        obscureText: true,
                        onSaved: (newValue) {
                          password = newValue;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock_outline_sharp)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password cannot be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Responsive.blockSizeVertical * 10),
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
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                _login();
                              }
                            },
                            child: Text("Submit",
                                style: LocalThemeData.labelTextW)),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _login() async {
    final loginResponse = await loginUser(username!, password!);

    if (loginResponse != null) {
      final token = loginResponse.token;
      final validateLoginResponse = await validateLogin(token);

      if (validateLoginResponse != null &&
          validateLoginResponse.statusCode == 200) {
        SharedState.putIsLoggedInState(
            LocalAppState.IS_LOGGED_IN.toString(), true);

        SharedState.saveLoginToken(LocalAppState.TOKEN.toString(), token);

        SharedState.saveLoginToken(
            LocalAppState.ADMIN_ID.toString(), loginResponse.adminId);

        _formKey.currentState!.reset();

        Navigator.pushNamedAndRemoveUntil(
            context, Template.routeName, (route) => false);
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
    OnScreenMessageUtil.showSnackBarBottom(
        p2, context, OnScreenMessageUtil.RED);
    return null; //this returns null response. so that the login logic can handle it.
  }

  getLoginResponse(json) {
    return LoginResponse.fromJson(json['data']);
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
