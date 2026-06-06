import 'package:flutter/material.dart';

import '../../data/repositories/monthly_customer_repository.dart';
import 'create_monthly_customer_screen.dart';
import 'monthly_customer_detail_screen.dart';

class MonthlyCustomerListScreen extends StatefulWidget {
  const MonthlyCustomerListScreen({super.key});

  @override
  State<MonthlyCustomerListScreen> createState() =>
      _MonthlyCustomerListScreenState();
}

class _MonthlyCustomerListScreenState extends State<MonthlyCustomerListScreen> {
  @override
  Widget build(BuildContext context) {
    final customers = MonthlyCustomerRepository.getAll();

    return Scaffold(
      appBar: AppBar(title: const Text('Mensualidades')),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CreateMonthlyCustomerScreen(),
            ),
          );

          setState(() {});
        },
      ),

      body: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];

          return Card(
            child: ListTile(
              title: Text(customer.plate),

              subtitle: Text(customer.ownerName),

              trailing: Text(customer.status),

              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        MonthlyCustomerDetailScreen(customer: customer),
                  ),
                );

                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}
