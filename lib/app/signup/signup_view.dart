import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<SignupController>(builder: (model) {
        return Column(
          children: [
            SizedBox(
              height: Get.height * 0.3,
              width: double.maxFinite,
              child: const Center(child: Text('Roll a dice')),
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: model.emailController,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      isDense: true,
                    ),
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Please enter email id';
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    controller: model.passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      isDense: true,
                    ),
                    obscureText: true,
                    validator: (password) {
                      if (password == null || password.isEmpty) {
                        return 'Please enter password';
                      }

                      return null;
                    },
                  ),
                  TextFormField(
                    controller: model.cnfPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm password',
                      isDense: true,
                    ),
                    obscureText: true,
                    validator: (cnfPassword) {
                      if (cnfPassword == null || cnfPassword.isEmpty) {
                        return 'Please enter password';
                      }
                      if (cnfPassword != model.cnfPasswordController.text) {
                        return 'Passowrds doesnt match';
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                await model.signup(
                    email: model.emailController.text.trim(),
                    password: model.passwordController.text.trim());
              },
              icon: const Icon(Icons.login_rounded),
              label: const Text('Signup'),
            )
          ],
        );
      }),
    );
  }
}
