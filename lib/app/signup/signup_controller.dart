import 'package:dice_game/model/app_user.dart';
import 'package:dice_game/service/firebase_services.dart';
import 'package:dice_game/service/local_storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cnfPasswordController = TextEditingController();

  final FirebaseService _firebaseService = Get.find<FirebaseService>();
  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  Future<void> signup() async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        UserCredential? userCredential = await _firebaseService.registerUser(
            email: emailController.text.trim(),
            password: passwordController.text.trim());

        if (userCredential != null) {
          AppUser user = AppUser(
              name: userCredential.user?.displayName,
              email: userCredential.user?.email,
              userId: userCredential.user?.uid);

          await _firebaseService.updateUserInCloud(user);
          await _localStorageService.updateUser(user);

          await Get.toNamed(Routes.homeView);
        }
      } catch (e) {
        await Get.dialog<AlertDialog>(AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: Get.back,
              child: const Text('Okay'),
            ),
          ],
        ));
      }
    }
  }
}
