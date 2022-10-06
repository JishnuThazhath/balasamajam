import 'package:balasamajam/responsive.dart';
import 'package:balasamajam/screens/maranasamidhi/collection/collection_page.dart';
import 'package:balasamajam/screens/maranasamidhi/expense/expense_page.dart';
import 'package:balasamajam/screens/maranasamidhi/home/landing_page.dart';
import 'package:balasamajam/screens/maranasamidhi/member/member_page.dart';
import 'package:balasamajam/screens/maranasamidhi/menu_card.dart';
import 'package:balasamajam/screens/maranasamidhi/payment/payment_page.dart';
import 'package:flutter/material.dart';

class MaranasamidhiHome extends StatefulWidget {
  const MaranasamidhiHome({super.key});

  static const String routeName = "MaranasamidhiHome";

  @override
  State<MaranasamidhiHome> createState() => _MaranasamidhiHomeState();
}

class _MaranasamidhiHomeState extends State<MaranasamidhiHome> {
  Widget currentWidgetLoaded = const LandingPage();
  String selectedMenuOption = "Home";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.blockSizeHorizontal * 10),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuCard(
                    name: "Home",
                    isSelected: selectedMenuOption == "Home",
                    onClickCallBack: _menuSelect,
                  ),
                  SizedBox(width: Responsive.blockSizeHorizontal * 10),
                  MenuCard(
                      name: "Payment",
                      isSelected: selectedMenuOption == "Payment",
                      onClickCallBack: _menuSelect),
                  SizedBox(width: Responsive.blockSizeHorizontal * 10),
                  MenuCard(
                      name: "Expense",
                      isSelected: selectedMenuOption == "Expense",
                      onClickCallBack: _menuSelect),
                  SizedBox(width: Responsive.blockSizeHorizontal * 10),
                  MenuCard(
                      name: "Member",
                      isSelected: selectedMenuOption == "Member",
                      onClickCallBack: _menuSelect),
                  SizedBox(width: Responsive.blockSizeHorizontal * 10),
                  MenuCard(
                      name: "Collection",
                      isSelected: selectedMenuOption == "Collection",
                      onClickCallBack: _menuSelect),
                ]),
          ),
        ),
        Container(
          child: currentWidgetLoaded,
        )
      ],
    );
  }

  _menuSelect(String selection) {
    setState(() {
      switch (selection) {
        case "Home":
          currentWidgetLoaded = const LandingPage();
          setState(() {
            selectedMenuOption = "Home";
          });
          break;
        case "Payment":
          currentWidgetLoaded = const PaymentPage();
          selectedMenuOption = "Payment";
          break;
        case "Expense":
          currentWidgetLoaded = const ExpensePage();
          selectedMenuOption = "Expense";
          break;
        case "Member":
          currentWidgetLoaded = const MemberPage();
          selectedMenuOption = "Member";
          break;
        case "Collection":
          currentWidgetLoaded = const CollectionPage();
          selectedMenuOption = "Collection";
          break;
        default:
      }
    });
  }
}
