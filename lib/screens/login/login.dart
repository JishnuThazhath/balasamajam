import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/configs/shared_state.dart';
import 'package:balasamajam/constants/api_constants.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../data/login/login_user.dart';

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
        future: isLoggedInState(),
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
      final _token = loginResponse.token;
      if (_token != null) {
        final _validateLogin = await validateLogin(_token);
        if (_validateLogin != null && _validateLogin.statusCode == 200) {
          print("you are logged in...");
          SharedState.putIsLoggedInState(
              LocalAppState.IS_LOGGED_IN.toString(), true);
          Navigator.pop(
              context); //to not return to the login page once after logged in
          Navigator.pushNamed(context, HomeScreen.routeName);
        }
      }
    } else {
      _setLoginErrorMessage("Login Failed");
    }
  }

  _setLoginErrorMessage(String message) {
    setState(() {
      loginErrorMesssage = message;
    });
  }
}
