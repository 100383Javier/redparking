import 'package:flutter/material.dart';

import '../../data/models/parking_model.dart';
import '../../data/repositories/parking_repository.dart';

class CreateParkingScreen extends StatefulWidget {
  const CreateParkingScreen({super.key});

  @override
  State<CreateParkingScreen> createState() => _CreateParkingScreenState();
}

class _CreateParkingScreenState extends State<CreateParkingScreen> {
  final nameController = TextEditingController();
  final nitController = TextEditingController();
  final addressController = TextEditingController();
  final capacityController = TextEditingController();

  String selectedPlan = 'Mensual';

  void saveParking() {
    final parking = ParkingModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: nameController.text,
      nit: nitController.text,
      address: addressController.text,
      capacity: int.parse(capacityController.text),
      plan: selectedPlan,
      isActive: true,
    );

    ParkingRepository.addParking(parking);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Parqueadero')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),

            TextField(
              controller: nitController,
              decoration: const InputDecoration(labelText: 'NIT'),
            ),

            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Dirección'),
            ),

            TextField(
              controller: capacityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Capacidad'),
            ),

            const SizedBox(height: 20),

            DropdownButton<String>(
              value: selectedPlan,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: 'Mensual', child: Text('Mensual')),
                DropdownMenuItem(value: 'Comisión', child: Text('Comisión')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedPlan = value!;
                });
              },
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: saveParking,
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
