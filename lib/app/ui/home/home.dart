import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolappio/app/controllers/app_controller.dart';
import 'package:schoolappio/app/ui/shared/scaffold/scaffold.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      appController.setAppState(0xe318, "Home", true, true, 50);
    });
    return Myscaffold(
      left: const Center(
        child: Text("Left"),
      ),
      right: const Center(
        child: Text("Home"),
      ),
    );
  }
}
