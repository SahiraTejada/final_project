import 'package:final_project/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'utils/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShopIntec',
      theme: customTheme,
      home: const LoginScreen(),
    );
  }
}
