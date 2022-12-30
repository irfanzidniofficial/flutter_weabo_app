import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weabo_app/presentation/favorite_screen.dart';
import 'package:flutter_weabo_app/presentation/home_screen.dart';
import 'package:flutter_weabo_app/shared/style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<IconData> bottomNavIcons = [Icons.home, Icons.favorite];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {},
        child: const Icon(Icons.search),
      ),
      body: activeIndex == 0 ? const HomeScreen() : const FavoriteScreen(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        icons: bottomNavIcons,
        activeIndex: activeIndex,
        onTap: (int index) {
          setState(() {
            activeIndex = index;
          });
        },
        activeColor: primaryColor,
        inactiveColor: Colors.grey,
      ),
    );
  }
}
