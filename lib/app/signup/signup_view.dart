import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignupController>(builder: (model) {
        return Column(
          children: [
            SizedBox(
              height: Get.height * 0.4,
              width: double.maxFinite,
              child: const Center(
                child: Text(
                  'Roll a dice',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: model.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: model.emailController,
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Please enter email id';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: model.passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      obscureText: true,
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Please enter password';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: model.cnfPasswordController,
                      decoration: const InputDecoration(
                        labelText: 'Confirm password',
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
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
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              width: Get.width / 2,
              height: 45.0,
              child: ElevatedButton.icon(
                onPressed: model.signup,
                icon: const Icon(Icons.account_box_rounded),
                label: const Text('Sign Up'),
              ),
            )
          ],
        );
      }),
    );
  }
}
