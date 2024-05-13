import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolappio/app/controllers/user_controller.dart';

class PopupUser extends StatelessWidget {
  PopupUser({super.key});
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 10,
          left: 10,
        ),
        child: Obx(
          () => CircleAvatar(
            backgroundImage: userController.imageUrl.value != '' ? Image.network(userController.imageUrl.value).image : null,
            child: userController.imageUrl.value == '' ? Text(userController.initials.value) : null,
          ),
        ),
      ),
      itemBuilder: (itemBuilder) => [
        PopupMenuItem(
            child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Mi Perfil"),
                onTap: () async {
                  await Get.toNamed("/updateuser");
                  Get.offAllNamed("/home");
                })),
        PopupMenuItem(
            child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Cambia Password"),
                onTap: () async {
                  await Get.toNamed("/changepwd");
                  Get.offAllNamed("/home");
                })),
        PopupMenuItem(
            child: ListTile(
                leading: const Icon(Icons.power_settings_new),
                title: const Text("SignOut"),
                onTap: () {
                  userController.signOut();
                })),
      ],
    );
  }
}
