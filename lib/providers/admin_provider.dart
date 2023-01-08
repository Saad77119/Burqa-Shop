import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:saba_lab444/locator.dart';
import 'package:saba_lab444/model/user_model.dart';

import '../services/navigation_service.dart';

class AdminProvider extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();

  UserModel? selectedShop;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future changeStatus(int status) async {
    try {
      EasyLoading.show(status: '...انتظر قليلًا');
      await _firestore.collection('users').doc(selectedShop!.uId!).update({
        'status': status,
      });
      EasyLoading.dismiss();
      EasyLoading.showSuccess('!تمت العملية بنجاح');
      _navigationService.goBack();
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('$e');
      print('err -> $e');
    }
  }
}
