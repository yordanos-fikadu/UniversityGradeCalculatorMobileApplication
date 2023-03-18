import 'package:flutter/material.dart';
import './ui/gradeCalculator.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
void main() {
  runApp(const MaterialApp(
    title: 'gradeCalculator',
    home: Test(),   
  ));
}

class Test extends StatefulWidget {
  const Test({super.key});
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            "assets/icons/grade_calculator.png",
            width: 200,
            height: 200,
          ),
          const Text('UNIVERSITY or COLLAGE',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900)),
          const Text('GRADE CALCULATOR',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900))
        ],
      ),
      nextScreen: const Home(),
      duration: 3,
      splashIconSize: 350,
      animationDuration: const Duration(seconds: 3),
      backgroundColor: Colors.white,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.topToBottom,
    );
  }
}
