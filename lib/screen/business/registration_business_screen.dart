import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:saba_lab444/providers/auth_provider.dart';
import 'package:saba_lab444/widgets/sanaah_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationBusinessScreen extends StatefulWidget {
  final Function(User) onSignIn;

  const RegistrationBusinessScreen({required this.onSignIn});

  @override
  _RegistrationBusinessScreenState createState() =>
      _RegistrationBusinessScreenState();
}

class _RegistrationBusinessScreenState
    extends State<RegistrationBusinessScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, wid) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Color(0xFFF2F2F2),
            appBar: AppBar(
              backgroundColor: Color(0xFF393737),
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(
                  LineIcons.chevronRight,
                  size: 30,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: Center(
              child: Container(
                constraints: BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Background3.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "إنشاء حساب متجر جديد ",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Color(0xFF393737),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            GestureDetector(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          width: 0, color: Colors.white),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 20,
                                          offset: const Offset(5, 5),
                                        ),
                                      ],
                                    ),
                                    child: image == null
                                        ? Icon(
                                            Icons.person,
                                            color: Colors.grey.shade300,
                                            size: 80.0,
                                          )
                                        : Image.file(
                                            File(image!.path),
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                  Positioned(
                                    bottom: 6,
                                    right: 3,
                                    child: Container(
                                      child: Icon(
                                        Icons.add_circle,
                                        color: Colors.grey,
                                        size: 25.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () async {
                                image = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {});
                              },
                            ),
                            SizedBox(height: 45),
                            SanaahTextField(
                              controller: provider.shopNameTec,
                              prefix: Icon(Icons.person),
                              textInputType: TextInputType.text,
                              isForm: true,
                              labelText: "أسم المتجر",
                              validator: 0,
                            ),
                            SanaahTextField(
                              controller: provider.emailTec,
                              prefix: Icon(Icons.mail),
                              textInputType: TextInputType.emailAddress,
                              isForm: true,
                              labelText: "البريد الإلكتروني",
                              validator: 1,
                            ),
                            SanaahTextField(
                              controller: provider.passwordTec,
                              prefix: Icon(Icons.lock),
                              textInputType: TextInputType.visiblePassword,
                              isForm: true,
                              labelText: "كلمة المرور",
                              validator: 2,
                              obscure: true,
                            ),
                            SanaahTextField(
                              controller: provider.password2Tec,
                              prefix: Icon(Icons.lock),
                              textInputType: TextInputType.visiblePassword,
                              isForm: true,
                              labelText: "تاكيد كلمة المرور",
                              validator: 6,
                              obscure: true,
                            ),
                            SanaahTextField(
                              controller: provider.phoneTec,
                              prefix: Icon(Icons.phone),
                              textInputType: TextInputType.phone,
                              isForm: true,
                              labelText: "رقم الجوال ",
                              validator: 4,
                            ),
                            SanaahTextField(
                              controller: provider.maerufTec,
                              prefix: Icon(Icons.add_business),
                              textInputType: TextInputType.text,
                              isForm: true,
                              labelText: "رقم معروف ",
                              validator: 0,
                            ),
                            DropdownButtonFormField<String>(
                              hint: Text('اختر تصنيف'),
                              value: provider.selectedBizCategory,
                              onChanged: (value) {
                                // setState(() {
                                //   dropdownValue = newValue!;
                                // });
                                provider.changeCategory(value);
                              },
                              items: provider.bCategories
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  alignment: Alignment.centerRight,
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              isExpanded: true,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: Icon(Icons.category),
                                contentPadding:
                                    EdgeInsets.fromLTRB(7, 20, 8, 20),
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: const Color(0xFF393737),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            SanaahTextField(
                              controller: provider.addressTec,
                              prefix: Icon(Icons.add_location_alt),
                              textInputType: TextInputType.streetAddress,
                              isForm: true,
                              labelText: "العنوان",
                              validator: 0,
                              bottomPadding: 40,
                            ),
                            Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xFF393737),
                              child: MaterialButton(
                                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                minWidth: MediaQuery.of(context).size.width,
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    if (provider.selectedBizCategory != null) {
                                      if (image != null) {
                                        // await provider.signUp(1);
                                        await provider.uploadImage(image!);
                                      } else {
                                        EasyLoading.showError(
                                            'الرجاء اضافة صورة');
                                      }
                                    } else {
                                      EasyLoading.showError('اختار تصنيف');
                                    }
                                  }
                                },
                                child: Text(
                                  "التسجيل ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFF2F2F2),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
