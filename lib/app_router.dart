import 'package:flutter/material.dart';
import 'package:saba_lab444/screen/admin/admin_main_screen.dart';
import 'package:saba_lab444/screen/business/business_home_screen.dart';
import 'package:saba_lab444/screen/business/business_main_screen.dart';
import 'package:saba_lab444/screen/business/registeration_complete_msg_screen.dart';
import 'package:saba_lab444/screen/customer/customer_main_screen.dart';
import 'package:saba_lab444/screen/business/business_profile.dart';
import 'package:saba_lab444/screen/customer/customer_home_screen.dart';
import 'package:saba_lab444/screen/customer/profile_customer.dart';
import 'package:saba_lab444/screen/customerShop_view.dart';
import 'package:saba_lab444/screen/general/first_screen.dart';
import 'package:saba_lab444/screen/general/login_screen.dart';
import 'package:saba_lab444/screen/general/singup_screen.dart';
import 'package:saba_lab444/screen/productDetails_view.dart';
import 'package:saba_lab444/screen/splash_screen.dart';
import 'screen/admin/admin_home_screen.dart';
import 'screen/business/product_detail_business_screen.dart';
import 'screen/business/registeration_complete_msg_screen.dart';
import 'screen/productDetails_view.dart';

class PageViewTransition<T> extends MaterialPageRoute<T> {
  PageViewTransition({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
//    if (settings.isInitialRoute) return child;
    if (animation.status == AnimationStatus.reverse) {
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    }
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(-1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
    // return FadeTransition(opacity: animation, child: child);
  }
}

class AppRoute {
  static const String splashScreen = '/';
  static const String firstScreen = '/first';
  static const String businessHomeScreen = '/businessHome';
  static const String customerHomeScreen = '/customerHome';
  static const String adminHomeScreen = '/adminHome';
  static const String signUpScreen = '/signUp';
  static const String loginScreen = '/login';
  static const String bProfileScreen = '/bProfile';
  static const String cProfileScreen = '/cProfile';
  static const String businessMainScreen = '/businessMain';
  static const String customerMainScreen = '/customerMain';
  static const String adminMainScreen = '/adminMainScreen';
  static const String productDetailBusinessScreen = '/productDetailBusiness';
  static const String csshopview = '/csshopview';
  static const String productDetails = '/productDetails';
  static const String registerComplete = '/RegisterComplete';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return PageViewTransition(builder: (_) => const SplashScreen());
      case firstScreen:
        return PageViewTransition(builder: (_) => const FirstScreen());
      case businessHomeScreen:
        return PageViewTransition(builder: (_) => const BusinessHomeScreen());
      case customerHomeScreen:
        return PageViewTransition(builder: (_) => const CustomerHomeScreen());
      case adminHomeScreen:
        return PageViewTransition(builder: (_) => const AdminHomeScreen());
      case signUpScreen:
        return PageViewTransition(builder: (_) => const SignUpScreen());
      case loginScreen:
        return PageViewTransition(builder: (_) => const LoginScreen());
      case bProfileScreen:
        return PageViewTransition(builder: (_) => const BusinessProfile());
      case cProfileScreen:
        return PageViewTransition(builder: (_) => CustomerProfile());
      case productDetailBusinessScreen:
        return PageViewTransition(
            builder: (_) => const ProductDetailBusinessScreen());
      case businessMainScreen:
        return PageViewTransition(builder: (_) => const BusinessMainScreen());
      case customerMainScreen:
        return PageViewTransition(builder: (_) => const CustomerMainScreen());
      case adminMainScreen:
        return PageViewTransition(builder: (_) => const AdminMainScreen());
      case csshopview:
        return PageViewTransition(builder: (_) => const csshopView());
      case productDetails:
        return PageViewTransition(builder: (_) => const ProductDetails());
      case registerComplete:
        return PageViewTransition(builder: (_) => const RegisterComplete());
      default:
        return PageViewTransition(builder: (_) => const SplashScreen());
    }
  }
}
