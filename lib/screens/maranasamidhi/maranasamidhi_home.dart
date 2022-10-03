import 'package:balasamajam/components/template.dart';
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
  Widget currentWidgetLoaded = LandingPage();
  @override
  Widget build(BuildContext context) {
    return Template(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MenuCard(
                    name: "Home",
                    isSelected: true,
                    onClickCallBack: _menuSelect,
                  ),
                  SizedBox(width: Responsive.blockSizeHorizontal * 10),
                  MenuCard(
                      name: "Payment",
                      isSelected: false,
                      onClickCallBack: _menuSelect),
                  SizedBox(width: Responsive.blockSizeHorizontal * 10),
                  MenuCard(
                      name: "Expense",
                      isSelected: false,
                      onClickCallBack: _menuSelect),
                  SizedBox(width: Responsive.blockSizeHorizontal * 10),
                  MenuCard(
                      name: "Member",
                      isSelected: false,
                      onClickCallBack: _menuSelect),
                  SizedBox(width: Responsive.blockSizeHorizontal * 10),
                  MenuCard(
                      name: "Collection",
                      isSelected: false,
                      onClickCallBack: _menuSelect),
                ]),
          ),
          Container(
            child: currentWidgetLoaded,
          )
        ],
      ),
    );
  }

  _menuSelect(String selection) {
    setState(() {
      switch (selection) {
        case "Home":
          currentWidgetLoaded = LandingPage();
          break;
        case "Payment":
          currentWidgetLoaded = PaymentPage();
          break;
        case "Expense":
          currentWidgetLoaded = ExpensePage();
          break;
        case "Member":
          currentWidgetLoaded = MemberPage();
          break;
        case "Collection":
          currentWidgetLoaded = CollectionPage();
          break;
        default:
      }
    });
  }
}
