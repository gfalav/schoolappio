import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolappio/app/controllers/app_controller.dart';
import 'package:schoolappio/app/ui/shared/logos/enterprise_logo.dart';
import 'package:schoolappio/app/ui/shared/logos/splash_user.dart';
import 'package:schoolappio/app/ui/shared/scaffold/scaffold.dart';
import 'package:schoolappio/app/ui/users/forms/row_adic_buttons.dart';
import 'package:schoolappio/app/ui/users/forms/sign_in_form.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      appController.setAppState(0xe3b2, "SignIn", false, false, 50);
    });
    return Myscaffold(
      left: const SplashUsers(),
      right: Column(
        children: [
          const EnterpriseLogo(),
          SignInForm(),
          RowAdicButtons(),
        ],
      ),
    );
  }
}
