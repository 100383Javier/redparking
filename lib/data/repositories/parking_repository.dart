import '../models/parking_model.dart';

class ParkingRepository {
  static final List<ParkingModel> parkings = [];

  static void addParking(ParkingModel parking) {
    parkings.add(parking);
  }

  static List<ParkingModel> getAll() {
    return parkings;
  }

  static void toggleStatus(String id) {
    final index = parkings.indexWhere((parking) => parking.id == id);

    if (index != -1) {
      final parking = parkings[index];

      parkings[index] = ParkingModel(
        id: parking.id,
        name: parking.name,
        nit: parking.nit,
        address: parking.address,
        capacity: parking.capacity,
        plan: parking.plan,
        isActive: !parking.isActive,
      );
    }
  }
}
