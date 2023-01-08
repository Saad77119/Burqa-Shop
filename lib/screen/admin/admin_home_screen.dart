import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:saba_lab444/model/user_model.dart';
import 'package:saba_lab444/providers/auth_provider.dart';
import 'package:saba_lab444/screen/customer/customer_home_screen.dart';
import 'package:saba_lab444/screen/customerShop_view.dart';
import 'package:saba_lab444/theme/colors.dart';

import '../../widgets/admin_list_item.dart';
import 'adminRequestDetail.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  AdminHomeScreenState createState() => AdminHomeScreenState();
}

class AdminHomeScreenState extends State<AdminHomeScreen> {
  Stream<QuerySnapshot> _shopsStream = FirebaseFirestore.instance
      .collection('users')
      .where('role', isEqualTo: 1)
      .where('status', isEqualTo: 0)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, wid) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 90,
            title: GestureDetector(
              // onTap: provider.signOut,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "طلبات الانضمام",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.note_add,
                    size: 35,
                  ),
                ],
              ),
            ),
            backgroundColor: primary,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.logout,
                  size: 30,
                ),
                onPressed: provider.signOut,
              ),
            ],
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: _shopsStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LinearProgressIndicator();
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  UserModel _shop = UserModel.fromJson(document);
                  return AdminListItem(shop: _shop);
                }).toList(),
              );
            },
          ),
        );
      },
    );
  }
}


/*

SafeArea(
            child: ListView(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => requestDetail()));
                    },
                    child: Card(
                      //First Card
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "عبايات مرج",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 30.0,
                                  backgroundImage:
                                      AssetImage('assets/images/murj.png'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //___________________________________________________________________________________________________
                Card(
                  //Second Card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              " متجر ايفا",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30.0,
                              backgroundImage:
                                  AssetImage('assets/images/hanger.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //__________________________________________________________________________________________________________
                Card(
                  //Third Card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "متجر إيفيم",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30.0,
                              backgroundImage:
                                  AssetImage('assets/images/hanger.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                //______________________________________________________________________________________________________________
              ],
            ),
          )

* */