import 'package:dice_game/app/home/home_controller.dart';
import 'package:dice_game/app/leaderboard/leaderboard_controller.dart';
import 'package:dice_game/app/login/login_controller.dart';
import 'package:dice_game/app/signup/signup_controller.dart';
import 'package:dice_game/service/firebase_services.dart';
import 'package:dice_game/service/local_storage_service.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  await Get.put<FirebaseService>(FirebaseService(), permanent: true)
      .initService();
  await Get.put<LocalStorageService>(LocalStorageService(), permanent: true)
      .initService();

  Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  Get.lazyPut<SignupController>(() => SignupController(), fenix: true);
  Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  Get.lazyPut<LeaderBoardController>(() => LeaderBoardController(),
      fenix: true);
}
