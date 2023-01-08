import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/datetime_converter.dart';

/// 0 = Admin, 1= BO, 2=Customer, 3=Delivery

class UserModel {
  String? uId,
      fName,
      lName,
      email,
      phone,
      shopName,
      bAddress,
      maerufCode,
      image,
      bCategory,
      rating;
  int status, role;
  DateTime? doc;

  UserModel({
    required this.uId,
    required this.fName,
    required this.lName,
    required this.email,
    required this.phone,
    required this.shopName,
    required this.image,
    required this.bAddress,
    required this.maerufCode,
    required this.bCategory,
    required this.status,
    required this.role,
    required this.doc,
    required this.rating,
  });

  factory UserModel.fromJson(DocumentSnapshot doc) {
    Map<String, dynamic> map = doc.data()! as Map<String, dynamic>;
    return UserModel(
      uId: doc.id,
      fName: map['f_name'] ?? '',
      lName: map['l_name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      image: map['image'] ?? '',
      shopName: map['shop_name'] ?? '',
      bAddress: map['address'] ?? '',
      maerufCode: map['maeruf'] ?? '',
      bCategory: map['category'] ?? '',
      status: map['status'] ?? 0,
      role: map['role'] ?? 2,
      rating: map['rating'] ?? '',
      doc: DateTimeConverter().convert(map['doc']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'f_name': fName,
      'l_name': lName,
      'email': email,
      'phone': phone,
      'shop_name': shopName,
      'b_address': bAddress,
      'image': image,
      'maeruf_code': maerufCode,
      'b_category': bCategory,
      'status': status,
      'role': role,
      'doc': doc,
      'rating': rating,
    };
  }
}
