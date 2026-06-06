import 'package:flutter/material.dart';

import '../../data/repositories/parking_repository.dart';
import 'create_parking_screen.dart';

class DashboardSuperAdmin extends StatefulWidget {
  const DashboardSuperAdmin({super.key});

  @override
  State<DashboardSuperAdmin> createState() => _DashboardSuperAdminState();
}

class _DashboardSuperAdminState extends State<DashboardSuperAdmin> {
  @override
  Widget build(BuildContext context) {
    final parkings = ParkingRepository.getAll();

    return Scaffold(
      appBar: AppBar(title: const Text('Super Admin')),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateParkingScreen()),
          );

          setState(() {});
        },
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: parkings.length,
        itemBuilder: (context, index) {
          final parking = parkings[index];

          return Card(
            child: ListTile(
              title: Text(parking.name),

              subtitle: Text(
                '${parking.plan} | Capacidad: ${parking.capacity}',
              ),

              trailing: Switch(
                value: parking.isActive,
                onChanged: (_) {
                  ParkingRepository.toggleStatus(parking.id);

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
