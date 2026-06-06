import 'package:flutter/material.dart';

import '../../data/models/tariff_model.dart';
import '../../data/repositories/tariff_repository.dart';

class TariffScreen extends StatefulWidget {
  const TariffScreen({super.key});

  @override
  State<TariffScreen> createState() => _TariffScreenState();
}

class _TariffScreenState extends State<TariffScreen> {
  final carController = TextEditingController();

  final motoController = TextEditingController();

  final bikeController = TextEditingController();

  final dayController = TextEditingController();

  final nightController = TextEditingController();

  final monthlyController = TextEditingController();

  void save() {
    TariffRepository.save(
      TariffModel(
        parkingId: "1",
        carHour: double.parse(carController.text),
        motoHour: double.parse(motoController.text),
        bikeHour: double.parse(bikeController.text),
        day: double.parse(dayController.text),
        night: double.parse(nightController.text),
        monthly: double.parse(monthlyController.text),
      ),
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Tarifas guardadas')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurar Tarifas')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: carController,
              decoration: const InputDecoration(labelText: 'Carro por Hora'),
            ),

            TextField(
              controller: motoController,
              decoration: const InputDecoration(labelText: 'Moto por Hora'),
            ),

            TextField(
              controller: bikeController,
              decoration: const InputDecoration(
                labelText: 'Bicicleta por Hora',
              ),
            ),

            TextField(
              controller: dayController,
              decoration: const InputDecoration(labelText: 'Tarifa Día'),
            ),

            TextField(
              controller: nightController,
              decoration: const InputDecoration(labelText: 'Tarifa Noche'),
            ),

            TextField(
              controller: monthlyController,
              decoration: const InputDecoration(labelText: 'Mensualidad'),
            ),

            const SizedBox(height: 25),

            ElevatedButton(onPressed: save, child: const Text('Guardar')),
          ],
        ),
      ),
    );
  }
}
