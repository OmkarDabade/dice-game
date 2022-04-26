import 'package:dice_game/app/home/home_view.dart';
import 'package:dice_game/app/login/login_view.dart';
import 'package:flutter/material.dart';

import '../signup/signup_view.dart';

class Routes {
  static const String homeView = '/';
  static const String loginView = 'login';
  static const String signupView = 'signup';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case signupView:
        return MaterialPageRoute(builder: (_) => const SignupView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
