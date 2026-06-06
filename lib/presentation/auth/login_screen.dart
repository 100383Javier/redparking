import 'package:flutter/material.dart';

import '../../core/constants/app_routes.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = LoginController();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    try {
      final route = controller.login(
        username: usernameController.text,
        password: passwordController.text,
      );

      Navigator.pushReplacementNamed(context, route);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RedParking')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Usuario'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: login, child: const Text('Ingresar')),
          ],
        ),
      ),
    );
  }
}
