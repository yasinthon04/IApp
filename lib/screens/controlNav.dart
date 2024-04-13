import 'package:flutter/material.dart';
import 'package:iapp_flutter/screens/cart.dart';
import 'package:iapp_flutter/screens/home.dart';
import 'package:iapp_flutter/screens/sumApi.dart';
import 'package:iapp_flutter/widgets/constants.dart';

class ControlNav extends StatefulWidget {
  const ControlNav({Key? key}) : super(key: key);

  @override
  _ControlNavState createState() => _ControlNavState();
}

class _ControlNavState extends State<ControlNav> {
  List<Widget> pages = [
    Home(),
    SumApiPage(),
    CartPage(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Cart', 
          ),
        ],
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Constants.navColor, 
        selectedItemColor: Constants.orangeColor,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
