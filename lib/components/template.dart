import 'package:balasamajam/components/user_login_info.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/home/home_screen.dart';
import 'package:balasamajam/screens/kavadi/kavadi_home.dart';
import 'package:balasamajam/screens/maranasamidhi/maranasamidhi_home.dart';
import 'package:flutter/material.dart';

class Template extends StatelessWidget {
  Widget child;
  Template({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.blockSizeHorizontal * 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const UserLoginInfo(),
              SizedBox(height: Responsive.blockSizeVertical * 30),
              Expanded(child: child)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.festival), label: "Kavadi"),
          BottomNavigationBarItem(
              icon: Icon(Icons.work), label: "Maranasamidhi")
        ],
        backgroundColor: Colors.white,
        onTap: (value) => {_bottomNavigationBarClickEvent(value, context)},
      ),
    );
  }

  _bottomNavigationBarClickEvent(int idx, BuildContext context) {
    //todo : if the screen already the selected screen then do nothing. this will avoid the exra animation.
    String routeName = HomeScreen.routeName;

    switch (idx) {
      case 1:
        {
          routeName = KavadiHome.routeName;
        }
        break;
      case 2:
        {
          routeName = MaranasamidhiHome.routeName;
        }
        break;
    }

    Navigator.pushNamed(context, routeName);
  }
}
