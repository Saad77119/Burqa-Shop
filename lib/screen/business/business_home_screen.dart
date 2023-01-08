import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:saba_lab444/app_router.dart';
import 'package:saba_lab444/model/product_model.dart';
import 'package:saba_lab444/providers/auth_provider.dart';
import 'package:saba_lab444/screen/business/addProduct_view.dart';
import 'package:saba_lab444/screen/business/product_detail_business_screen.dart';
import 'package:saba_lab444/theme/colors.dart';
import 'package:saba_lab444/widgets/product_item_business.dart';

class BusinessHomeScreen extends StatefulWidget {
  const BusinessHomeScreen({Key? key}) : super(key: key);

  @override
  _BusinessHomeScreenState createState() => _BusinessHomeScreenState();
}

class _BusinessHomeScreenState extends State<BusinessHomeScreen> {
  final Stream<QuerySnapshot> _productsStream =
      FirebaseFirestore.instance.collection('products').snapshots();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, wid) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: primary,
              toolbarHeight: 90,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(
                        LineIcons.starAlt,
                        size: 30,
                        color: Colors.yellowAccent[100],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${provider.currentUser!.rating}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("${provider.currentUser!.shopName}   ",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500)),
                      GestureDetector(
                        // onTap: provider.signOut,\
                        onTap: () {
                          Navigator.pushNamed(context, AppRoute.bProfileScreen);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30.0,
                          backgroundImage:
                              NetworkImage(provider.currentUser!.image!),
                        ),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                    ],
                  ),
                ],
              )),
          body: StreamBuilder<QuerySnapshot>(
            stream: _productsStream,
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
                  ProductModel _product = ProductModel.fromJson(document);
                  return ProductItemBusiness(product: _product);
                }).toList(),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => addProduct(),
              ),
            ),
            backgroundColor: Colors.green[400],
            child: const Icon(LineIcons.plus),
          ),
        );
      },
    );
  }
}
