class Validations {
  String? validate(int decide, String value) {
    switch (decide) {
      case 0:
        // Simple
        return validateSimple(value);
      case 1:
        // Email
        return validateEmail(value);
      case 2:
        // Password
        return validatePassword(value);
      case 3:
        // Name
        return validateName(value);
      case 4:
        // Mobile
        return validateMobile(value);
      case 5:
        // Price
        return validatePrice(value);
      case 6:
        // ConfirmPassword
        return validateConPassworde(value);
      default:
        return null;
    }
  }

  String? validateName(String value) {
    if (value.isEmpty) return 'الاسم مطلوب';
    final RegExp nameExp = RegExp(r'^[A-za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'الرجاء إدخال الأحرف الأبجدية فقط.';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
          return ("الرجاء قم بإدخال بريد إلكتروني");
        }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value)) {
      return 'البريد الإلكتروني غير صحيح';
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    RegExp regex = new RegExp(r'^.{8,}$');
        if (value.isEmpty || value.trim().isEmpty) {
          return ("الرجاء تعيين كلمة مرور");
        }
        if (!regex.hasMatch(value)) {
          return ("يجب أن تحتوي على 8 رموز او أكثر");
        }
    return null;
  }

  String? validateSimple(String value) {
    if (value.isEmpty) return "لا يمكن ان يكون الحقل فارغا";
    return null;
  }

  String? validateMobile(String value) {
    RegExp regex = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    if (value.isEmpty || value.trim().isEmpty) {
      return ("الرجاء إدخال رقم الجوال ");
    }
    if (!regex.hasMatch(value)) {
      return ("رقم الجوال المدخل غير صحيح");
    }
    if (value.length < 10) {
      return ("رقم الجوال المدخل غير صحيح");
    }
    return null;
  }

  String? validatePrice(String value) {
    if (value.isEmpty) {
      return 'يجب ادخال السعر';
    } else if (double.parse(value) < 90) {
      return 'Price must be greater than \$90';
    } else {
      return null;
    }
  }


  String? validateConPassworde(String value) {
    RegExp regex = new RegExp(r'^.{8,}$');
        if (value.isEmpty || value.trim().isEmpty) {
          return ("الرجاء تعيين كلمة مرور");
        }
        if (!regex.hasMatch(value)) {
          return ("يجب أن تحتوي على 8 رموز او أكثر");
        }
        // if (passwordTec.text != password2Tec.text ) {
          //return "كلمة المرور مختلفة*";
        //}
       
    return null;
  }
}
