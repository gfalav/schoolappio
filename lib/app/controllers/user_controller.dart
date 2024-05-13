import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  final isLogged = false.obs;
  final email = ''.obs;
  final name = ''.obs;
  final initials = ''.obs;
  final imageUrl = ''.obs;
  final imageBytes = Uint8List(0).obs;
  final imageName = ''.obs;

  final nameController = TextEditingController(text: 'Gustavo Falavigna');
  final emailController = TextEditingController(text: 'gfalav@gmail.com');
  final passwordController = TextEditingController(text: 'pppppp');
  final repasswordController = TextEditingController(text: 'pppppp');
  final oldPasswordController = TextEditingController(text: 'pppppp');

  @override
  void onInit() {
    super.onInit();
    subscribeAuthChanges();
  }

  void subscribeAuthChanges() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setUser();
    });
  }

  void setUser() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      isLogged.value = true;
      email.value = user.email!;
      name.value = user.displayName!;
      initials.value = user.displayName!.split(" ").map((l) => l[0]).take(2).join();
      imageUrl.value = user.photoURL!;
    } else {
      isLogged.value = false;
      email.value = '';
      name.value = '';
      initials.value = '';
      imageUrl.value = '';
    }
  }

  void signUp() async {
    try {
      final res = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (res.user != null) {
        await res.user!.updateDisplayName(nameController.text); // actualiza nombre
        if (imageName.value != '') {
          var extension = imageName.split(".").last;
          var storageRef = FirebaseStorage.instance.ref();
          var imageRef = storageRef.child("avatars/${res.user!.uid}.$extension");
          await imageRef.putData(imageBytes.value, SettableMetadata(contentType: "image/$extension"));
          var url = await imageRef.getDownloadURL();
          await res.user!.updatePhotoURL(url);
        } else {
          await res.user!.updatePhotoURL('');
        }
        Get.snackbar(
          "Welcome to SchoolAppIO",
          "SignUp!!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color.fromARGB(91, 142, 147, 254),
          duration: const Duration(seconds: 5),
        );
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error on SignUp",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(91, 142, 147, 254),
        duration: const Duration(seconds: 5),
      );
    }
  }

  void signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.snackbar(
        "Welcome to SchoolAppIO",
        "SignIn!!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(91, 142, 147, 254),
        duration: const Duration(seconds: 5),
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error on SignIn",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(91, 142, 147, 254),
        duration: const Duration(seconds: 5),
      );
    }
  }

  void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.snackbar(
        "GoodBye",
        "SignOut!!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(91, 142, 147, 254),
        duration: const Duration(seconds: 5),
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error on SignOut",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(91, 142, 147, 254),
        duration: const Duration(seconds: 5),
      );
    }
  }

  void resetPwd() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
      Get.snackbar(
        "Email Sent to ${emailController.text}",
        "Check your mailbox or spam",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(91, 142, 147, 254),
        duration: const Duration(seconds: 5),
      );
    } catch (e) {
      e.printError();
      e.printInfo();
    }
  }

  void changePwd() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        var credential = EmailAuthProvider.credential(email: user.email!, password: oldPasswordController.text);
        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(passwordController.text);
        Get.snackbar(
          "Password Updated",
          "Remember your new password",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color.fromARGB(91, 142, 147, 254),
          duration: const Duration(seconds: 5),
        );
        Get.offAllNamed("/home");
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error Updating your Password",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(91, 142, 147, 254),
        duration: const Duration(seconds: 5),
      );
    }
  }

  void updateUsr() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updateDisplayName(nameController.text); // actualiza nombre
        if (imageName.value != '') {
          var extension = imageName.split(".").last;
          var storageRef = FirebaseStorage.instance.ref();
          var imageRef = storageRef.child("avatars/${user.uid}.$extension");
          await imageRef.putData(imageBytes.value, SettableMetadata(contentType: "image/$extension"));
          var url = await imageRef.getDownloadURL();
          await user.updatePhotoURL(url);
        } else {
          await user.updatePhotoURL('');
        }
        Get.snackbar(
          "User Updated",
          "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color.fromARGB(91, 142, 147, 254),
          duration: const Duration(seconds: 5),
        );
        setUser();
        Get.offAllNamed("/home");
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error Updating User",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(91, 142, 147, 254),
        duration: const Duration(seconds: 5),
      );
    }
  }

  void pickImage() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageBytes.value = await image.readAsBytes();
      imageName.value = image.name;
    } else {
      imageBytes.value = Uint8List(0);
      imageName.value = '';
    }
  }

  void initRouteIsLogged() {
    routeIsLogged();

    ever(isLogged, (callback) => routeIsLogged());
  }

  void routeIsLogged() {
    if (isLogged.value) {
      Get.offAllNamed("/home");
    } else {
      Get.offAllNamed("/signin");
    }
  }
}
