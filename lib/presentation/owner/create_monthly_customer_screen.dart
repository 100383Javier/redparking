import 'package:flutter/material.dart';

import '../../data/models/monthly_customer_model.dart';
import '../../data/repositories/monthly_customer_repository.dart';

class CreateMonthlyCustomerScreen extends StatefulWidget {
  const CreateMonthlyCustomerScreen({super.key});

  @override
  State<CreateMonthlyCustomerScreen> createState() =>
      _CreateMonthlyCustomerScreenState();
}

class _CreateMonthlyCustomerScreenState
    extends State<CreateMonthlyCustomerScreen> {
  final plateController = TextEditingController();

  final ownerController = TextEditingController();

  final phoneController = TextEditingController();

  final valueController = TextEditingController();

  void save() {
    final now = DateTime.now();

    MonthlyCustomerRepository.add(
      MonthlyCustomerModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        plate: plateController.text,
        ownerName: ownerController.text,
        phone: phoneController.text,
        startDate: now,
        lastPayment: now,
        nextPayment: DateTime(now.year, now.month + 1, now.day),
        monthlyValue: double.parse(valueController.text),
        status: 'active',
        parkingId: '1',
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva Mensualidad')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: plateController,
              decoration: const InputDecoration(labelText: 'Placa'),
            ),

            TextField(
              controller: ownerController,
              decoration: const InputDecoration(labelText: 'Propietario'),
            ),

            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Teléfono'),
            ),

            TextField(
              controller: valueController,
              decoration: const InputDecoration(labelText: 'Valor Mensualidad'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(onPressed: save, child: const Text('Guardar')),
          ],
        ),
      ),
    );
  }
}
