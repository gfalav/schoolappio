import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolappio/app/controllers/user_controller.dart';
import 'package:schoolappio/app/controllers/validators.dart';

class ResetPwdForm extends StatelessWidget {
  ResetPwdForm({super.key});
  final formKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  void sendResetPwd() {
    if (formKey.currentState!.validate()) {
      userController.resetPwd();
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
              "Envío mail para recuperar password",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: userController.emailController,
              validator: (value) {
                if (!Validators().validateMail(value)) {
                  return "Email no válido";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(labelText: "Email"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: FilledButton.icon(
                onPressed: () {
                  sendResetPwd();
                },
                icon: const Icon(Icons.mail_lock),
                label: const Text("ResetPwd"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
