import 'package:dice_game/app/home/home_controller.dart';
import 'package:dice_game/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.saveDataLocally,
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: GetBuilder<HomeController>(builder: (model) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: Text(
                  'User: ' +
                      (model.appUser?.name != null
                          ? model.appUser!.name!
                          : model.appUser?.email != null
                              ? model.appUser!.email!
                              : ''),
                ),
              ),
              ListTile(
                visualDensity: VisualDensity.compact,
                title: const Text('Cummulative score'),
                trailing:
                    Text((model.appUser?.cummulativeScore ?? 0).toString()),
              ),
              ListTile(
                visualDensity: VisualDensity.compact,
                title: const Text('Attempts remianing'),
                trailing:
                    Text((model.appUser?.attemptsRemaining ?? 10).toString()),
              ),
              SizedBox(
                height: Get.height * 0.30,
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Result',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      '${model.result}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: 45.0,
                width: Get.width / 2,
                child: ElevatedButton(
                  onPressed: model.calculateResult,
                  child: const Text('Roll a dice'),
                ),
              ),
              const SizedBox(height: 50.0),
              SizedBox(
                height: 40.0,
                width: Get.width / 2,
                child: ElevatedButton(
                  onPressed: () async {
                    await Get.toNamed(Routes.leaderboardView);
                  },
                  child: const Text('Leaderboard'),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
