import '../models/vehicle_model.dart';

class VehicleRepository {
  static final List<VehicleModel> vehicles = [];

  static void add(VehicleModel vehicle) {
    vehicles.add(vehicle);
  }

  static List<VehicleModel> getActiveVehicles() {
    return vehicles.where((v) => v.status == 'activo').toList();
  }

  static void update(VehicleModel vehicle) {
    final index = vehicles.indexWhere((v) => v.id == vehicle.id);

    if (index != -1) {
      vehicles[index] = vehicle;
    }
  }
}
