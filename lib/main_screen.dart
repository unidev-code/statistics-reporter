import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  void _openBeautifulBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.35,
          minChildSize: 0.25,
          maxChildSize: 0.6,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: ListView(
                controller: scrollController,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Quick Actions",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _sheetItem(Icons.pie_chart, "Statistics"),
                      _sheetItem(Icons.document_scanner, "Reports"),
                      _sheetItem(Icons.person, "Profile"),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _sheetItem(Icons.settings, "Settings"),
                      _sheetItem(Icons.notifications, "Alerts"),
                      _sheetItem(Icons.share, "Share"),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _sheetItem(IconData icon, String title) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.deepPurple, size: 28),
        ),
        const SizedBox(height: 8),
        Text(title),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main screen"),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () => _openBeautifulBottomSheet(context),
        child: const Icon(Icons.keyboard_arrow_up, size: 32),
      ),
      body: const Center(
        child: Text(
          'Main screen',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
