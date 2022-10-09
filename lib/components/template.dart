import 'package:balasamajam/components/user_login_info.dart';
import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/home/home_screen.dart';
import 'package:balasamajam/screens/kavadi/kavadi_home.dart';
import 'package:balasamajam/screens/maranasamidhi/maranasamidhi_home.dart';
import 'package:balasamajam/user/settings_page.dart';
import 'package:flutter/material.dart';

class Template extends StatefulWidget {
  static const String routeName = "Template";
  Template({super.key});

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  Widget? selectedPage;
  String selected = "Home";
  int _selectedIndex = 0;
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
          child: Column(
            children: [
              const UserLoginInfo(),
              Divider(thickness: 2, height: Responsive.blockSizeVertical * 30),
              // SizedBox(height: Responsive.blockSizeVertical * 30),
              Expanded(child: selectedPage!)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          // BottomNavigationBarItem(icon: Icon(Icons.festival), label: "Kavadi"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.work), label: "Maranasamidhi"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],
        onTap: (value) => {_bottomNavigationBarClickEvent(value, context)},
      ),
    );
  }

  _bottomNavigationBarClickEvent(int idx, BuildContext context) {
    switch (idx) {
      case 0:
        {
          setState(() {
            selectedPage =
                HomeScreen(key: UniqueKey(), changePageState: _changePageState);
            _selectedIndex = 0;
          });
        }
        break;
      // case 1:
      //   {
      //     setState(() {
      //       selectedPage = const KavadiHome();
      //       _selectedIndex = 1;
      //     });
      //   }
      //   break;
      // case 2:
      //   {
      //     setState(() {
      //       selectedPage = const MaranasamidhiHome();
      //       _selectedIndex = 2;
      //     });
      //   }
      //   break;
      case 1:
        {
          setState(() {
            selectedPage = const SettingsPage();
            _selectedIndex = 1;
          });
        }
        break;
    }
  }

  _changePageState(Widget page) {
    setState(() {
      selectedPage = page;
    });
  }
}
