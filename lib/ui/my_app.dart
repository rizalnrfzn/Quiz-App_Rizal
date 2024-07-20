import 'package:flutter/material.dart';
import 'package:quiz_app/ui/screens/splash_screen.dart';
import 'package:quiz_app/ui/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(context),
      home: const SplashScreen(),
    );
  }
}
