import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:saba_lab444/app_router.dart';
import 'package:saba_lab444/theme/colors.dart';

class RegisterComplete extends StatelessWidget {
  const RegisterComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF393737),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30.0),
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Background3.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  LineIcons.handHoldingHeart,
                  size: 70,
                ),
                Icon(
                  LineIcons.beamingFaceWithSmilingEyes,
                  size: 80,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text("شكرًا لاشتراكك مع صَنعَة",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                      "حاليًا ، يتم الإطلاع على معلوماتك من قبل مسؤولنا للتحقق من صحتها, وبمجرد التأكيد على ذلك, ستتلقى رسالة تأكيد بالبريد الإلكتروني حيث ستتمكن من تسجيل الدخول والبدء في إدارة متجرك",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  )),
              child: MaterialButton(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoute.loginScreen),
                child: Text(
                  "تسجيل الدخول",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFF2F2F2),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
