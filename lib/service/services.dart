import 'package:dice_game/app/login/login_controller.dart';
import 'package:dice_game/app/signup/signup_controller.dart';
import 'package:dice_game/service/local_storage_service.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  Get.put<LocalStorageService>(LocalStorageService());

  Get.lazyPut<LoginController>(() => LoginController());
  Get.lazyPut<SignupController>(() => SignupController());
}
