import 'package:flutter/material.dart';
import 'package:rent_app/Screens/login.dart';
import 'package:rent_app/Screens/onboarding_screen.dart';


class  Splash extends StatefulWidget {
  const Splash ({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        //return OnboardingScreen();
        return Login();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child:  Container(
         width: MediaQuery.of(context).size.width,
     height: MediaQuery.of(context).size.height,
     child: Image.asset("assets/splash/image1.png"),
   ),
     ),

   );
  }
}
