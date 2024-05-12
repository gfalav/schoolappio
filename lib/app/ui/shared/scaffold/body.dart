import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolappio/app/controllers/app_controller.dart';

class MyBody extends StatelessWidget {
  final Widget left;
  final Widget right;
  MyBody({super.key, required this.left, required this.right});
  final appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Row(
          children: [
            Visibility(
              visible: !appController.isMobile.value,
              child: Expanded(
                flex: appController.leftProportion.value,
                child: Container(
                  color: Colors.white,
                  child: left,
                ),
              ),
            ),
            Expanded(
              flex: 100 - appController.leftProportion.value,
              child: Container(
                color: Colors.white,
                child: right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
