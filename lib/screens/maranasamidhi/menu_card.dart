import 'package:balasamajam/configs/local_theme_data.dart';
import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatefulWidget {
  final String name;
  bool isSelected;
  Function(String value)? onClickCallBack;

  MenuCard(
      {super.key,
      required this.name,
      required this.isSelected,
      required this.onClickCallBack});

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onClickCallBack!(widget.name),
      child: Container(
        decoration: BoxDecoration(
            color: LocalThemeData.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.blockSizeHorizontal * 15,
            vertical: Responsive.blockSizeVertical * 10),
        child: Text(
          widget.name,
          style: LocalThemeData.labelTextW,
        ),
      ),
    );
  }
}
