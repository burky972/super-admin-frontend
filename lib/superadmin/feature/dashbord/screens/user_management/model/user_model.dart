class UserModel {
  String userName;
  String email;
  String password;
  String restaurantAssignment;
  String role;
  bool isActive;

  UserModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.restaurantAssignment,
    required this.role,
    required this.isActive,
  });
}
