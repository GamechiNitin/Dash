import 'package:dash/utils/theme.dart';
import 'package:flutter/material.dart';
import 'view/splash_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dash',
      theme: AppTheme.lightTheme(),
      // debugShowCheckedModeBanner: kDebugMode,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
