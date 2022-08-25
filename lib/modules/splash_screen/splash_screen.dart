import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  Widget startedScreen;
   SplashScreen({Key? key,required this.startedScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: startedScreen,
      splash: SvgPicture.asset('assets/images/splash.svg'),
      animationDuration: const Duration(milliseconds: 1900),
      duration: 2500,
      backgroundColor: Colors.white,
      centered: true,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType:PageTransitionType.fade,
      splashIconSize: 150,

    );
  }
}
