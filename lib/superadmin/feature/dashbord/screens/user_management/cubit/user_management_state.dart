import 'package:equatable/equatable.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/model/user_model.dart';

class UserManagementState extends Equatable {
  final List<UserModel> users;
  final Set<int> selectedUsers;

  UserManagementState({
    required this.users,
    required this.selectedUsers,
  });

  @override
  List<Object?> get props => [users, selectedUsers];

  factory UserManagementState.initial() {
    return UserManagementState(
      users: [],
      selectedUsers: {},
    );
  }

  UserManagementState copyWith({
    List<UserModel>? users,
    Set<int>? selectedUsers,
  }) {
    return UserManagementState(
      users: users ?? this.users,
      selectedUsers: selectedUsers ?? this.selectedUsers,
    );
  }
}