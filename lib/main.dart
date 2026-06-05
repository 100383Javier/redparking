import 'package:flutter/material.dart';

void main() {
  runApp(const RedParkingApp());
}

class RedParkingApp extends StatelessWidget {
  const RedParkingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RedParking',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('RedParking')),
        body: const Center(
          child: Text(
            'Bienvenido a RedParking',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
