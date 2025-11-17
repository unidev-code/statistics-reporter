import 'package:flutter/material.dart';
import 'package:statistics_reporter/widgets/app_button.dart';

import 'widgets/app_text_field.dart';

class LoginScreen extends StatelessWidget {
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
            buildAppButton(
              context,
              title: 'LOGIN',
              onPressed: () {
                debugPrint('username: ${usernameController.text}');
                debugPrint('password: ${passwordController.text}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
