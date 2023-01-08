import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:saba_lab444/model/product_model.dart';
import 'package:saba_lab444/providers/customer_provider.dart';
import 'package:saba_lab444/screen/customer/customer_home_screen.dart';
import 'package:saba_lab444/screen/productDetails_view.dart';
import 'package:saba_lab444/screen/shoppingCart_view.dart';
import 'package:saba_lab444/theme/colors.dart';
import 'package:saba_lab444/widgets/product_item_business.dart';
import 'package:saba_lab444/widgets/product_item_customer.dart';
import 'package:saba_lab444/widgets/shop_item_business.dart';

class csshopView extends StatefulWidget {
  const csshopView({Key? key}) : super(key: key);

  @override
  _csshopViewState createState() => _csshopViewState();
}

class _csshopViewState extends State<csshopView> {
  Stream<QuerySnapshot>? _productsStream;

  @override
  void initState() {
    final _provider = Provider.of<CustomerProvider>(context, listen: false);
    _productsStream = FirebaseFirestore.instance
        .collection('products')
        .where('user_id', isEqualTo: _provider.selectedShopModel!.uId)
        .snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerProvider>(
      builder: (context, provider, wid) {
        return Scaffold(
            body: Scaffold(
          appBar: AppBar(
              backgroundColor: primary,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    LineIcons.chevronRight,
                    size: 30,
                  ),
                  onPressed: () => Navigator.pop(context),
                )
              ],
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
                      Text("${provider.selectedShopModel!.rating}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("${provider.selectedShopModel!.shopName}    ",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500)),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30.0,
                        backgroundImage:
                            NetworkImage(provider.selectedShopModel!.image!),
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
                  return ProductItemCustomer(product: _product);
                }).toList(),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => shoppingCart()));
            },
            backgroundColor: Colors.blue[700],
            child: const Icon(LineIcons.shoppingCart),
          ),
        ));
      },
    );
  }
} //Class End
