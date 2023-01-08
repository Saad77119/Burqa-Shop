import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:saba_lab444/providers/auth_provider.dart';
import 'package:saba_lab444/screen/general/login_screen.dart';

import '../../widgets/sanaah_text_field.dart';


class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, wid) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
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
                padding: const EdgeInsets.all(30.0),
                constraints: BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Background3.png"),
                      fit: BoxFit.cover),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          SizedBox(
                            height: 190,
                            child: Image.asset(
                              "assets/logo2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                SizedBox(height: 30),
                                const Text(
                                  "الرجاء إدخال بريدك الإلكتروني ليصلك رابط إعادة تعيين كلمة المرور",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFF393737),
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 50),
                                SanaahTextField(
                                  controller: provider.emailTec,
                                  prefix: Icon(Icons.mail),
                                  textInputType: TextInputType.emailAddress,
                                  isForm: true,
                                  labelText: "البريد الإلكتروني",
                                  validator: 1,
                                  bottomPadding: 45,
                                ),
                                Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xFF393737),
                                  child: MaterialButton(
                                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                    minWidth: MediaQuery.of(context).size.width,
                                    onPressed: () {
                                      if(_formKey.currentState!.validate()){
                                        provider.sendChangePasswordLink(email: provider.emailTec.text);
                                      }
                                    },
                                    child: Text(
                                      "إرسال",
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
                        ],
                      ),
                    ],
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
