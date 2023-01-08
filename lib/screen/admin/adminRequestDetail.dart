import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:saba_lab444/providers/admin_provider.dart';
import 'package:saba_lab444/screen/admin/admin_home_screen.dart';
import 'package:saba_lab444/theme/colors.dart';

class requestDetail extends StatefulWidget {
  const requestDetail({Key? key}) : super(key: key);

  @override
  _requestDetailState createState() => _requestDetailState();
}

class _requestDetailState extends State<requestDetail> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
      builder: (context, provider, wid) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "طلب الانضمام",
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
            backgroundColor: primary,
            toolbarHeight: 90,
            actions: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AdminHomeScreen()));
                },
                child: Icon(
                  LineIcons.chevronRight,
                  size: 30,
                ),
              ),
            ],
          ), //AppBar

          body: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  width: 160,
                  height: 160,
                  padding: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: white,
                    image: DecorationImage(
                        image: NetworkImage(provider.selectedShop!.image!),
                        fit: BoxFit.cover),
                    border: Border.all(width: 4, color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1))
                    ],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topRight,
                color: white,
                padding: EdgeInsets.all(20),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "اسم المتجر",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            provider.selectedShop!.shopName!,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "البريد الإلكتروني",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            provider.selectedShop!.email!,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "فئة المتجر",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            provider.selectedShop!.bCategory!,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "السجل التجاري",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            provider.selectedShop!.maerufCode!,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "رقم الجوال",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            provider.selectedShop!.phone!,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "عنوان المتجر",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            provider.selectedShop!.bAddress!,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              //HERE ENDS THE INFO CARD //Sizedbox

              Column(children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: GestureDetector(
                    onTap: () => provider.changeStatus(1),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "قبول",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: white,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            LineIcons.check,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: GestureDetector(
                    onTap: () => provider.changeStatus(2),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "رفض",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: white,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.highlight_remove,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ] //children
                  ),
              SizedBox(
                height: 30,
              ),
            ], //children
          ), //listView
        );
      },
    );
  }
}
