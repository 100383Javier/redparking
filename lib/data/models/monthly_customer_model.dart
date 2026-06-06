class MonthlyCustomerModel {
  final String id;
  final String plate;
  final String ownerName;
  final String phone;

  final DateTime startDate;
  DateTime lastPayment;
  DateTime nextPayment;

  final double monthlyValue;

  String status; // active, suspended

  final String parkingId;

  MonthlyCustomerModel({
    required this.id,
    required this.plate,
    required this.ownerName,
    required this.phone,
    required this.startDate,
    required this.lastPayment,
    required this.nextPayment,
    required this.monthlyValue,
    required this.status,
    required this.parkingId,
  });
}
