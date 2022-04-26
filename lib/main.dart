import 'package:dice_game/app/routes/routes.dart';
import 'package:dice_game/model/app_user.dart';
import 'package:dice_game/service/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(AppUserAdapter());

  initServices();

  runApp(const DiceGame());
}

class DiceGame extends StatelessWidget {
  const DiceGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dice Game',
      navigatorKey: Get.key,
      initialRoute: Routes.loginView,
      onGenerateRoute: Routes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
