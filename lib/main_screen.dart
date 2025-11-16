import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    Icons.dashboard_rounded,
    Icons.show_chart_rounded,
    Icons.people_alt_rounded,
    Icons.settings_rounded,
  ];

  final List<String> _labels = ['داشبورد', 'سئو', 'کاربران', 'تنظیمات'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Center(
        child: Text(
          _labels[_selectedIndex],
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_icons.length, (index) {
              final bool isSelected = _selectedIndex == index;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: GestureDetector(
                  onTap: () => _onItemTapped(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeOut,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFEDE8FE)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _icons[index],
                          size: 26,
                          color: isSelected
                              ? const Color(0xFF6C63FF)
                              : Colors.grey[600],
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: isSelected ? 8 : 0,
                        ),
                        AnimatedOpacity(
                          opacity: isSelected ? 1 : 0,
                          duration: const Duration(milliseconds: 250),
                          child: Text(
                            isSelected ? _labels[index] : '',
                            style: const TextStyle(
                              color: Color(0xFF6C63FF),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
