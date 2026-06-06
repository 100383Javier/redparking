import '../models/monthly_customer_model.dart';

class MonthlyCustomerRepository {
  static final List<MonthlyCustomerModel> customers = [];

  static void add(MonthlyCustomerModel customer) {
    customers.add(customer);
  }

  static List<MonthlyCustomerModel> getAll() {
    return customers;
  }

  static MonthlyCustomerModel? findByPlate(String plate) {
    try {
      return customers.firstWhere(
        (c) => c.plate.toUpperCase() == plate.toUpperCase(),
      );
    } catch (_) {
      return null;
    }
  }

  static void update(MonthlyCustomerModel customer) {
    final index = customers.indexWhere((c) => c.id == customer.id);

    if (index != -1) {
      customers[index] = customer;
    }
  }
}
