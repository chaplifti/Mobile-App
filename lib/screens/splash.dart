import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rc_fl_gopoolar/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/onboarding');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(fixPadding * 2.0),
          shrinkWrap: true,
          children: [
            Image.asset(
              "assets/splash/poolar-logo.png",
              height: size.height * 0.125,
            ),
            const Text(
              "Chap Lifti",
              style: semibold28White,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
