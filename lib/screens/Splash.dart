// ignore_for_file: file_names

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:legal_companion/screens/onboard.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatelessWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 
      Lottie.asset('assets/splash.json'), 
      backgroundColor: const Color(0xFF0B3C5D),
      nextScreen: const OnBoard(),
      duration: 3000,
      splashIconSize: 380,
    );
  }
}