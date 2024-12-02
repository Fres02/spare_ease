import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spare_ease/pages/search.dart';
import 'package:spare_ease/pages/home.dart';
import 'package:spare_ease/pages/my_cart.dart';
import 'package:spare_ease/pages/profile.dart';
import 'package:spare_ease/pages/support.dart';
import 'package:spare_ease/providers/cart_provider.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final int initialIndex; // Add this to receive the initial index

  const MyBottomNavigationBar({super.key, this.initialIndex = 0});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  final List<Widget> _pages = [
    Home(),
    MyCartPage(),
    SearchPage(),
    SupportPage(),
    ProfilePage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex =
        widget.initialIndex; // Set the initial index from the parameter
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: _pages[_selectedIndex],
      backgroundColor: Colors.white,
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _selectedIndex = 2; // Set to the Search page (index 2)
            });
          },
          backgroundColor: Color(0xFFF7C910),
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
          selectedItemColor: Color(0xFFF7C910),
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
                  Image.asset(
                    _selectedIndex == 1
                        ? 'assets/selectedOrdersIcon.png'
                        : 'assets/ordersIcon.png',
                    width: 30,
                    height: 30,
                  ),
                  Positioned(
                    right: -4,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        ("${cartProvider.getCartitems.length}"),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              label: 'Cart',
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
