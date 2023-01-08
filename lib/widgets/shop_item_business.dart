import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:saba_lab444/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:saba_lab444/providers/customer_provider.dart';

import '../app_router.dart';

class shopItemBusiness extends StatelessWidget {
  final UserModel shop;
  const shopItemBusiness({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customerProvider = Provider.of<CustomerProvider>(context);
    return InkWell(
      onTap: () {
        customerProvider.selectedShopModel = shop;
        Navigator.pushNamed(context, AppRoute.csshopview);
      },
      child: Card(
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
                    Row(
                      children: [
                        Icon(
                          LineIcons.starAlt,
                          size: 30,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "${shop.rating}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "${shop.shopName}",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30.0,
                      backgroundImage: NetworkImage(shop.image!),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
