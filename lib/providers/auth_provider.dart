import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import '../app_router.dart';
import '../locator.dart';
import '../model/user_model.dart';
import '../services/navigation_service.dart';

/// 0 = Admin, 1= BO, 2=Customer, 3=Delivery

class AuthProvider extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();

  // General
  final emailTec = TextEditingController();
  final passwordTec = TextEditingController();
  final password2Tec = TextEditingController();
  final phoneTec = TextEditingController();

  // Business
  final shopNameTec = TextEditingController();
  final maerufTec = TextEditingController();
  final addressTec = TextEditingController();

  // Customer
  final fNameTec = TextEditingController();
  final lNameTec = TextEditingController();

  List<String> bCategories = ['ملابس', 'مجوهرات', 'منزل وديكور'];
  String? selectedBizCategory;

  changeCategory(value) {
    selectedBizCategory = value;
    notifyListeners();
  }

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  UserModel? currentUser;

  Future<void> signUp(int role, {String? imgUrl}) async {
    EasyLoading.show(status: 'تحميل ...');
    String _message = '';

    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: emailTec.text, password: passwordTec.text)
          .then(
        (userCred) async {
          /// SUCCESS : now get the uid of the user and add user detail in firestore
          /// Use if/else with "role" to save data differently
          /// status - 0=un-approved - 1=approved - 2=blocked
          if (role == 1) {
            await _firestore.collection('users').doc(userCred.user!.uid).set({
              'email': emailTec.text,
              'shop_name': shopNameTec.text,
              'phone': phoneTec.text,
              'maeruf': maerufTec.text,
              'address': addressTec.text,
              'status': 0,
              'role': role,
              'doc': DateTime.now(),
              'image': imgUrl,
            });
          } else if (role == 2) {
            await _firestore.collection('users').doc(userCred.user!.uid).set({
              'f_name': fNameTec.text,
              'l_name': lNameTec.text,
              'email': emailTec.text,
              'phone': phoneTec.text,
              'status': 1,
              'role': role,
              'doc': DateTime.now(),
            });
          }
          EasyLoading.dismiss();
          await getUserInfo(userCred.user!);
        },
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          _message = 'البريد الإلكتروني مستخدم مسبقًا';
          break;
        case "invalid-email":
          _message = 'البديد الإلكتروني غير صالح';
          break;
        case "too-many-requests":
          _message = 'يجب على المستخدم إعادة المصادقة قبل تنفيذ هذه العملية';
          break;
        case "operation-not-allowed":
          _message = 'يجب على المستخدم إعادة المصادقة قبل تنفيذ هذه العملية';
          break;
        case "network-request-failed":
          _message = 'يجب على المستخدم إعادة المصادقة قبل تنفيذ هذه العملية';
          break;
        case "credential-already-in-use":
          _message = 'بيانات الاعتماد هذه مرتبطة بالفعل بحساب مستخدم مختلف';
          break;
        case "invalid-email":
          _message = 'البريد الالكتروني غير صحيح';
          break;
        default:
          _message = 'حدث خطأ ما ، أعد المحاولة من فضلك';
          break;
      }
      EasyLoading.dismiss();
      EasyLoading.showError(_message);
    }
  }

  Future<void> getUserInfo(User _user) async {
    try {
      EasyLoading.show(status: 'تحميل...');
      DocumentSnapshot<Map<String, dynamic>> doc =
          await _firestore.collection('users').doc(_user.uid).get();
      if (doc.exists) {
        EasyLoading.dismiss();
        currentUser = UserModel.fromJson(doc);
        clearTextFields();
        switch (currentUser!.role) {
          case 0:
            if (_navigationService.navigatorKey.currentState!.canPop()) {
              _navigationService
                  .navigateAndRemoveUntilReplace(AppRoute.adminMainScreen);
            } else {
              _navigationService.navigateReplace(AppRoute.adminMainScreen);
            }
            break;
          case 1:
            if (currentUser!.status == 0) {
              _navigationService
                  .navigateAndRemoveUntilReplace(AppRoute.registerComplete);
            } else {
              if (_navigationService.navigatorKey.currentState!.canPop()) {
                _navigationService
                    .navigateAndRemoveUntilReplace(AppRoute.businessMainScreen);
              } else {
                _navigationService.navigateReplace(AppRoute.businessMainScreen);
              }
            }
            break;
          case 2:
            if (_navigationService.navigatorKey.currentState!.canPop()) {
              _navigationService
                  .navigateAndRemoveUntilReplace(AppRoute.customerMainScreen);
            } else {
              _navigationService.navigateReplace(AppRoute.customerMainScreen);
            }
            break;
          case 3:
            break;
          default:
            if (_navigationService.navigatorKey.currentState!.canPop()) {
              _navigationService
                  .navigateAndRemoveUntilReplace(AppRoute.customerHomeScreen);
            } else {
              _navigationService.navigateReplace(AppRoute.customerHomeScreen);
            }
            break;
        }
      }
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
    }
  }

  Future checkAuthStatus() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (_auth.currentUser != null) {
        await _auth.currentUser!.reload();
        await getUserInfo(_auth.currentUser!);
      } else {
        _navigationService.navigateReplace(AppRoute.firstScreen);
      }
    } on FirebaseAuthException catch (e) {
      await _auth.signOut();
      _navigationService.navigateReplace(AppRoute.firstScreen);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _navigationService.navigateAndRemoveUntilReplace(AppRoute.firstScreen);
    } catch (e) {
      debugPrint('signOutUser -> err -> $e');
    }
  }

  Future signIn() async {
    String _message = '';
    try {
      EasyLoading.show(status: 'التحقق من التفاصيل');
      UserCredential value = await _auth.signInWithEmailAndPassword(
          email: emailTec.text, password: passwordTec.text);
      EasyLoading.dismiss();
      if (value.user != null) {
        await getUserInfo(value.user!);
      }
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'كلمة مرور خاطئة') {
        _message = 'البريد الالكتروني غير صحيح';
      } else if (e.code == 'user-not-found') {
        _message = 'البريد الالكتروني غير صحيح';
      } else {
        _message = 'البريد الالكتروني غير صحيح';
      }
      EasyLoading.showError(_message);
    }
  }

  Future sendChangePasswordLink({String? email}) async {
    try {
      EasyLoading.show(status: 'تحميل ...');
      await _auth.sendPasswordResetEmail(
          email: email ?? _auth.currentUser!.email!);
      EasyLoading.dismiss();
      EasyLoading.showSuccess('تم ترسال الأيميل');
      if (email != null) {
        clearTextFields();
        _navigationService.goBack();
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('حدث خطأ ما');
    }
  }

  Future uploadImage(XFile image) async {
    try {
      EasyLoading.show(status: 'رفع البايانات...');
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('businesses')
          .child("${DateTime.now().millisecondsSinceEpoch.toString()}.png");
      print('startingg -> ${storageReference.fullPath}');
      await storageReference.putFile(File(image.path)).then((p0) async {
        debugPrint('File Uploaded ${p0.ref}');
        await storageReference.getDownloadURL().then((fileURL) async {
          debugPrint("Uploaded File URL: $fileURL");
          EasyLoading.dismiss();
          await signUp(1, imgUrl: fileURL);
        });
      });
      // await uploadTask.whenComplete(() async {
      //
      // });
    } catch (e) {
      print('err -> $e');
      EasyLoading.dismiss();
      EasyLoading.showError('حدث خطأ ما أثناء تحميل الصورة ');
    }
  }

  clearTextFields() {
    emailTec.text = '';
    passwordTec.text = '';
    password2Tec.text = '';
    phoneTec.text = '';
    shopNameTec.text = '';
    maerufTec.text = '';
    addressTec.text = '';
    fNameTec.text = '';
    lNameTec.text = '';
  }
}
