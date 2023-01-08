import 'package:flutter/material.dart';
import 'package:saba_lab444/screen/customer/profile_customer.dart';
import 'package:saba_lab444/theme/colors.dart';
import 'package:saba_lab444/screen/customer/customer_home_screen.dart';


class CustomerMainScreen extends StatefulWidget {
  const CustomerMainScreen({Key? key}) : super(key: key);
  @override
  _CustomerMainScreenState createState() => _CustomerMainScreenState();
}

class _CustomerMainScreenState extends State<CustomerMainScreen> {
  int currentIndex = 0;
  final screens = [
    CustomerHomeScreen(), 
    Center(child: Text('Orders', style: TextStyle(fontSize: 60))),
    CustomerProfile(),
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
            backgroundColor: primary
         ), 
      );
   }
}
