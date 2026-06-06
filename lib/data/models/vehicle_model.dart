class VehicleModel {
  final String id;
  final String plate;
  final String phone;
  final String type; // carro, moto, bicicleta
  final String modality; // hora, dia, noche

  final DateTime entryTime;
  DateTime? exitTime;

  double? totalValue;

  final String status; // activo, finalizado

  final String parkingId;
  final String employeeId;

  VehicleModel({
    required this.id,
    required this.plate,
    required this.phone,
    required this.type,
    required this.modality,
    required this.entryTime,
    this.exitTime,
    this.totalValue,
    required this.status,
    required this.parkingId,
    required this.employeeId,
  });
}
