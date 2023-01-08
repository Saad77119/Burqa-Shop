import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/sanaah_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationAsCustomerScreen extends StatefulWidget {
  final Function(User) onSignIn;

  const RegistrationAsCustomerScreen({required this.onSignIn});

  @override
  _RegistrationAsCustomerScreenState createState() =>
      _RegistrationAsCustomerScreenState();
}

class _RegistrationAsCustomerScreenState
    extends State<RegistrationAsCustomerScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, wid){
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
                  constraints: BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Background3.png"), fit: BoxFit.cover),
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
                                "إنشاء حساب متسوق جديد ",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xFF393737),
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 45),
                              SanaahTextField(
                                controller: provider.fNameTec,
                                prefix: Icon(Icons.person),
                                textInputType: TextInputType.name,
                                isForm: true,
                                labelText: "الأسم الأول",
                                validator: 0,
                              ),
                              SanaahTextField(
                                controller: provider.lNameTec,
                                prefix: Icon(Icons.person),
                                textInputType: TextInputType.name,
                                isForm: true,
                                labelText: "أسم العائلة",
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
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xFF393737),
                                child: MaterialButton(
                                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  minWidth: MediaQuery.of(context).size.width,
                                  onPressed: () async {
                                    if(_formKey.currentState!.validate()){
                                      await provider.signUp(2);
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
                )),
          ),
        );
      },
    );
  }

}
