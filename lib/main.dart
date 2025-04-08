import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'register.dart';
import 'introduction_screen.dart';
import 'calorie_spend.dart';
import 'homepage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAp9UWn9x23ohOudA7xRK9e3rEIIu-BQ7Q",
      appId: "1:520929033585:android:7f5e18415de16f43288ad0",
      messagingSenderId: "520929033585",
      projectId: "personal-fit-authentication",
    ),
  );

  runApp(const MyApp());
}
Future<void> loadFont() async{
  final fontloader =
      FontLoader("OpenSans-VariableFont_wdth,wght");
  await fontloader.load();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'introduction_screen',
      routes: {
        'login': (context) => const MyLogin(),
        'register': (context) => const MyRegister(),
        'introduction_screen': (context) => OnboardingScreen(),
        'calorie_spend': (context) =>  const CalorieSpendPage(),
        'homepage' : (context)=> const FitnessApp(),
      },
    );
  }
}

