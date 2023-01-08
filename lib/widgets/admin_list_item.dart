import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saba_lab444/model/user_model.dart';
import 'package:saba_lab444/providers/admin_provider.dart';

import '../screen/admin/adminRequestDetail.dart';

class AdminListItem extends StatefulWidget {
  final UserModel shop;
  const AdminListItem({Key? key, required this.shop}) : super(key: key);

  @override
  _AdminListItemState createState() => _AdminListItemState();
}

class _AdminListItemState extends State<AdminListItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
      builder: (context, provider, wid){
        return InkWell(
          onTap: () {
            provider.selectedShop = widget.shop;
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
                        '${widget.shop.shopName}',
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
                        NetworkImage(widget.shop.image!),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
