import 'package:equatable/equatable.dart';

class UserManagerEditState extends Equatable {
  final String userName;
  final String email;
  final String password;
  final String restaurantAssignment;
  final String role;
  final bool isActive;

  const UserManagerEditState({
    required this.userName,
    required this.email,
    required this.password,
    required this.restaurantAssignment,
    required this.role,
    required this.isActive,
  });

  UserManagerEditState copyWith({
    String? userName,
    String? email,
    String? password,
    String? restaurantAssignment,
    String? role,
    bool? isActive,
  }) {
    return UserManagerEditState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      restaurantAssignment: restaurantAssignment ?? this.restaurantAssignment,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
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
      ];
}