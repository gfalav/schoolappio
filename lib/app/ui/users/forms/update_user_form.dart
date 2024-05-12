import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolappio/app/controllers/user_controller.dart';
import 'package:schoolappio/app/controllers/validators.dart';

class UpdateUserForm extends StatelessWidget {
  UpdateUserForm({super.key});
  final formKey = GlobalKey<FormState>();
  // final appController = Get.put(AppController());
  final userController = Get.put(UserController());

  void sendUpdateUser() {
    if (formKey.currentState!.validate()) {
      userController.updateUsr();
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
                "Actualice sus datos",
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
                    sendUpdateUser();
                  },
                  icon: const Icon(Icons.manage_accounts),
                  label: const Text("UpdateUser"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
