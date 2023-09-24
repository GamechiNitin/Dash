import 'package:dash/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'view/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
