import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:saba_lab444/app_router.dart';
import 'package:saba_lab444/providers/auth_provider.dart';
import 'package:saba_lab444/screen/general/forget_password.dart';
import 'package:line_icons/line_icons.dart';
import '../../widgets/sanaah_text_field.dart';
import 'first_screen.dart';
import 'singup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                padding: const EdgeInsets.all(40.0),
                constraints: BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Background3.png"),
                      fit: BoxFit.cover),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 190,
                              child: Image.asset(
                                "assets/logo2.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  const Text(
                                    "سعيدين بعودتك ",
                                    style: TextStyle(
                                        fontSize: 35,
                                        color: Color(0xFF393737),
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 10),
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
                                    validator: 0,
                                    obscure: true,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      bottom: 20,
                                    ),
                                    alignment: Alignment.topRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ResetScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "هل نسيت كلمة المرور ؟  ",
                                        style: TextStyle(
                                          color: Color(0xFF393737),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(30),
                                    color: Color(0xFF393737),
                                    child: MaterialButton(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 15, 20, 15),
                                      minWidth: MediaQuery.of(context).size.width,
                                      onPressed: provider.signIn,
                                      child: Text(
                                        "دخول",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFFF2F2F2),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () => Navigator.pushNamed(
                                              context, AppRoute.signUpScreen),
                                          child: Text(
                                            "ليس لديك حساب ؟ قم بإنشاءه",
                                            style: TextStyle(
                                                color: Color(0xFF393737),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                decoration:
                                                    TextDecoration.underline),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ])
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
          ),
        );
      },
    );
  }
}
