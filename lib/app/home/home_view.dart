import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX(builder: (model) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(),
            ListTile(
              title: const Text('Cummulative score'),
              trailing: const Text('10'),
            ),
            SizedBox(
              height: Get.height * 0.3,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Result'),
                  const Text('2'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Roll a dice'),
            ),
          ],
        );
      }),
    );
  }
}
