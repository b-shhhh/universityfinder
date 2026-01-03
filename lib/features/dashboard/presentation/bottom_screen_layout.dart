import 'package:flutter/material.dart';
import 'package:universityfinder/features/dashboard/bottom_screen/application_screen.dart';
import 'package:universityfinder/features/dashboard/bottom_screen/home_screen.dart';
import 'package:universityfinder/features/dashboard/bottom_screen/profile_screen.dart';

class BottomscreenLayout extends StatefulWidget {
  const BottomscreenLayout({super.key});

  @override
  State<BottomscreenLayout> createState() => _BottomscreenLayoutState();
}

class _BottomscreenLayoutState extends State<BottomscreenLayout> {
  int _selectedIndex=0;
  List<Widget> lstBottomScreen=[
   const HomeScreen(),
    const ApplicationScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lstBottomScreen[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items:const[
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',),
            BottomNavigationBarItem(icon: Icon(Icons.assignment_sharp),
                label: 'Application'),
            BottomNavigationBarItem(icon: Icon(Icons.person),
                label: 'Profile'),

          ],
          backgroundColor: Colors.blueAccent,
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
