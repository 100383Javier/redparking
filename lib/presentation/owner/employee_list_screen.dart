import 'package:flutter/material.dart';

import '../../data/repositories/employee_repository.dart';
import 'create_employee_screen.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  @override
  Widget build(BuildContext context) {
    final employees = EmployeeRepository.getAll();

    return Scaffold(
      appBar: AppBar(title: const Text('Empleados')),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateEmployeeScreen()),
          );

          setState(() {});
        },
      ),

      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final employee = employees[index];

          return Card(
            child: ListTile(
              title: Text(employee.name),

              subtitle: Text(employee.phone),

              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  EmployeeRepository.delete(employee.id);

                  setState(() {});
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
