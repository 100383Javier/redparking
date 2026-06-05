import 'package:flutter/material.dart';
import '../../domain/entities/parking.dart';

class ParkingViewModel extends ChangeNotifier {
  final List<Parking> _parkings = [
    Parking(
      id: "1",
      nombre: "Parqueadero Centro",
      direccion: "Centro",
      cuposDisponibles: 20,
      tarifaHora: 3000,
    ),

    Parking(
      id: "2",
      nombre: "Parqueadero Norte",
      direccion: "Norte",
      cuposDisponibles: 15,
      tarifaHora: 3500,
    ),
  ];

  List<Parking> get parkings => _parkings;

  void agregarParking(Parking parking) {
    _parkings.add(parking);
    notifyListeners();
  }
}
