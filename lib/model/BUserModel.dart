import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BUserModel{
  String? uid;
  String? email;
  String? shop_name;
  String? bw_address = "default";
  int? phone;
  String? maeruf_code;
  String? role;

  late String message;
  bool? valid;
  late String msgType;
  bool exist= false;

   BUserModel(
      {this.uid,
      this.email,
      this.shop_name,
      this.bw_address,
      this.phone,
      this.maeruf_code,
      this.role});

  get widget => null;

  set uID(String? value) {
    if (value != null) {
      uid = value;
    }
  }

  set emailSet(String? value) {
    if (value != null) {
      email = value;
    }
  }

  set shopName(String? value) {
    if (value != null) {
      shop_name = value;
    }
  }

  set bwAddress(String? value) {
    if (value != null) {
      bw_address = value;
    }
  }

  set phoneBO(int? value) {
    if (value != null) {
      phone = value;
    }
  }

  set maerufCode(String? value) {
    if (value != null) {
      maeruf_code = value;
    }
  }

  set userRole(String? value) {
    if (value != null) {
      role = value;
    }
  }



  // receiving data from server
  factory BUserModel.fromMap(map) {
    return BUserModel(
      uid: map['uid'],
      email: map['email'],
      shop_name: map['shop_name'],
      bw_address: map['bw_address'],
       phone: map[' phone'],
      maeruf_code: map['maeruf_code'],
      role: map['role'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'shop_name': shop_name,
      'phone': phone,
      'bw_address': bw_address,
      ' maeruf_code':  maeruf_code,
      'role': role,
    };
  }

/*
  findmaeruf_code(String code) {
     FirebaseFirestore.instance
        .collection('maeruf_code')
        .where('code', isEqualTo: code)
        .snapshots()
        .forEach((snapshot) {
      var i = snapshot.docs.iterator;
      while (i.moveNext()) {
        if (i.current['code'].toString() == code){
          print('here');
        exist = true;
        }
      }
    }).onError((error, stackTrace) {
      print("error" + error.toString());
      exist = false;
    });

     return exist;
  }



  

  Future<void> signUp(String email, String password) async {
    String _message = "";

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection('maeruf_code')
        .where('code', isEqualTo: maeruf_code)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        try {
          FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password)
              .then((value) => {postDetailsToFirestore()});
          authen(email, password);
        } on FirebaseAuthException catch (e) {
          switch (e.code) {
            case "email-already-in-use":
              _message = 'البريد الإلكتروني مستخدم مسبقًا';

              break;
            case "invalid-email":
              _message = 'البديد الإلكتروني غير صالح';

              break;
            case "too-many-requests":
              _message =
                  'يجب على المستخدم إعادة المصادقة قبل تنفيذ هذه العملية';

              break;
            case "operation-not-allowed":
              _message =
                  'يجب على المستخدم إعادة المصادقة قبل تنفيذ هذه العملية';

              break;
            case "network-request-failed":
              _message =
                  'يجب على المستخدم إعادة المصادقة قبل تنفيذ هذه العملية';

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
       

        }
        ;
        if (email.isEmpty && password.isEmpty) {
          _message = "الرجاء إدخال البريد الالكتروني وكلمة السر ";
        } else if (email.isEmpty) {
          _message = " الرجاء إدخال البريد الالكتروني ";
        } else if (password.isEmpty) {
          _message = "الرجاء إدخال كلمة السر ";

          switch ("invalid-email") {
            case "invalid-email":
              _message = 'البريد الالكتروني غير صحيح';
              break;
            case "too-many-requests":
              _message =
                  'يجب على المستخدم إعادة المصادقة قبل تنفيذ هذه العملية';

              break;
            case "operation-not-allowed":
              _message =
                  'يجب على المستخدم إعادة المصادقة قبل تنفيذ هذه العملية';

              break;
            case "network-request-failed":
              _message =
                  'يجب على المستخدم إعادة المصادقة قبل تنفيذ هذه العملية';

              break;
            case "credential-already-in-use":
              _message = 'بيانات الاعتماد هذه مرتبطة بالفعل بحساب مستخدم مختلف';

              break;
            default:
              _message = 'حدث خطأ ما ، أعد المحاولة من فضلك';
              break;
          }
          
        } //end 2ed switch
      } else {
        message = ("كود معروف المدخل غير صالح");
      }
      ;
    }).catchError((error) {
      message = ("كود معروف المدخل غير صالح");
    });
    message = _message;
  }

 

  Future<void> authen(String email, String password) async {
    {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        print(userCredential.user);
        uid = userCredential.user?.uid.toString();
        widget.onSignIn(userCredential.user!);
        //
      } on FirebaseAuthException catch (e) {
   
      }
    }
  } */
  
}
 