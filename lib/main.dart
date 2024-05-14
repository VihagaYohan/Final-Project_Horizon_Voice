import 'package:flutter/material.dart';
import 'package:feedback_app/UI/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:layout/layout.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: MaterialApp(
      title: 'HorizonVoice'.toUpperCase(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: false,
      ),
      home: SplashScreenPage(),
      debugShowCheckedModeBanner: false,
    ));
  }
}

// Student
// - institute [grouped by faculty] -
// - library [grouped by faculty] -
// - academic [faculty, intake, semester, subject, lecturer]
// - suggestions

// acadmeic
// - batch [faculty, intake, lecturer]
// - insti [faculty] -
// - course  [faculty, intake, semester, course]
// - suggestions

