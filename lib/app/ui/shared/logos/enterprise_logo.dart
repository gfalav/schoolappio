import 'package:flutter/material.dart';

class EnterpriseLogo extends StatelessWidget {
  const EnterpriseLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 0,
        right: 10,
        left: 10,
      ),
      child: Container(
        height: 180,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 8, 1, 85),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset(
                "lib/assets/images/sv.png",
                scale: 3,
              ),
            ),
            const Text(
              "Instituto San Vicente",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Text(
                "Juana Koslay - San Luis",
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
