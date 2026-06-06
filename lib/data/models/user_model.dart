class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final String role; // super_admin, owner, employee, client

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });
}
