import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_task/screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:login_screen_task/screens/profile_screen.dart';
import 'helper/customMaterialColor.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
   // return runApp(MyApp());
  return runApp(
      EasyLocalization(
          path: 'assets/locales',
          supportedLocales: [Locale('en', 'UK'), Locale('ar', 'EG')],
          child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: CustomMaterialColor.generateCustomColor(35, 21, 84),
      ),
      home: LoginScreen(),
      // home: ProfileScreen(),
      routes: {ProfileScreen.route: (ctx) => ProfileScreen()},
    );
  }
}
