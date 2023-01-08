import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CUserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  int? customerPhone;
  String? role;
  
   
  

  CUserModel({
    this.uid,
    this.email,
    this.firstName,
    this.secondName, 
    this.customerPhone,
    this.role,
  });

  // receiving data from server
  factory CUserModel.fromMap(map) {
    return CUserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      customerPhone: map['customerPhone'],
      role: map['role'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'customerPhoner': customerPhone,
      'role':role,
    };
  }


}