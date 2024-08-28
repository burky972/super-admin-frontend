import 'package:equatable/equatable.dart';

class UserManagementAddState extends Equatable {
  final String userName;
  final String email;
  final String password;
  final String restaurantAssignment;
  final String role;
  final bool isActive;
  final bool formValid;

  UserManagementAddState({
    this.userName = '',
    this.email = '',
    this.password = '',
    this.restaurantAssignment = '',
    this.role = 'User',
    this.isActive = true,
    this.formValid = false,
  });

  UserManagementAddState copyWith({
    String? userName,
    String? email,
    String? password,
    String? restaurantAssignment,
    String? role,
    bool? isActive,
    bool? formValid,
  }) {
    return UserManagementAddState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      restaurantAssignment: restaurantAssignment ?? this.restaurantAssignment,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      formValid: formValid ?? this.formValid,
    );
  }

  @override
  List<Object> get props => [
        userName,
        email,
        password,
        restaurantAssignment,
        role,
        isActive,
        formValid,
      ];
}