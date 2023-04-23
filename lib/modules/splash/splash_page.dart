import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      // ignore: use_build_context_synchronously
      await Future.delayed(const Duration(seconds: 4));
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, "/login");
    } catch (e) {
      Navigator.pushNamed(context, "/error");
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.gradient.background),
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 128,
            height: 112,
          ),
        ),
      ),
    );
  }
}
