import 'package:flutter/material.dart';
import 'package:spare_ease/pages/create_orders.dart';
import 'package:spare_ease/pages/home.dart';
import 'package:spare_ease/pages/my_orders.dart';
import 'package:spare_ease/pages/profile.dart';
import 'package:spare_ease/pages/support.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController _pagecontroller = PageController();
  List<Widget> _screen = [
    Home(),
    MyOrdersPage(),
    CreateOrder(),
    ProfilePage(),
    SupportPage(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
    });
    _pagecontroller.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pagecontroller,
        children: _screen,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 99, 97, 91),
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 238, 255, 0),
        unselectedItemColor: const Color.fromARGB(255, 183, 183, 183),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0
                  ? Color.fromARGB(255, 238, 255, 0)
                  : const Color.fromARGB(255, 183, 183, 183),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: _selectedIndex == 1
                  ? Color.fromARGB(255, 238, 255, 0)
                  : const Color.fromARGB(255, 183, 183, 183),
            ),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_rounded,
              color: _selectedIndex == 2
                  ? Color.fromARGB(255, 238, 255, 0)
                  : const Color.fromARGB(255, 183, 183, 183),
            ),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              color: _selectedIndex == 3
                  ? Color.fromARGB(255, 238, 255, 0)
                  : const Color.fromARGB(255, 183, 183, 183),
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.headset_mic_rounded,
              color: _selectedIndex == 4
                  ? Color.fromARGB(255, 238, 255, 0)
                  : const Color.fromARGB(255, 183, 183, 183),
            ),
            label: 'Support',
          ),
        ],
      ),
    );
  }
}
