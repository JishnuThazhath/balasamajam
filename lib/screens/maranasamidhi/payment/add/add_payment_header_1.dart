import 'package:balasamajam/responsive.dart';
import 'package:flutter/material.dart';

class AddPaymentHeader1 extends StatelessWidget {
  const AddPaymentHeader1({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          constraints: const BoxConstraints.expand(),
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.blockSizeVertical * 40,
              vertical: Responsive.blockSizeVertical * 20),
          color: Colors.green[700],
          child: Stack(
            children: [
              Image.asset(
                "images/money.png",
                height: Responsive.blockSizeVertical * 500,
                width: Responsive.blockSizeHorizontal * 900,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: Responsive.blockSizeVertical * 50),
                    child: Image.asset("images/left-arrow.png",
                        height: Responsive.blockSizeVertical * 50,
                        width: Responsive.blockSizeHorizontal * 100,
                        color: Colors.white),
                  )),
            ],
          )),
    );
  }
}
