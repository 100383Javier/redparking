import 'package:flutter/material.dart';

import '../../data/models/employee_model.dart';
import '../../data/repositories/employee_repository.dart';

class CreateEmployeeScreen extends StatefulWidget {
  const CreateEmployeeScreen({super.key});

  @override
  State<CreateEmployeeScreen> createState() => _CreateEmployeeScreenState();
}

class _CreateEmployeeScreenState extends State<CreateEmployeeScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  void saveEmployee() {
    EmployeeRepository.add(
      EmployeeModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: nameController.text,
        phone: phoneController.text,
        username: userController.text,
        password: passwordController.text,
        parkingId: "1",
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Empleado')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),

            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Teléfono'),
            ),

            TextField(
              controller: userController,
              decoration: const InputDecoration(labelText: 'Usuario'),
            ),

            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: saveEmployee,
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
