import 'dart:math';

import 'package:dice_game/model/app_user.dart';
import 'package:dice_game/service/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  AppUser? appUser;
  int result = 0;

  final LocalStorageService _localStorageService =
      Get.find<LocalStorageService>();

  @override
  void onInit() {
    appUser = _localStorageService.user;
    update();

    super.onInit();
  }

  Future<bool> saveDataLocally() async {
    if (appUser != null) _localStorageService.updateUser(appUser!);

    return true;
  }

  void calculateResult() async {
    if (appUser?.attemptsRemaining != 0) {
      // 6 is not included
      result = Random().nextInt(6);
      // Generate number till 5 then add 1
      // Hence min value 0 becomes 1
      ++result;

      appUser?.cummulativeScore += result;
      appUser?.attemptsRemaining -= 1;

      update();
    } else {
      await Get.dialog<AlertDialog>(
        AlertDialog(
          title: const Text('Error'),
          content: const Text('Max attempts reached'),
          actions: [
            TextButton(onPressed: Get.back, child: const Text('Okay')),
          ],
        ),
      );
    }
  }
}
