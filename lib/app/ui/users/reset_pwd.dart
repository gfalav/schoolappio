import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolappio/app/controllers/app_controller.dart';
import 'package:schoolappio/app/ui/shared/logos/enterprise_logo.dart';
import 'package:schoolappio/app/ui/shared/logos/splash_user.dart';
import 'package:schoolappio/app/ui/shared/scaffold/scaffold.dart';
import 'package:schoolappio/app/ui/users/forms/reset_pwd_form.dart';

class ResetPwd extends StatelessWidget {
  ResetPwd({super.key});
  final appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      appController.setAppState(0xf07aa, "ResetPwd", false, false, 50);
    });
    return Myscaffold(
      left: const SplashUsers(),
      right: Column(
        children: [
          const EnterpriseLogo(),
          ResetPwdForm(),
        ],
      ),
    );
  }
}
