import 'package:balasamajam/components/user_login_info.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/home/home_screen.dart';
import 'package:balasamajam/screens/kavadi/kavadi_home.dart';
import 'package:balasamajam/screens/maranasamidhi/maranasamidhi_home.dart';
import 'package:flutter/material.dart';

class Template extends StatefulWidget {
  static const String routeName = "Template";
  Template({super.key});

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  Widget? selectedPage;

  @override
  void initState() {
    selectedPage = HomeScreen(
      key: UniqueKey(),
      changePageState: _changePageState,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.blockSizeHorizontal * 40),
            child: Column(
              children: [
                const UserLoginInfo(),
                Divider(
                    thickness: 2, height: Responsive.blockSizeVertical * 30),
                // SizedBox(height: Responsive.blockSizeVertical * 30),
                Expanded(child: selectedPage!)
              ],
            ),
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
    // String routeName = HomeScreen.routeName;
    print("here ${idx}");
    switch (idx) {
      case 0:
        {
          setState(() {
            selectedPage =
                HomeScreen(key: UniqueKey(), changePageState: _changePageState);
          });
        }
        break;
      case 1:
        {
          setState(() {
            selectedPage = const KavadiHome();
          });
        }
        break;
      case 2:
        {
          setState(() {
            selectedPage = MaranasamidhiHome();
          });
        }
        break;
    }

    // Navigator.pushNamed(context, routeName);
  }

  _changePageState(Widget page) {
    setState(() {
      selectedPage = page;
    });
  }
}
