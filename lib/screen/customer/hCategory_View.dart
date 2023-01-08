import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:saba_lab444/model/user_model.dart';
import 'package:saba_lab444/providers/customer_provider.dart';
import 'package:saba_lab444/screen/customer/customer_home_screen.dart';
import 'package:saba_lab444/theme/colors.dart';
import 'package:saba_lab444/widgets/shop_item_business.dart';

class hCategory_View extends StatefulWidget {
  const hCategory_View({Key? key}) : super(key: key);

  @override
  _hCategory_ViewState createState() => _hCategory_ViewState();
}

class _hCategory_ViewState extends State<hCategory_View> {
  final Stream<QuerySnapshot> _shopsStream = FirebaseFirestore.instance
      .collection('users')
      .where('category', isEqualTo: "منزل")
      .where('status', isEqualTo: 1)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerProvider>(
      builder: (context, provider, wid) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 90,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  LineIcons.chevronRight,
                  size: 30,
                ),
                onPressed: () => {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomerHomeScreen()))
                },
              )
            ],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "المنزل والديكور",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  LineIcons.home,
                  size: 30,
                ),
              ],
            ),
            backgroundColor: primary,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(
                LineIcons.search,
                size: 30,
              ),
              onPressed: () {
                //showSearch(
                //context: context,
                // delegate: MySearchDelegate(),
                // );
              },
            ),
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
                  return shopItemBusiness(shop: _shop);
                }).toList(),
              );
            },
          ),
        );
      },
    );
  }
} //Class End