import 'package:firemate/screens/history_screen.dart';
import 'package:firemate/widget/warning_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
          height: MediaQuery.sizeOf(context).height - 290,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(244, 245, 255, 1),
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [WarningCard()],
          )),
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
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 224,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/home_bg.png"), fit: BoxFit.cover)),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 224,
                decoration:
                    const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.45)),
              ),
              const Center(
                child: Text(
                  "Beranda",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'SF pro Display',
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        const HistoryScreen()
      ][currentPageIndex],
    );
  }
}
