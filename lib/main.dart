import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Add this import for localization delegates
import 'package:healthcare/FirstPage.dart';

void main() {
  runApp(const MyApp());
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
  localizationsDelegates: [
    // هذه ضرورية لدعم النصوص والاتجاه
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
