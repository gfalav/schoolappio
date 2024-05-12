import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolappio/app/controllers/app_controller.dart';
import 'package:schoolappio/app/ui/shared/messages_alert/messages_alert.dart';
import 'package:schoolappio/app/ui/shared/popup_user/popup_user.dart';
import 'package:schoolappio/app/ui/shared/tasks_alert/tasks_alert.dart';

class MyAppBar {
  final appController = Get.put(AppController());

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 8, 0, 86),
      foregroundColor: Colors.white,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 8,
            ),
            child: Obx(() => Icon(
                  IconData(
                    appController.codeIcon.value,
                    fontFamily: "MaterialIcons",
                  ),
                )),
          ),
          Obx(
            () => Text(
              appController.title.value,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      actions: [
        Obx(
          () => Visibility(
            visible: appController.showActions.value,
            child: const TasksAlert(),
          ),
        ),
        Obx(
          () => Visibility(
            visible: appController.showActions.value,
            child: const MessagesAlert(),
          ),
        ),
        Obx(
          () => Visibility(
            visible: appController.showActions.value,
            child: PopupUser(),
          ),
        ),
      ],
    );
  }
}
