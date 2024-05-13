import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schoolappio/app/controllers/user_controller.dart';
import 'package:schoolappio/app/ui/home/home.dart';
import 'package:schoolappio/app/ui/users/change_pwd.dart';
import 'package:schoolappio/app/ui/users/reset_pwd.dart';
import 'package:schoolappio/app/ui/users/sign_in.dart';
import 'package:schoolappio/app/ui/users/sign_up.dart';
import 'package:schoolappio/app/ui/users/update_user.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SchoolAppIO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.openSansCondensedTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onReady: () => Get.find<UserController>().initRouteIsLogged(),
      home: SignIn(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/home", page: () => Home(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 500)),
        GetPage(name: "/signin", page: () => SignIn(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 500)),
        GetPage(name: "/signup", page: () => SignUp(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 500)),
        GetPage(name: "/resetpwd", page: () => ResetPwd(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 500)),
        GetPage(name: "/updateuser", page: () => UpdateUser(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 500)),
        GetPage(name: "/changepwd", page: () => ChangePwd(), transition: Transition.fadeIn, transitionDuration: const Duration(milliseconds: 500)),
      ],
    );
  }
}
