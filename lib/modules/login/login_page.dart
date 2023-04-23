import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:split/modules/login/widgets/social_button.dart';
import 'package:split/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void chama() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      await _googleSignIn.signOut();
    } catch (e) {}
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    setState(() {
      if (state != AppLifecycleState.resumed) {
        chama();
        debugPrint("Saí do aplicativo");
      }
    });
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                SizedBox(
                  width: 236,
                  child: Text(
                    "Divida suas contas com seus amigos.",
                    style: GoogleFonts.montserrat(
                      color: AppTheme.colors.title,
                      fontSize: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                leading: Image.asset("assets/images/Emoji.png"),
                title: Text(
                  "Faça seu login com a Google.",
                  style: GoogleFonts.inter(
                      fontSize: 16, color: AppTheme.colors.button),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SocialButtonWidget(
                imagePath: "assets/images/google.png",
                label: "Login Google",
                onTap: () async {
                  GoogleSignIn _googleSignIn = GoogleSignIn(
                    scopes: ['email'],
                  );
                  try {
                    final res = await _googleSignIn.signIn();
                    //_googleSignIn.
                    print(res);
                  } catch (e) {
                    debugPrint(e as String?);
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
