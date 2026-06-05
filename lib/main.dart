import 'package:flutter/material.dart';
import 'presentation/views/splash/splash_screen.dart';

void main() {
  runApp(const RedParkingApp());
}

class RedParkingApp extends StatelessWidget {
  const RedParkingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RedParking',
      home: const SplashScreen(),
    );
  }
}
