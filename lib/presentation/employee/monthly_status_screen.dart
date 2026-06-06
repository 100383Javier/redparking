import 'package:flutter/material.dart';

import '../../data/repositories/monthly_customer_repository.dart';

class MonthlyStatusScreen extends StatefulWidget {
  const MonthlyStatusScreen({super.key});

  @override
  State<MonthlyStatusScreen> createState() => _MonthlyStatusScreenState();
}

class _MonthlyStatusScreenState extends State<MonthlyStatusScreen> {
  final plateController = TextEditingController();

  String result = '';

  void search() {
    final customer = MonthlyCustomerRepository.findByPlate(
      plateController.text,
    );

    if (customer == null) {
      result = 'No existe mensualidad';
    } else {
      result =
          'Estado: ${customer.status}\nPróximo pago: ${customer.nextPayment.day}/${customer.nextPayment.month}/${customer.nextPayment.year}';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consultar Mensualidad')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: plateController,
              decoration: const InputDecoration(labelText: 'Placa'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(onPressed: search, child: const Text('Buscar')),

            const SizedBox(height: 20),

            Text(result),
          ],
        ),
      ),
    );
  }
}
