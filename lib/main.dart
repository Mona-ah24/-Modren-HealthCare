import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:healthcare/FirstPage.dart';

import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
return Directionality(
  textDirection: TextDirection.rtl, 
  child: MaterialApp(
  locale: const Locale('ar', 'EG'), // اللغة العربية
  supportedLocales: const [
    Locale('en', 'US'),
    Locale('ar', 'EG'),
  ],
   localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  debugShowCheckedModeBanner: false, 
  home: FirstPage(),
)
);
  }
}
