import 'package:dice_game/app/home/home_controller.dart';
import 'package:dice_game/app/login/login_controller.dart';
import 'package:dice_game/app/signup/signup_controller.dart';
import 'package:dice_game/service/firebase_services.dart';
import 'package:dice_game/service/local_storage_service.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  Get.put<FirebaseService>(FirebaseService(), permanent: true);
  Get.put<LocalStorageService>(LocalStorageService(), permanent: true);

  Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  Get.lazyPut<SignupController>(() => SignupController(), fenix: true);
  Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
}
