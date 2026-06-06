import 'package:flutter/material.dart';

import 'core/constants/app_routes.dart';

import 'presentation/auth/login_screen.dart';

import 'presentation/super_admin/dashboard_super_admin.dart';
import 'presentation/owner/dashboard_owner.dart';
import 'presentation/employee/dashboard_employee.dart';
import 'presentation/client/dashboard_client.dart';

void main() {
  runApp(const RedParkingApp());
}

class RedParkingApp extends StatelessWidget {
  const RedParkingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RedParking',
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (_) => const LoginScreen(),
        AppRoutes.superAdmin: (_) => const DashboardSuperAdmin(),
        AppRoutes.owner: (_) => const DashboardOwner(),
        AppRoutes.employee: (_) => const DashboardEmployee(),
        AppRoutes.client: (_) => const DashboardClient(),
      },
    );
  }
}
