import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:saba_lab444/screen/customerShop_view.dart';
import 'package:saba_lab444/theme/colors.dart';


class shoppingCart extends StatefulWidget {
  const shoppingCart({Key? key}) : super(key: key);

  @override
  _shoppingCartState createState() => _shoppingCartState();
}

class _shoppingCartState extends State<shoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "سلة الطلبات",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              width: 3,
            ),
            Icon(
              LineIcons.shoppingCart,
              size: 35,
            ),
          ],
        ),
        backgroundColor: primary,
        toolbarHeight: 90,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => csshopView()));
            },
            child: Icon(
              LineIcons.chevronRight,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          //END HEADER _____________________________________________________________________________________________
          SizedBox(
            height: 20,
          ),

          //HERE STARTS THE RECEIPT
          Card(
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
                          height: 80,
                        ),
                        Row(
                          children: [
                            Icon(
                              LineIcons.alternateTrashAlt,
                              size: 30,
                              color: Colors.red[600],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "(عباءة صيفية (أزرق",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "22000SR",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage("assets/images/abaya1.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Card(
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
                          height: 80,
                        ),
                        Row(
                          children: [
                            Icon(
                              LineIcons.alternateTrashAlt,
                              size: 30,
                              color: Colors.red[600],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "(عباءة صيفية (أزرق",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "22000SR",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage("assets/images/abaya2.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          //HERE ENDS THE RECEIPT
          SizedBox(
            height: 20,
          ),
          //TOTAL CONTAINER START
          Container(
            color: white,
            padding: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "20SR",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            ":تكلفة التوصيل",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "11111SR",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            ":المجموع",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              right: 10,
              top: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  ".الطلب لا يرد ولا يستبدل بعد تنفيذ شراء الطلب",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.right,
                ),
                Text(
                  "*",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //TOTAL CONTAINER END
          //BUTTON
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "تنفيذ الطلب",
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
                    LineIcons.checkCircle,
                    size: 25,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
          //BUTTON END
        ],
      ),
    );
  }
}
