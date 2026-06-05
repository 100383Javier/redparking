import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/views/splash/splash_screen.dart';
import 'presentation/viewmodels/parking_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ParkingViewModel())],
      child: const RedParkingApp(),
    ),
  );
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
