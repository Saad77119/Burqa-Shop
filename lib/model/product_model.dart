import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/datetime_converter.dart';

/// 0 = Admin, 1= BO, 2=Customer, 3=Delivery

class ProductModel {
  String id, name, description, material, size, image;
  num price;
  DateTime? doc; //date of creation

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.material,
    required this.price,
    required this.size,
    required this.image,
    required this.doc,
  });

  factory ProductModel.fromJson(DocumentSnapshot doc) {
    Map<String, dynamic> map = doc.data()! as Map<String, dynamic>;
    return ProductModel(
      id: doc.id,
      name: map['product_name'] ?? '',
      description: map['product_description'] ?? '',
      material: map['product_material'] ?? '',
      price: map['product_price'] ?? 0.00,
      image: map['product_image'] ?? '',
      size: map['product_size'] ?? '',
      doc: DateTimeConverter().convert(map['doc']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product_name': name,
      'product_description': description,
      'product_material': material,
      'product_price': price,
      'product_size': size,
      'product_image': image,
      'doc': doc,
    };
  }
}
