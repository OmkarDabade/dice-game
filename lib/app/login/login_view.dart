import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: GetBuilder<LoginController>(builder: (model) {
        return ListView(
          padding: const EdgeInsets.all(16.0),
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
                      color: Colors.red),
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
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: Get.width / 2,
                height: 45.0,
                child: ElevatedButton.icon(
                  onPressed: model.login,
                  icon: const Icon(Icons.login_rounded),
                  label: const Text('Login'),
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  text: 'Haven\'t registered? ',
                  style: const TextStyle(color: Colors.black54),
                  children: [
                    TextSpan(
                      text: 'Register here',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await Get.offAllNamed(Routes.signupView);
                        },
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
