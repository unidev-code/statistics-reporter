import 'package:flutter/material.dart';
import 'package:statistics_reporter/colors.dart';
import 'package:statistics_reporter/login_screen.dart';
import 'package:statistics_reporter/main_screen.dart';
import 'package:statistics_reporter/auth_screen.dart';

import 'dimen.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        textTheme: TextTheme(
          labelMedium: TextStyle(color: textColorPrimary, fontSize: textSizedLabelMedium),
        )
      ),
      home: LoginScreen(),
    );
  }
}
