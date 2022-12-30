import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weabo_app/bloc/cubit/bottom_nav_cubit.dart';
import 'package:flutter_weabo_app/presentation/favorite_screen.dart';
import 'package:flutter_weabo_app/presentation/home_screen.dart';
import 'package:flutter_weabo_app/presentation/search_screen.dart';
import 'package:flutter_weabo_app/shared/style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<IconData> bottomNavIcons = [Icons.home, Icons.favorite];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          return FloatingActionButton(
            backgroundColor: state == 2 ? primaryColor : Colors.grey,
            onPressed: () {
              context.read<BottomNavCubit>().changePage(2);
            },
            child: const Icon(Icons.search),
          );
        },
      ),
      body: BlocBuilder<BottomNavCubit, int>(builder: (context, state) {
        if (state == 0) {
          return const HomeScreen();
        } else if (state == 1) {
          return const FavoriteScreen();
        } else {
          return const SearchScreen();
        }
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          return AnimatedBottomNavigationBar(
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.softEdge,
            icons: bottomNavIcons,
            activeIndex: state,
            onTap: (int index) {
              context.read<BottomNavCubit>().changePage(index);
            },
            activeColor: primaryColor,
            inactiveColor: Colors.grey,
          );
        },
      ),
    );
  }
}
