import 'package:flutter/material.dart';
import 'package:saba_lab444/screen/customer/profile_customer.dart';
import 'package:saba_lab444/theme/colors.dart';

import 'customer/customer_home_screen.dart';

class CnavBar extends StatefulWidget {
  @override
  _CnavBarState createState() => _CnavBarState();
}

class _CnavBarState extends State<CnavBar> {
  int currentIndex = 0;
  final screens = [
    CustomerHomeScreen(),
    Center(child: Text('Orders', style: TextStyle(fontSize: 60))),
    CustomerProfile(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
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
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_alt_rounded,
                  color: Colors.white70,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.white70,
                ),
                label: '',
              ),
            ],
            backgroundColor: primary),
      );
}