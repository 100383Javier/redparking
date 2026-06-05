import 'package:flutter/material.dart';
import '../../domain/entities/parking.dart';

class ParkingViewModel extends ChangeNotifier {
  final List<Parking> _parkings = [];

  List<Parking> get parkings => _parkings;

  void agregarParking(Parking parking) {
    _parkings.add(parking);
    notifyListeners();
  }
}
