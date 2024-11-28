import 'package:flutter/material.dart';
import 'package:spare_ease/pages/create_orders.dart';
import 'package:spare_ease/pages/home.dart';
import 'package:spare_ease/pages/my_orders.dart';
import 'package:spare_ease/pages/profile.dart';
import 'package:spare_ease/pages/support.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  final List<Widget> _pages = [
    Home(),
    MyOrdersPage(),
    CreateOrder(),
    SupportPage(),
    ProfilePage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onFabPressed() {
    setState(() {
      _selectedIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      backgroundColor: Colors.white,
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        child: FloatingActionButton(
          onPressed: _onFabPressed,
          backgroundColor: Color(0xFF7E3DFF),
          shape: CircleBorder(),
          elevation: 0,
          child: Image.asset(
            'assets/addIcon.png',
            width: 32,
            height: 32,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xFFFCFCFC),
          selectedItemColor: Color(0xFF7E3DFF),
          unselectedItemColor: Color(0xFF9CA3AF),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontFamily: 'Inter',
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontFamily: 'Inter',
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                _selectedIndex == 0
                    ? 'assets/selectedHomeIcon.png'
                    : 'assets/homeIcon.png',
                width: 30,
                height: 30,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  // The main icon
                  Image.asset(
                    _selectedIndex == 1
                        ? 'assets/selectedOrdersIcon.png'
                        : 'assets/ordersIcon.png',
                    width: 30,
                    height: 30,
                  ),
                  // The badge
                  Positioned(
                    right: -4, // Adjust position as needed
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black, // Badge color
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '5', // Badge count
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              label: 'My Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.circle,
                color: Colors.transparent,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                _selectedIndex == 3
                    ? 'assets/selectedSupportIcon.png'
                    : 'assets/supportIcon.png',
                width: 30,
                height: 30,
              ),
              label: 'Support',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                _selectedIndex == 4
                    ? 'assets/selectedProfileIcon.png'
                    : 'assets/profileIcon.png',
                width: 30,
                height: 30,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
