import 'package:balasamajam/screens/kavadi/kavadi_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Balasamajam Nadumuri"),
            OutlinedButton(
                onPressed: () => _kavadi(context), child: const Text("Kavadi")),
            OutlinedButton(
                onPressed: () => _maranasamidhi(context),
                child: const Text("Maranasamidhi")),
          ],
        ),
      ),
    );
  }

  _maranasamidhi(BuildContext context) {
    print("Coming Soon..");
  }

  _kavadi(BuildContext context) {
    Navigator.pushNamed(context, KavadiHome.routeName);
  }
}
