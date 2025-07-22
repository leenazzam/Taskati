import 'package:flutter/material.dart';
import 'package:taskatii/core/colors.dart';
import 'package:taskatii/features/completedTaskPage.dart';
import 'package:taskatii/features/home/home_screen.dart';
import 'package:taskatii/features/profilePage.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int selectedIndex = 0;
  List<Widget> bodyWidgets = [
    const HomeScreen(),
    const Completedtaskpage(),
    const Profilepage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyWidgets[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 18,
        unselectedFontSize: 15,
        unselectedItemColor: AppColor.primary,
        backgroundColor: const Color.fromARGB(255, 213, 226, 238),
        selectedItemColor: AppColor.primary,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist_rounded),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile ',
          ),
        ],
      ),
    );
  }
}
