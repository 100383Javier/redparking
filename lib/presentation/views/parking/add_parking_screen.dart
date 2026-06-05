import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/parking.dart';
import '../../viewmodels/parking_viewmodel.dart';

class AddParkingScreen extends StatefulWidget {
  const AddParkingScreen({super.key});

  @override
  State<AddParkingScreen> createState() => _AddParkingScreenState();
}

class _AddParkingScreenState extends State<AddParkingScreen> {
  final nombreController = TextEditingController();
  final direccionController = TextEditingController();
  final cuposController = TextEditingController();
  final tarifaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nuevo Parqueadero")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: "Nombre",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: direccionController,
              decoration: const InputDecoration(
                labelText: "Dirección",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: cuposController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Cantidad de Cupos",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: tarifaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Tarifa por Hora",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final parking = Parking(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    nombre: nombreController.text,
                    direccion: direccionController.text,
                    cuposDisponibles: int.tryParse(cuposController.text) ?? 0,
                    tarifaHora: double.tryParse(tarifaController.text) ?? 0,
                  );

                  Provider.of<ParkingViewModel>(
                    context,
                    listen: false,
                  ).agregarParking(parking);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Parqueadero registrado correctamente"),
                    ),
                  );

                  Navigator.pop(context);
                },
                child: const Text("Guardar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
