import 'package:flutter/material.dart';
import 'package:floral_fiesta/components/bottom_nav_bar.dart';
import 'package:floral_fiesta/constants.dart';
import 'package:floral_fiesta/Pages/cart_page.dart';
import 'package:floral_fiesta/Pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String id = 'MainPage';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  List<Widget> pages = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: CircleAvatar(
                backgroundColor: kDarkGreenColor,
                radius: 22.0,
                backgroundImage: const AssetImage('assets/images/groot.jpeg'),
              ),
              onTap: () {},
            ),
            CircleAvatar(
              backgroundColor: kDarkGreenColor,
              radius: 22.0,
              child: IconButton(
                color: Colors.white,
                splashRadius: 28.0,
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CartPage.id);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        selectedColor: kDarkGreenColor,
        unselectedColor: kSpiritedGreen,
        onTapped: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          Icon(Icons.home),
          Icon(Icons.image_search_outlined),
          Icon(Icons.receipt),
          Icon(Icons.person),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}