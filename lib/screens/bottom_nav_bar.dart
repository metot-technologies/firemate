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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 6,
            ),
          ],
        ),
        child: NavigationBar(
            shadowColor: const Color.fromRGBO(0, 0, 0, 0.2),
            backgroundColor: Colors.white,
            indicatorColor: const Color.fromRGBO(173, 6, 6, 1),
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.history,
                  color: Colors.white,
                ),
                icon: Icon(Icons.history),
                label: 'History',
              )
            ]),
      ),
      body: <Widget>[
        const HomeScreen(),
        const HistoryScreen(),
      ][currentPageIndex],
    );
  }
}
