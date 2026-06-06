import 'package:flutter/material.dart';

import '../../data/models/monthly_customer_model.dart';
import '../../data/repositories/monthly_customer_repository.dart';

class MonthlyCustomerDetailScreen extends StatefulWidget {
  final MonthlyCustomerModel customer;

  const MonthlyCustomerDetailScreen({super.key, required this.customer});

  @override
  State<MonthlyCustomerDetailScreen> createState() =>
      _MonthlyCustomerDetailScreenState();
}

class _MonthlyCustomerDetailScreenState
    extends State<MonthlyCustomerDetailScreen> {
  void registerPayment() {
    final now = DateTime.now();

    widget.customer.lastPayment = now;

    widget.customer.nextPayment = DateTime(now.year, now.month + 1, now.day);

    widget.customer.status = 'active';

    MonthlyCustomerRepository.update(widget.customer);

    setState(() {});
  }

  void suspend() {
    widget.customer.status = 'suspended';

    MonthlyCustomerRepository.update(widget.customer);

    setState(() {});
  }

  void activate() {
    widget.customer.status = 'active';

    MonthlyCustomerRepository.update(widget.customer);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final customer = widget.customer;

    return Scaffold(
      appBar: AppBar(title: Text(customer.plate)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Propietario: ${customer.ownerName}'),

            Text('Estado: ${customer.status}'),

            Text(
              'Próximo cobro: ${customer.nextPayment.day}/${customer.nextPayment.month}/${customer.nextPayment.year}',
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: registerPayment,
              child: const Text('Registrar Pago'),
            ),

            ElevatedButton(onPressed: suspend, child: const Text('Suspender')),

            ElevatedButton(onPressed: activate, child: const Text('Reactivar')),
          ],
        ),
      ),
    );
  }
}
