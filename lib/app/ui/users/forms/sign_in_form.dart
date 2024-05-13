import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolappio/app/controllers/app_controller.dart';
import 'package:schoolappio/app/controllers/user_controller.dart';
import 'package:schoolappio/app/controllers/validators.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});
  final formKey = GlobalKey<FormState>();
  final appController = Get.put(AppController());
  final userController = Get.put(UserController());

  void sendSignIn() {
    if (formKey.currentState!.validate()) {
      userController.signIn();
    } else {
      Get.snackbar(
        "Error de Formulario",
        "Formulario inválido",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(91, 142, 147, 254),
        duration: const Duration(seconds: 5),
      );
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
              "Bienvenido nuevamente",
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
            TextFormField(
              controller: userController.passwordController,
              validator: (value) {
                if (!Validators().validateNumandLetters(value)) {
                  return "Password no válido";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: FilledButton.icon(
                onPressed: () {
                  sendSignIn();
                },
                icon: const Icon(Icons.login),
                label: const Text("SignIn"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
