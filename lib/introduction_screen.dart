import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
      routes: {
        'login': (context) => const MyLogin(),
      },
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  OnboardingScreen({super.key});

  void _onIntroEnd(context) {
    Navigator.pushNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = const Color(0xFFF5F5F5);
    var pageDecoration = PageDecoration(
      titleTextStyle: const TextStyle(fontSize: 28.0, fontFamily: "OpenSans-VariableFont_wdth,wght", fontWeight: FontWeight.w700),
      bodyTextStyle: const TextStyle(fontSize: 19.0, fontFamily: "OpenSans-VariableFont_wdth,wght"),
      imagePadding: const EdgeInsets.only(top: 100),
      boxDecoration: BoxDecoration(
        color: backgroundColor,
      ),
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Welcome to Personal Fit",
          body: "Get fit and stay healthy with our app.",
          image: Image.asset('assets/onboarding1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Track Your Progress",
          body: "Easily track your workouts, calories, and more.",
          image: Image.asset('assets/onboarding2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Stay Motivated",
          body: "Get personalized fitness plans and tips.",
          image: Image.asset('assets/onboarding3.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      done: const Text('Get Started', style: TextStyle(fontWeight: FontWeight.w600)),
      showSkipButton: true,
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFF05454),
        activeSize: Size(22.0, 10.0),
        activeColor: Colors.blue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
