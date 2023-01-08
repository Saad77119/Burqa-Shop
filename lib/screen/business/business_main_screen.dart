import 'package:flutter/material.dart';
import 'package:saba_lab444/screen/business/business_profile.dart';
import 'package:saba_lab444/screen/business/business_home_screen.dart';
import 'package:saba_lab444/theme/colors.dart';


class BusinessMainScreen extends StatefulWidget {
  const BusinessMainScreen({Key? key}) : super(key: key);
  @override
  _BusinessMainScreenState createState() => _BusinessMainScreenState();
}

class _BusinessMainScreenState extends State<BusinessMainScreen> {
  int currentIndex = 0;
  final screens = [
    BusinessHomeScreen(),
    Center(child: Text('Orders', style: TextStyle(fontSize: 60))),
    BusinessProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store_rounded,
              color: Colors.white70,
            ),
            activeIcon: Icon(
              Icons.store_rounded,
              color: Colors.white,
            ),
            backgroundColor: Colors.white,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt_rounded,
              color: Colors.white70,
            ),
            activeIcon: Icon(
              Icons.list_alt_rounded,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white70,
            ),
            activeIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: '',
          ),
        ],
        backgroundColor: primary,
      ),
    );
  }
}
