import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolappio/app/controllers/app_controller.dart';
import 'package:schoolappio/app/ui/shared/scaffold/appbar.dart';
import 'package:schoolappio/app/ui/shared/scaffold/body.dart';
import 'package:schoolappio/app/ui/shared/scaffold/drawer.dart';

class Myscaffold extends StatelessWidget {
  final Widget left;
  final Widget right;
  Myscaffold({super.key, required this.left, required this.right});
  final appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width < 660 ? appController.setIsMobile(true) : appController.setIsMobile(false);

    return Obx(
      () => Scaffold(
        appBar: MyAppBar().appBar(),
        drawer: appController.showDrawer.value && appController.isMobile.value ? const MyDrawer() : null,
        body: MyBody(left: left, right: right),
      ),
    );
  }
}
