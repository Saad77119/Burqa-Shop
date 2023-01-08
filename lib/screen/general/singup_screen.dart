import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saba_lab444/screen/CustomPageRoute.dart';
import 'package:saba_lab444/screen/decisions_tree.dart';
import 'package:saba_lab444/screen/general/login_screen.dart';
import 'package:saba_lab444/screen/business/registration_business_screen.dart';
import 'package:saba_lab444/screen/customer/registration_customer_screen.dart';
import 'package:line_icons/line_icons.dart';
import 'package:firebase_core/firebase_core.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
// form key
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

     
   
    


    final CustomerButton = Material(
      elevation:5 ,
      borderRadius: BorderRadius.circular(30),
      color:Color(0xFF393737),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {    
            Navigator.of(context)
                              .push(CustomPageRoute(child: RegistrationAsCustomerScreen(
                            onSignIn: (User) {
                              DecisionsTree();
                            },
                          )));
            
           },
          child: Text("متسوق",textAlign: TextAlign.center,style: TextStyle(fontSize: 20, color: Color(0xFFF2F2F2), fontWeight: FontWeight.bold),
          )),



    );




    final BusinassOwnerButton = Material(
      elevation:5 ,
      borderRadius: BorderRadius.circular(30),
      color:Color(0xFF393737),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () { 
                          Navigator.of(context)
                              .push(CustomPageRoute(child: RegistrationBusinessScreen(
                            onSignIn: (User) {
                              DecisionsTree();
                            },
                          )));
            
           },
          child: Text("صاحب مشروع",textAlign: TextAlign.center,style: TextStyle(fontSize: 20, color: Color(0xFFF2F2F2), fontWeight: FontWeight.bold),
          )),



    );





        

     return Scaffold(
        appBar: AppBar(
       
      backgroundColor: Color(0xFF393737),

      automaticallyImplyLeading: false,
       actions: <Widget>[
          IconButton(
            icon: Icon(LineIcons.chevronRight ,  size: 30,
             ),
             onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
            
             )
        ],

     ),
      


      
      body: Center(
         child:Container(
                   padding: const EdgeInsets.all(30.0),
  constraints: BoxConstraints.expand(),
  decoration: const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/Background3.png"), 
        fit: BoxFit.cover), ),

              

        
     
    
    
        
        child: SingleChildScrollView(
          child:   Column(
               children: [
                 Column( 
  children: [

SizedBox(height: 100,),
    SizedBox( 
      height: 190, 
      child:Image.asset( 
                          "assets/logo2.png",
                          fit: BoxFit.cover,
                        )),
    
                       
                     
  ],
),
SizedBox(height: 20,),
Column(
  
  children: [






         Form(
                key: _formKey,
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch, 
                  children: <Widget>[

                    

                   

                    

                     


                         Text(
                               "مرحباً بك",
                          style: TextStyle(fontSize: 35, color: Color(0xFF393737),  fontWeight: FontWeight.bold),
                             textAlign: TextAlign.center,),
                        
                        SizedBox(height:35),

                        
    
                  
                     CustomerButton,
                     SizedBox(height: 25),

                      BusinassOwnerButton,
                     

                  

      

                     
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
    );

    
  }
}
