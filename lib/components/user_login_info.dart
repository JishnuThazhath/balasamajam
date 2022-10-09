import 'package:balasamajam/components/full_page_header.dart';
import 'package:balasamajam/components/hero_dialog_route.dart';
import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/configs/shared_state.dart';
import 'package:balasamajam/constants/api_constants.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/login/login_page.dart';
import 'package:flutter/material.dart';

const String USER_INFO = "user-info";

class UserLoginInfo extends StatefulWidget {
  const UserLoginInfo({super.key});

  @override
  State<UserLoginInfo> createState() => _UserLoginInfoState();
}

class _UserLoginInfoState extends State<UserLoginInfo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FullPageHeader(showBackButton: false),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        HeroDialogRoute(
                            builder: (context) =>
                                const UserLoginInfoDetailed()));
                  },
                  child:
                      const Hero(tag: USER_INFO, child: Icon(Icons.person)))),
        ),
      ],
    );
  }
}

class UserLoginInfoDetailed extends StatefulWidget {
  const UserLoginInfoDetailed({super.key});

  @override
  State<UserLoginInfoDetailed> createState() => _UserLoginInfoDetailedState();
}

class _UserLoginInfoDetailedState extends State<UserLoginInfoDetailed> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Hero(
            tag: USER_INFO,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Manakody Balasamajam", style: LocalThemeData.subTitle),
                const Divider(color: Colors.white, thickness: 0.4),
                Row(children: [
                  const Icon(Icons.person),
                  const SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [Text("Admin")],
                  )
                ]),
                const Divider(color: Colors.white, thickness: 0.4),
                ElevatedButton(onPressed: _logout, child: Text("Logout"))
              ],
            )),
      ),
    );
  }

  void _logout() async {
    await SharedState.removeState(LocalAppState.TOKEN.toString());
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        ((route) => false));
  }
}
