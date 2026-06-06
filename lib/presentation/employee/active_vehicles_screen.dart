import 'package:flutter/material.dart';

import '../../data/repositories/vehicle_repository.dart';
import 'vehicle_exit_screen.dart';

class ActiveVehiclesScreen extends StatefulWidget {
  const ActiveVehiclesScreen({super.key});

  @override
  State<ActiveVehiclesScreen> createState() => _ActiveVehiclesScreenState();
}

class _ActiveVehiclesScreenState extends State<ActiveVehiclesScreen> {
  @override
  Widget build(BuildContext context) {
    final vehicles = VehicleRepository.getActiveVehicles();

    return Scaffold(
      appBar: AppBar(title: const Text('Vehículos Activos')),
      body: ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];

          return ListTile(
            title: Text(vehicle.plate),

            subtitle: Text(vehicle.type),

            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VehicleExitScreen(vehicle: vehicle),
                ),
              );

              setState(() {});
            },
          );
        },
      ),
    );
  }
}
