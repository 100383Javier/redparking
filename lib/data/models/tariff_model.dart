class TariffModel {
  final String parkingId;

  final double carHour;
  final double motoHour;
  final double bikeHour;

  final double day;
  final double night;

  final double monthly;

  TariffModel({
    required this.parkingId,
    required this.carHour,
    required this.motoHour,
    required this.bikeHour,
    required this.day,
    required this.night,
    required this.monthly,
  });
}
