import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dashboardpage.dart';
import 'menu.dart';
import 'profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (page) {
            setState(() {
              _selectedIndex = page;
            });
          },
          controller: _pageController,
          children: const <Widget>[
            DashBoard(),
            Menu(),
            Profile(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: _onTappedBar,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 5,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.exclamationmark_shield,
                  color: _selectedIndex == 0 ? Colors.orange : Colors.grey,
                ),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.doc,
                  color: _selectedIndex == 1 ? Colors.orange : Colors.grey,
                ),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.person,
                  color: _selectedIndex == 2 ? Colors.orange : Colors.grey,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}
