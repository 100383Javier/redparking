import '../models/tariff_model.dart';

class TariffRepository {
  static TariffModel? tariff;

  static void save(TariffModel value) {
    tariff = value;
  }

  static TariffModel? get() {
    return tariff;
  }
}
