import 'package:flutter/material.dart';
import 'package:flutter_gnav/CartPage.dart';
import 'package:flutter_gnav/GridItemDesign.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'HomePage.dart';
import 'ShopPage.dart';


void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ShopPage(),
    CartPage(),
    Center(child: Text("Favorites Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // Main content of the screen
            _pages[_selectedIndex],

            // Positioned Bottom Navigation Bar
            Positioned(
              bottom: 22, // Adjust the value to move the nav bar higher or lower
              left: 16,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0), // Padding inside the container
                  child: GNav(
                    padding: const EdgeInsets.all(12),
                    color: Colors.white,
                    activeColor: Colors.white,
                    tabBackgroundColor: Colors.grey[800]!,
                    gap: 8,
                    tabs:  [
                      GButton(
                        icon: LineIcons.shoppingBag,
                        text: 'Shop',
                      ),
                      GButton(
                        icon: LineIcons.shoppingCart,
                        text: 'Cart',
                      ),
                      GButton(
                        icon: LineIcons.heart,
                        text: 'Favorites',
                      ),
                      GButton(
                        icon: LineIcons.search,
                        text: 'Search',
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

