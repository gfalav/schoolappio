import 'package:flutter/material.dart';

class SplashUsers extends StatelessWidget {
  const SplashUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, left: 3, right: 0, bottom: 3),
      child: Image.asset(
        "lib/assets/images/vitrubian_man.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
