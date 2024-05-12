import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolappio/app/controllers/app_controller.dart';
import 'package:schoolappio/app/controllers/user_controller.dart';
import 'package:schoolappio/app/controllers/validators.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});
  final formKey = GlobalKey<FormState>();
  final appController = Get.put(AppController());
  final userController = Get.put(UserController());

  void sendSignUp() {
    if (formKey.currentState!.validate()) {
      userController.signUp();
    } else {
      Get.snackbar("Error de Formulario", "Formulario inválido",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color.fromARGB(91, 247, 19, 2), duration: const Duration(seconds: 5));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
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
                "Bienvenido",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: userController.nameController,
                validator: (value) {
                  if (!Validators().validateNumandLetters(value)) {
                    return "Nombre no válido";
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(labelText: "Nombre y Apellido"),
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
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.add_photo_alternate),
                        onPressed: () {
                          userController.pickImage();
                        },
                        label: const Text("Upload Picture"),
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: userController.imageName.value != '' ? Image.memory(userController.imageBytes.value).image : null,
                      radius: 25,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: FilledButton.icon(
                  onPressed: () {
                    sendSignUp();
                  },
                  icon: const Icon(Icons.person_add),
                  label: const Text("SignUp"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
