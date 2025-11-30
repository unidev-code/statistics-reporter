import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'main_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  bool isLoading = false;

  final Color primaryColor = const Color(0xFF6C63FF);
  final Color bgColor = const Color(0xFFF5F6FA);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();

  void submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    setState(() => isLoading = false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// 🌟 Animated background
          Positioned.fill(
            child: Opacity(
              opacity: 0.65,
              child: Lottie.asset(
                "assets/animations/Waves.json",
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// 🌟 Main page content
          Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.all(24),
                child: buildAuthBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Box containing all UI
  Widget buildAuthBox() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            isLogin ? "ورود به حساب" : "ثبت‌نام",
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Color(0xFFffffff),
            ),
          ),

          const SizedBox(height: 24),

          /// 🔹 Login/Register switch
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                tabButton("ورود", true),
                tabButton("ثبت‌نام", false),
              ],
            ),
          ),

          const SizedBox(height: 28),

          Form(
            key: _formKey,
            child: Column(
              children: [
                /// فقط در ثبت‌نام
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  firstChild: const SizedBox(),
                  secondChild: inputField("نام و نام خانوادگی", name),
                  crossFadeState: isLogin
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),

                inputField("شماره موبایل", phone),
                inputField("رمز عبور", password, isPassword: true),

                const SizedBox(height: 24),

                /// 🔹 Login/Register button
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: ElevatedButton(
                    onPressed: isLoading ? null : submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                      height: 26,
                      width: 26,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white,
                      ),
                    )
                        : Text(
                      isLogin ? "ورود" : "ثبت‌نام",
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 tab buttons (login/register)
  Widget tabButton(String text, bool loginTab) {
    bool active = (loginTab == isLogin);

    return GestureDetector(
      onTap: () {
        setState(() => isLogin = loginTab);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: active ? const Color(0xFFEDE8FE) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: active ? primaryColor : Colors.grey[600],
          ),
        ),
      ),
    );
  }

  /// 🔹 input fields
  Widget inputField(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.20),  // Glass effect
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.35),
                width: 1.4,
              ),
            ),
            child: TextFormField(
              controller: controller,
              obscureText: isPassword,
              validator: (value) =>
              value!.isEmpty ? "لطفاً $label را وارد کنید" : null,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(
                  color: Colors.white.withOpacity(0.85),
                  fontSize: 15,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
