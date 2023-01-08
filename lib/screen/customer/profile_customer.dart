import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:saba_lab444/providers/auth_provider.dart';
import 'package:saba_lab444/theme/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerProfile extends StatefulWidget {
  bool isObscurePassword = true;
  @override
  _ProfilePageUiState createState() => _ProfilePageUiState();
}

class _ProfilePageUiState extends State<CustomerProfile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, wid) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 90,
              backgroundColor: primary,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 30,
                  ),
                  Text(
                    "الملف الشخصي",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.logout,
                  size: 30,
                ),
                onPressed: provider.signOut,
              ),
            ),
            body: Center(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Background3.png"),
                        fit: BoxFit.fill)),
                child: Container(
                  padding: EdgeInsets.only(left: 15, top: 20, right: 15),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: ListView(
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        buildTextField(" الأسم الأول", ""),
                        buildTextField(" الأسم العائلة", ""),
                        buildTextField("البريد الالكتروني", ""),
                        buildTextField("رقم الجوال", ""),
                        Container(
                          margin: EdgeInsets.only(
                            top: 100,
                            bottom: 1,
                          ),
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            tooltip: "تواصل معنا",
                            onPressed: () {
                              print("object");
                              final Uri emailUri = Uri(
                                  scheme: 'mailto',
                                  path: 'saadraza.official@gmail.com');
                              launch(emailUri.toString());
                            },
                            icon: Icon(
                              Icons.mail,
                              color: primary,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 20,
                          ),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "تواصل معنا",
                            style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            labelText: labelText,
            labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54)),
      ),
    );
  }
}
