import 'package:flutter/material.dart';
import 'package:split/modules/splash/splash_page.dart';
import 'error/error_page.dart';
import 'login/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Split It",
      initialRoute: '/splash',
      routes: {
        "/splash": (ctx) => const SplashPage(),
        "/login": (ctx) => const LoginPage(),
        "/error": (ctx) => const ErrorPage(),
      },
    );
  }
}
