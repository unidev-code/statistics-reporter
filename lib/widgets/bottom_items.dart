import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavController extends StatefulWidget {
  const BottomNavController({super.key});

  @override
  State<BottomNavController> createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  int _selectedIndex = 0;


  final List<Widget> _pages = [
    Container(color: Colors.transparent),
    Container(color: Colors.transparent),
    Container(color: Colors.transparent),
    Container(color: Colors.transparent),
    Container(color: Colors.transparent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E27),

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(scale: animation, child: child),
          );
        },
        child: _pages[_selectedIndex],
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [

            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: CurvedNavigationBar(
          index: _selectedIndex,
          height: 75, // 🔆 taller nav bar
          backgroundColor: Colors.transparent,
          color: const Color(0xFF0A0E27),
          buttonBackgroundColor: const Color(0xFFF5F5F5),
          animationDuration: const Duration(milliseconds: 400),
          animationCurve: Curves.easeInOut,
          items: [
            SvgPicture.asset(
              'assets/icons/home-alt.svg',
              height: 30,
              color: _selectedIndex == 0 ? Colors.black : const Color(0xFFF5F5F5),
            ),
            SvgPicture.asset(
              'assets/icons/stats-up-square.svg',
              height: 30,
              color: _selectedIndex == 1 ? Colors.black : const Color(0xFFF5F5F5),
            ),
            SvgPicture.asset(
              'assets/icons/sparks-solid.svg',
              height: 30,
              color: _selectedIndex == 2 ? Colors.black : const Color(0xFFF5F5F5),
            ),
            SvgPicture.asset(
              'assets/icons/settings.svg',
              height: 30,
              color: _selectedIndex == 3 ? Colors.black : const Color(0xFFF5F5F5),
            ),
            SvgPicture.asset(
              'assets/icons/user.svg',
              height: 30,
              color: _selectedIndex == 4 ? Colors.black : const Color(0xFFF5F5F5),
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}