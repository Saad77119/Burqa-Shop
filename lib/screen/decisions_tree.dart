import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saba_lab444/screen/customer/customer_home_screen.dart';
import 'package:saba_lab444/screen/home_screen.dart';
import 'package:saba_lab444/screen/business/business_home_screen.dart';

import 'general/first_screen.dart';

class DecisionsTree extends StatefulWidget {
  @override
  _DecisionsTreeState createState() => _DecisionsTreeState();
}

class _DecisionsTreeState extends State<DecisionsTree> {

  User? user = FirebaseAuth.instance.currentUser;


  @override
  void initState() {
    super.initState();
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  onRefresh(userCred) {
    if (mounted) {
      setState(() {
        user = userCred;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return FirstScreen();
    } else {
      // var document;
      String userID = user!.uid;
      FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .get()
          .then((doc) {
        if (doc.exists) {
          Map<String, dynamic>? data = doc.data();
          if (data!['role'] == 'BO') {
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (context) => BusinessHomeScreen()));
          } else if (data['role'] == 'customer') {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => new CustomerHomeScreen()));
          }
        } else {
          print('Not Authorized');
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) => FirstScreen()));
        }
      });
    } //end outter else
    return _buildWaitingScreen();
    // return UsersScreen();
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
      backgroundColor: const Color(0xffededed),
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: const Color(0xdeedd03c),
        ),
      ),
    );
  }
}