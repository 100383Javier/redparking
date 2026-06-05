import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/parking_viewmodel.dart';
import 'add_parking_screen.dart';

class ParkingListScreen extends StatelessWidget {
  const ParkingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final parkingVM = Provider.of<ParkingViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Parqueaderos")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddParkingScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: parkingVM.parkings.length,
        itemBuilder: (context, index) {
          final parking = parkingVM.parkings[index];

          return ListTile(
            leading: const Icon(Icons.local_parking),
            title: Text(parking.nombre),
            subtitle: Text("${parking.cuposDisponibles} cupos disponibles"),
          );
        },
      ),
    );
  }
}
