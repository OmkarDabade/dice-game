import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<LoginController>(builder: (model) {
        return Column(
          children: [
            SizedBox(
              height: Get.height * 0.3,
              width: double.maxFinite,
              child: const Center(child: Text('Roll a dice')),
            ),
            Form(
              key: model.formKey,
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
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: model.login,
              icon: const Icon(Icons.login_rounded),
              label: const Text('Login'),
            )
          ],
        );
      }),
    );
  }
}
