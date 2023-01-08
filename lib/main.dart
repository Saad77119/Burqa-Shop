import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:saba_lab444/providers/auth_provider.dart';
import 'package:saba_lab444/providers/business_provider.dart';
import 'package:saba_lab444/screen/business/registeration_complete_msg_screen.dart';
import 'app_router.dart';
import 'locator.dart';
import 'providers/admin_provider.dart';
import 'providers/customer_provider.dart';
import 'services/navigation_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
        apiKey: "AIzaSyAfNkV0fMgHcLMeKgx8r3o5og4v_2NvDDM",
        appId: "1:615954959577:ios:a0e933111cece97cb882c8",
        projectId: "g2sanaah-127e2",
        storageBucket: "g2sanaah-127e2.appspot.com",
        messagingSenderId: "868713041881"),
  );
  runApp(MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BusinessProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdminProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Sanaah',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade100,
          primarySwatch: Colors.blueGrey,
        ),
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        initialRoute: AppRoute.splashScreen,
        onGenerateRoute: AppRoute.generateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 1200)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.black
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..dismissOnTap = false
    ..userInteractions = false;
  // ..customAnimation = CustomAnimation();
}
