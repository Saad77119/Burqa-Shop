import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:saba_lab444/locator.dart';
import 'package:saba_lab444/model/product_model.dart';
import 'package:saba_lab444/services/navigation_service.dart';

class BusinessProvider extends ChangeNotifier {
  ProductModel? selectedProductModel;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future deleteProduct() async {
    try {
      EasyLoading.show(status: 'انتظر قليلًا...');
      await _firestore
          .collection('products')
          .doc(selectedProductModel!.id)
          .delete();

      EasyLoading.dismiss();
      EasyLoading.showSuccess('تم الحذف بنجاح!');
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('$e');
      print('err -> $e');
    }
  }
}
