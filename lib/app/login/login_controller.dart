import 'package:dice_game/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/firebase_services.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cnfPasswordController = TextEditingController();

  final FirebaseService _firebaseService = Get.find<FirebaseService>();

  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        await _firebaseService.login(
            email: emailController.text.trim(),
            password: passwordController.text.trim());

        await Get.offAllNamed(Routes.homeView);
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
