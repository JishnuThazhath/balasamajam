import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/kavadi/kavadi_home.dart';
import 'package:balasamajam/screens/maranasamidhi/maranasamidhi_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Function(Widget page) changePageState;

  HomeScreen({super.key, required this.changePageState});

  static const String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              _kavadi();
            },
            child: Container(
                //color: Colors.red,
                height: Responsive.blockSizeVertical * 300,
                width: Responsive.blockSizeHorizontal * 850,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, spreadRadius: 5, blurRadius: 6)
                    ]),
                padding: EdgeInsets.symmetric(
                    horizontal: Responsive.blockSizeHorizontal * 15,
                    vertical: Responsive.blockSizeVertical * 15),
                child: Stack(alignment: Alignment.center, children: [
                  Image.asset("images/chineese_lan.png"),
                  const Text("KAVADI",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w900))
                ])),
          ),
          InkWell(
            onTap: () {
              _maranasamidhi();
            },
            child: Container(
                height: Responsive.blockSizeVertical * 300,
                width: Responsive.blockSizeHorizontal * 850,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green[600],
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, spreadRadius: 5, blurRadius: 6)
                    ]),
                padding: EdgeInsets.symmetric(
                    horizontal: Responsive.blockSizeHorizontal * 15,
                    vertical: Responsive.blockSizeVertical * 15),
                child: Stack(alignment: Alignment.center, children: [
                  Image.asset("images/conference.png"),
                  const Text("MARANASAMIDHI",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w900))
                ])),
          )
        ],
      ),
    );
  }

  _maranasamidhi() {
    changePageState(MaranasamidhiHome(key: UniqueKey()));
  }

  _kavadi() {
    //Navigator.pushNamed(context, KavadiHome.routeName);
  }
}
