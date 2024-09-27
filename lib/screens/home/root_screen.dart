import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:challenge_2/screens/home/home.dart';
import 'package:challenge_2/utils/colors.dart';
import 'package:flutter/material.dart';

class AnimatedBottomBar extends StatefulWidget {
  const AnimatedBottomBar({super.key});

  @override
  State<AnimatedBottomBar> createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  // list of icons that required
  // by animated navigation bar
  List<IconData> iconList = [
    Icons.home_outlined,
    Icons.person_outline,
    Icons.chat_bubble_outline,
    Icons.favorite_outline
  ];

  // default index of the tabs
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: primaryColor),
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        // navigation bar
        icons: iconList,
        activeColor: Colors.white,
        inactiveColor: Colors.grey.shade300,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchMargin: 8, // Default notch margin is 8
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        backgroundColor: primaryColor,
      ),
    );
  }
}
