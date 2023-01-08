import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saba_lab444/app_router.dart';
import 'package:saba_lab444/screen/general/login_screen.dart';
import 'package:saba_lab444/screen/customer/registration_customer_screen.dart';
import 'package:line_icons/line_icons.dart';

import '../CustomPageRoute.dart';
import 'singup_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
// form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF393737),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () => Navigator.pushNamed(context, AppRoute.loginScreen),
        child: Text(
          "تسجيل الدخول",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Color(0xFFF2F2F2),
              fontWeight: FontWeight.bold),
        ),
      ),
    );

    final singUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF393737),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () => Navigator.pushNamed(context, AppRoute.signUpScreen),
        child: Text(
          "تسجيل جديد",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Color(0xFFF2F2F2),
              fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Background3.png"), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    SizedBox(
                        height: 190,
                        child: Image.asset(
                          "assets/logo2.png",
                          fit: BoxFit.cover,
                        )),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            "مرحباً بك",
                            style: TextStyle(
                                fontSize: 35,
                                color: Color(0xFF393737),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 35),
                          loginButton,
                          SizedBox(height: 25),
                          singUpButton,
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
