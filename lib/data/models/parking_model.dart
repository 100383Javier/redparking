class ParkingModel {
  final String id;
  final String name;
  final String nit;
  final String address;
  final int capacity;
  final String plan;
  final bool isActive;

  ParkingModel({
    required this.id,
    required this.name,
    required this.nit,
    required this.address,
    required this.capacity,
    required this.plan,
    required this.isActive,
  });
}
