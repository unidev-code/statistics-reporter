import 'package:flutter/material.dart';
import 'package:statistics_reporter/main_screen.dart';
import 'package:statistics_reporter/widgets/app_button.dart';
import 'package:statistics_reporter/widgets/bottom_items.dart';

import 'widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildAppTextField(context, title: 'Username', hint: 'Enter username...', controller: usernameController),
            SizedBox(height: 16),
            buildAppTextField(context, title: 'Password', hint: 'Enter password...', controller: passwordController),
            SizedBox(height: 32),
            if(isLoading)
            CircularProgressIndicator(),
            if(!isLoading)
            buildAppButton(
              context,
              title: 'LOGIN',
              onPressed: () {
                setState(() {
                  isLoading = true;
                });

                Future.delayed(Duration(seconds: 2),() {
                  const validUsername = 'admin';
                  const validPassword = '1234';

                  if (usernameController.text != validUsername) {
                    debugPrint('Username is invalid');

                    isLoading = false;
                    setState(() {
                    });

                    return;
                  }

                  if (passwordController.text != validPassword) {
                    debugPrint('Password is invalid');

                    isLoading = false;
                    setState(() {
                    });
                    return;
                  }

                  isLoading = false;
                  setState(() {
                  });

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreen()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
