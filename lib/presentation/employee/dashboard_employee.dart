import 'package:flutter/material.dart';

import 'register_entry_screen.dart';
import 'active_vehicles_screen.dart';
import 'monthly_status_screen.dart';

class DashboardEmployee extends StatelessWidget {
  const DashboardEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel Empleado')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Registrar Entrada'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RegisterEntryScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Vehículos Activos'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ActiveVehiclesScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Consultar Mensualidad'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MonthlyStatusScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
