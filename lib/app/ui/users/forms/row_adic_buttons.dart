import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolappio/app/controllers/app_controller.dart';

class RowAdicButtons extends StatelessWidget {
  RowAdicButtons({super.key});
  final appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 155,
          child: OutlinedButton.icon(
            onPressed: () async {
              await Get.toNamed("/signup");
              appController.setAppState(0xe3b2, "SignIn", false, false, 50);
            },
            icon: const Icon(Icons.person_add),
            label: const Text(
              "No tiene Cuenta?",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        SizedBox(
          width: 155,
          child: OutlinedButton.icon(
            onPressed: () async {
              await Get.toNamed("/resetpwd");
              appController.setAppState(0xe3b2, "SignIn", false, false, 50);
            },
            icon: const Icon(Icons.mail_lock),
            label: const Text(
              "Olvidó su Password?",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
