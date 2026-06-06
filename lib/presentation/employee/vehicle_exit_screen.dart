import 'package:flutter/material.dart';

import '../../data/models/vehicle_model.dart';
import '../../data/repositories/tariff_repository.dart';
import '../../data/repositories/vehicle_repository.dart';

class VehicleExitScreen extends StatefulWidget {
  final VehicleModel vehicle;

  const VehicleExitScreen({super.key, required this.vehicle});

  @override
  State<VehicleExitScreen> createState() => _VehicleExitScreenState();
}

class _VehicleExitScreenState extends State<VehicleExitScreen> {
  double total = 0;

  @override
  void initState() {
    super.initState();
    calculate();
  }

  void calculate() {
    final tariff = TariffRepository.get();

    if (tariff == null) return;

    final hours = DateTime.now().difference(widget.vehicle.entryTime).inHours;

    switch (widget.vehicle.type) {
      case 'carro':
        total = (hours == 0 ? 1 : hours) * tariff.carHour;
        break;

      case 'moto':
        total = (hours == 0 ? 1 : hours) * tariff.motoHour;
        break;

      case 'bicicleta':
        total = (hours == 0 ? 1 : hours) * tariff.bikeHour;
        break;
    }
  }

  void finish() {
    widget.vehicle.exitTime = DateTime.now();

    widget.vehicle.totalValue = total;

    final updatedVehicle = VehicleModel(
      id: widget.vehicle.id,
      plate: widget.vehicle.plate,
      phone: widget.vehicle.phone,
      type: widget.vehicle.type,
      modality: widget.vehicle.modality,
      entryTime: widget.vehicle.entryTime,
      exitTime: widget.vehicle.exitTime,
      totalValue: widget.vehicle.totalValue,
      status: 'finalizado',
      parkingId: widget.vehicle.parkingId,
      employeeId: widget.vehicle.employeeId,
    );

    VehicleRepository.update(updatedVehicle);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Salida')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Placa: ${widget.vehicle.plate}'),

            const SizedBox(height: 10),

            Text('Cobro: \$${total.toStringAsFixed(0)}'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: finish,
              child: const Text('Confirmar Salida'),
            ),
          ],
        ),
      ),
    );
  }
}
