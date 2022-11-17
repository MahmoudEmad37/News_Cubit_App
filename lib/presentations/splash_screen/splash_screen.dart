import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cubit_news_app/presentations/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'assets/images/splash_screen.png',
            fit: BoxFit.cover,
          ),),
      ),
      splashIconSize: double.infinity,
      duration: 3000,
      nextScreen: HomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}
