import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:rent_app/Screens/login.dart';


class  Splash extends StatelessWidget {
  const Splash ({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: 'assets/splash/RENTED.gif', nextScreen: Login(),
      centered: true,duration: 1350,backgroundColor: Colors.black,
      splashIconSize: 1500.0,
    );
  }
}
