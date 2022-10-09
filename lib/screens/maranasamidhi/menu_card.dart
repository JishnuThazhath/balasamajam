import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatefulWidget {
  final String name;
  bool isSelected;
  Function(String value)? onClickCallBack;

  final double width = Responsive.blockSizeHorizontal * 200;
  final double height = Responsive.blockSizeVertical * 90;

  MenuCard(
      {super.key,
      required this.name,
      required this.isSelected,
      required this.onClickCallBack});

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  TextStyle selected =
      const TextStyle(color: Colors.white, fontFamily: 'Trueno', fontSize: 15);

  TextStyle notSelected =
      const TextStyle(color: Colors.black, fontFamily: 'Trueno', fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onClickCallBack!(widget.name),
      child: Container(
        width: widget.width,
        height: widget.height,
        //constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            color: widget.isSelected == true ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.blockSizeHorizontal * 15,
            vertical: Responsive.blockSizeVertical * 10),
        child: Column(
          children: [
            _getIcon(),
            SizedBox(height: Responsive.blockSizeVertical * 10),
            Text(widget.name,
                style: widget.isSelected == true ? selected : notSelected)
          ],
        ),
      ),
    );
  }

  Widget _getIcon() {
    Widget icon = const Icon(Icons.error);
    switch (widget.name) {
      case "Home":
        icon = Icon(
          Icons.home_sharp,
          color: widget.isSelected != true ? Colors.black : Colors.white,
        );
        break;
      case "Payment":
        icon = Icon(
          Icons.payments_outlined,
          color: widget.isSelected != true ? Colors.black : Colors.white,
        );
        break;
      case "Expense":
        icon = Icon(
          Icons.payment_sharp,
          color: widget.isSelected != true ? Colors.black : Colors.white,
        );
        break;
      case "Member":
        icon = Icon(
          Icons.person,
          color: widget.isSelected != true ? Colors.black : Colors.white,
        );
        break;
      case "Collection":
        icon = Icon(
          Icons.collections_bookmark_outlined,
          color: widget.isSelected != true ? Colors.black : Colors.white,
        );
        break;
    }
    return icon;
  }
}
