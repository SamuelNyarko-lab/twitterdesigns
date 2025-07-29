// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:twitterdesigns/screens/homepage.dart';
import 'package:twitterdesigns/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Designs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Color.fromRGBO(245, 240, 255, 1),
      ),
      home: SplashScreen(),
    );
  }
}
