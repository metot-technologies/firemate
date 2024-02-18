import 'package:firemate/screens/history_screen.dart';
import 'package:firemate/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.history,
                color: Color.fromRGBO(244, 245, 255, 1),
              ),
              icon: Icon(Icons.history),
              label: 'History',
            )
          ]),
      body: <Widget>[
        const HomeScreen(),
        const HistoryScreen(),
      ][currentPageIndex],
    );
  }
}
