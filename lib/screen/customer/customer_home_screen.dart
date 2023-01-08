import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saba_lab444/providers/auth_provider.dart';
import 'package:saba_lab444/screen/customer/cCategory_View.dart';
import 'package:saba_lab444/screen/customer/profile_customer.dart';
import 'package:saba_lab444/screen/customer/hCategory_View.dart';
import 'package:saba_lab444/screen/customer/jCategory_View.dart';
import 'package:saba_lab444/theme/colors.dart';

import 'package:line_icons/line_icons.dart';
class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({ Key? key }) : super(key: key);

  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
 
  
  
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, wid){
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 90,
            title: GestureDetector(
             onTap: provider.signOut,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "التصنيفات",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.category_rounded,
                    size: 30,
                  ),
                ],

              ),
            ),
            backgroundColor: primary,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon:Icon(LineIcons.search,size: 30,),
              onPressed: () {
                //showSearch(
                //context: context,
                // delegate: MySearchDelegate(),
                // );
              },
            ),
          ),
          body: getBody() 


         
        );
      },
    );
  }
    Widget getBody() {
    return SafeArea(
      child:Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> jCategory_View()));
              },
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),color: primary),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LineIcons.ring,size: 50,color:white,),
                  Text("المجوهرات",style: TextStyle(color:white,fontSize: 20),)
              ],),),
            ),
            InkWell( 
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> cCategory_View()));
              },
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),color: primary),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LineIcons.tShirt,size: 50,color:white,),
                  Text("الملابس",style: TextStyle(color:white,fontSize: 20),)
              ],),),
            ),
            Container(),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> hCategory_View()));
              },
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),color: primary),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LineIcons.home,size: 50,color:white,),
                  Text("المنزل والديكور",style: TextStyle(color:white,fontSize: 20),)
              ],),),
            ),
            
            
          ],
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
          ),
        ),
      ) ,

    );
    }
} //END CLASS