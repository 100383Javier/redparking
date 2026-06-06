import '../../core/constants/app_routes.dart';

class LoginController {
  String login({required String username, required String password}) {
    if (username == 'admin' && password == '1234') {
      return AppRoutes.superAdmin;
    }

    if (username == 'owner' && password == '1234') {
      return AppRoutes.owner;
    }

    if (username == 'employee' && password == '1234') {
      return AppRoutes.employee;
    }

    if (username == 'client' && password == '1234') {
      return AppRoutes.client;
    }

    throw Exception('Usuario o contraseña incorrectos');
  }
}
