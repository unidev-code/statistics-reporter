import 'package:flutter/material.dart';
import 'package:statistics_reporter/main_screen.dart';
import 'package:statistics_reporter/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Statistics Reporter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'DanaFaNum',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AuthScreen(),
    );
  }
}
