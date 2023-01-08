import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:saba_lab444/screen/business/business_home_screen.dart';
import 'package:saba_lab444/theme/colors.dart';

class addProduct extends StatefulWidget {
  const addProduct({Key? key}) : super(key: key);

  @override
  _addProductState createState() => _addProductState();
}

class _addProductState extends State<addProduct> {
  //img?
  String name = "";
  double price = 0.00;
  String description = "";
  String size = "";
  String material = "";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget buildNameField() {
    return TextFormField(
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      maxLength: 18,
      decoration: InputDecoration(
        hintText: 'ماهو اسم المنتج؟',
        hintStyle: TextStyle(fontSize: 18, color: Colors.grey[400]),
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
          borderSide: BorderSide(color: primary),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "هذا الحقل مطلوب";
        }
      },
      onSaved: (String? value) => name = value as String,
    );
  }

  Widget buildPriceField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      maxLength: 5,
      decoration: InputDecoration(
        hintText: 'ماهو سعر المنتج؟',
        hintStyle: TextStyle(fontSize: 18, color: Colors.grey[400]),
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
          borderSide: BorderSide(color: primary),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "هذا الحقل مطلوب";
        }
      },
      onSaved: (String? value) => price = value as double,
    );
  }

  Widget buildDescriptionField() {
    return TextFormField(
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      maxLength: 100,
      decoration: InputDecoration(
        hintText: 'ماهو وصف المنتج؟',
        hintStyle: TextStyle(fontSize: 18, color: Colors.grey[400]),
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
          borderSide: BorderSide(color: primary),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "هذا الحقل مطلوب";
        }
      },
      onSaved: (String? value) => description = value as String,
    );
  }

  Widget buildSizeField() {
    return TextFormField(
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      maxLength: 1,
      decoration: InputDecoration(
        hintText: 'ماهي المقاسات المتاحة للمنتج؟',
        hintStyle: TextStyle(fontSize: 18, color: Colors.grey[400]),
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
          borderSide: BorderSide(color: primary),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "هذا الحقل مطلوب";
        }
      },
      onSaved: (String? value) => size = value as String,
    );
    ;
  }

  Widget buildMaterialField() {
    return TextFormField(
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      maxLength: 10,
      decoration: InputDecoration(
        hintText: 'ما هي المادة المصنعة للمنتج؟',
        hintStyle: TextStyle(fontSize: 18, color: Colors.grey[400]),
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
          borderSide: BorderSide(color: primary),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "هذا الحقل مطلوب";
        }
      },
      onSaved: (String? value) => material = value as String,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "إضافة منتج جديد",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              width: 5,
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
            onTap: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (_) => BusinessHomeScreen()));
            },
            child: Icon(
              LineIcons.chevronRight,
              size: 30,
            ),
          ),
        ],
      ),
      //End AppBar
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //the widgets
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "* ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: red),
                    ),
                    Text(
                      "اسم المنتج",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                buildNameField(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "* ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: red),
                    ),
                    Text(
                      "السعر",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                buildPriceField(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "* ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: red),
                    ),
                    Text(
                      "المقاس",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                buildSizeField(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "* ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: red),
                    ),
                    Text(
                      "المادة",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                buildMaterialField(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "* ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: red),
                    ),
                    Text(
                      "الوصف",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                buildDescriptionField(),
                SizedBox(
                  height: 50,
                ), //This is the space above the button
                //Submit Button
                InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      //RETURN STATEMENT HERE!
                    }

                    formKey.currentState!.save();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
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
                            "إضافة",
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
                            Icons.check,
                            size: 30,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //End Submit button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
