import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:saba_lab444/providers/business_provider.dart';
import 'package:saba_lab444/screen/business/business_home_screen.dart';
import 'package:saba_lab444/services/navigation_service.dart';
import 'package:saba_lab444/theme/colors.dart';

import '../../locator.dart';

class ProductDetailBusinessScreen extends StatefulWidget {
  const ProductDetailBusinessScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailBusinessScreenState createState() =>
      _ProductDetailBusinessScreenState();
}

class _ProductDetailBusinessScreenState
    extends State<ProductDetailBusinessScreen> {
  @override
  Widget build(BuildContext context) {
    final _bProvider = Provider.of<BusinessProvider>(context);
    final NavigationService _navigationService = locator<NavigationService>();
    return Consumer<BusinessProvider>(
      builder: (context, provider, wid) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "تفاصيل المنتج",
                  style: TextStyle(fontSize: 25),
                ),
                Icon(
                  Icons.shopping_bag,
                  size: 30,
                ),
              ],
            ),
            backgroundColor: primary,
            toolbarHeight: 90,
            actions: [
              InkWell(
                onTap: () => Navigator.pop(context),
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
              Container(
                height: 400,
                width: 400,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image:
                            NetworkImage(provider.selectedProductModel!.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //HERE STARTS THE MESS
              Container(
                color: white,
                padding: EdgeInsets.all(20),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: [
                              Text(
                                "${provider.selectedProductModel!.price}SR",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                provider.selectedProductModel!.name,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: [
                                Text(
                                  "المقاس",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  provider.selectedProductModel!.size,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "المادة",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  provider.selectedProductModel!.material,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "الوصف",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          provider.selectedProductModel!.description,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //HERE ENDS THE INFO CARD
              SizedBox(
                height: 20,
              ),
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
                        "تعديل",
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
                        LineIcons.pen,
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: GestureDetector(
                    onTap: () => [
                      _bProvider.deleteProduct(),
                      _navigationService.goBack()
                    ],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "حذف",
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
                          LineIcons.alternateTrash,
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
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
