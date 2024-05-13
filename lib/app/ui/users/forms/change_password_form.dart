import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolappio/app/controllers/app_controller.dart';
import 'package:schoolappio/app/controllers/user_controller.dart';
import 'package:schoolappio/app/controllers/validators.dart';

class ChangePasswordForm extends StatelessWidget {
  ChangePasswordForm({super.key});
  final formKey = GlobalKey<FormState>();
  final appController = Get.put(AppController());
  final userController = Get.put(UserController());

  void sendChPwd() {
    if (formKey.currentState!.validate()) {
      userController.changePwd();
    } else {
      Get.snackbar("Error de Formulario", "Formulario inválido",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color.fromARGB(91, 247, 19, 2), duration: const Duration(seconds: 5));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 20,
          right: 25,
          left: 25,
        ),
        child: Column(
          children: [
            const Text(
              "Cambie su Password",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: userController.oldPasswordController,
              validator: (value) {
                if (!Validators().validateNumandLetters(value)) {
                  return "Password no válido";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(labelText: "Password Anterior"),
              obscureText: true,
            ),
            TextFormField(
              controller: userController.passwordController,
              validator: (value) {
                if (!Validators().validateNumandLetters(value)) {
                  return "Password no válido";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(labelText: "Nueva Password"),
              obscureText: true,
            ),
            TextFormField(
              controller: userController.repasswordController,
              validator: (value) {
                if (userController.passwordController.text != userController.repasswordController.text) {
                  return "Passwords no coinciden";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(labelText: "Confirme Password"),
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: FilledButton.icon(
                onPressed: () {
                  sendChPwd();
                },
                icon: const Icon(Icons.key),
                label: const Text("ChangePwd"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
