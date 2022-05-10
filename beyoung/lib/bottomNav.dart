// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:beyoung/views/itensList.dart';
import 'package:beyoung/views/userList.dart';

class bottomNav extends StatefulWidget {
  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  int _currentIndex = 0;
  static List<Widget> pages = [
    ItemList(),
    UserList(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: pages.elementAt(_currentIndex),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.white.withOpacity(0.5),
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child: NavigationBar(
          backgroundColor: Colors.deepPurple.withOpacity(0.5),
          animationDuration: const Duration(seconds: 1),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 60,
          selectedIndex: _currentIndex,
          onDestinationSelected: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.view_list),
              icon: Icon(Icons.view_list_outlined),
              label: 'Itens',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.assignment_ind),
              icon: Icon(Icons.assignment_ind_outlined),
              label: 'Clientes',
            ),
          ],
        ),
      ),
    );
  }
}
