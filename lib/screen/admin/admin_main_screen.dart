import 'package:flutter/material.dart';
import 'package:saba_lab444/screen/admin/admin_home_screen.dart';
import 'package:saba_lab444/screen/customer/customer_home_screen.dart';
import 'package:saba_lab444/theme/colors.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({Key? key}) : super(key: key);
  @override
  _AdminMainScreenState createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  int currentIndex = 0;
  final screens = [
    AdminHomeScreen(),
     CustomerHomeScreen(),
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
                  Icons.add_business_rounded,
                  color: Colors.white70,
                ),
                label: '',
              ),

               BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white70,
                  ),
                  backgroundColor: Colors.white,
                  label: ''),
            ],
            backgroundColor: primary),
      );
}