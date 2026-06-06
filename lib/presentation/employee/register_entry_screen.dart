import 'package:flutter/material.dart';

import '../../data/models/vehicle_model.dart';
import '../../data/repositories/vehicle_repository.dart';

class RegisterEntryScreen extends StatefulWidget {
  const RegisterEntryScreen({super.key});

  @override
  State<RegisterEntryScreen> createState() => _RegisterEntryScreenState();
}

class _RegisterEntryScreenState extends State<RegisterEntryScreen> {
  final plateController = TextEditingController();

  String vehicleType = 'carro';

  String modality = 'hora';

  void save() {
    VehicleRepository.add(
      VehicleModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        plate: plateController.text,
        phone: '',
        type: vehicleType,
        modality: modality,
        entryTime: DateTime.now(),
        status: 'activo',
        parkingId: '1',
        employeeId: '1',
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ingreso')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: plateController,
              decoration: const InputDecoration(labelText: 'Placa'),
            ),

            DropdownButton<String>(
              value: vehicleType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: 'carro', child: Text('Carro')),

                DropdownMenuItem(value: 'moto', child: Text('Moto')),

                DropdownMenuItem(value: 'bicicleta', child: Text('Bicicleta')),
              ],
              onChanged: (value) {
                setState(() {
                  vehicleType = value!;
                });
              },
            ),

            DropdownButton<String>(
              value: modality,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: 'hora', child: Text('Hora')),

                DropdownMenuItem(value: 'dia', child: Text('Día')),

                DropdownMenuItem(value: 'noche', child: Text('Noche')),
              ],
              onChanged: (value) {
                setState(() {
                  modality = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(onPressed: save, child: const Text('Registrar')),
          ],
        ),
      ),
    );
  }
}
