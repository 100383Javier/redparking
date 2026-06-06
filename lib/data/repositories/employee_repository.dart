import '../models/employee_model.dart';

class EmployeeRepository {
  static final List<EmployeeModel> employees = [];

  static void add(EmployeeModel employee) {
    employees.add(employee);
  }

  static List<EmployeeModel> getAll() {
    return employees;
  }

  static void delete(String id) {
    employees.removeWhere((employee) => employee.id == id);
  }
}
