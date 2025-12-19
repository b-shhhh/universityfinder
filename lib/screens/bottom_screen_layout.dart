import 'package:flutter/material.dart';
import 'package:universityfinder/screens/bottom_screen/application_screen.dart';
import 'package:universityfinder/screens/bottom_screen/profile_screen.dart';
import 'package:universityfinder/screens/bottom_screen/home_screen.dart';
import 'package:universityfinder/screens/home_screen.dart';

class BottomscreenLayout extends StatefulWidget {
  const BottomscreenLayout({super.key});

  @override
  State<BottomscreenLayout> createState() => _BottomscreenLayoutState();
}

class _BottomscreenLayoutState extends State<BottomscreenLayout> {
  int _selectedIndex=0;
  List<Widget> lstBottomScreen=[
    const HomeScreen()
    const Applicat

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Layout Screen"),),
      body: lstBottomScreen[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items:const[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),
                label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person),
                label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.person),
                label: 'Profile'),

          ],
          backgroundColor: Colors.pink,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap:(index){
            setState(() {
              _selectedIndex=index;
            });
          }
      ),
    );

  }
}
