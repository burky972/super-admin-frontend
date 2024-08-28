import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/cubit/user_management_state.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/model/user_model.dart';

class UserManagementCubit extends Cubit<UserManagementState> {
  UserManagementCubit()
      : super(UserManagementState(
          users: [
            UserModel(
              userName: 'ömer',
              email: 'omer@mail.com',
              password: 'sdfsdfdsf',
              restaurantAssignment: 'Restoran A',
              role: 'Admin',
              isActive: true,
            ),
            UserModel(
              userName: 'selim',
              email: 'selim@mail.com',
              password: 'sdfsdfsdfsdf',
              restaurantAssignment: 'Restoran B',
              role: 'Super Admin',
              isActive: true,
            ),
            UserModel(
              userName: 'Ali',
              email: 'ali@mail.com',
              password: 'sdfsdfsd',
              restaurantAssignment: 'Restoran C',
              role: 'User',
              isActive: false,
            ),
            UserModel(
              userName: 'Mehmet',
              email: 'mehmet@mail.com',
              password: 'sdfsdfsdf',
              restaurantAssignment: 'Restoran D',
              role: 'User',
              isActive: false,
            ),
          ],
          selectedUsers: {},
        ));

  void toggleSelection(int index) {
    final selectedUsers = Set<int>.from(state.selectedUsers);
    if (selectedUsers.contains(index)) {
      selectedUsers.remove(index);
    } else {
      selectedUsers.add(index);
    }
    emit(state.copyWith(selectedUsers: selectedUsers));
  }

  void deleteSelectedUsers() {
    final users = state.users
        .where((user) => !state.selectedUsers.contains(state.users.indexOf(user)))
        .toList();
    emit(state.copyWith(users: users, selectedUsers: {}));
  }

  void editUser(UserModel updatedUser, int index) {
    final users = List<UserModel>.from(state.users);
    users[index] = updatedUser;
    emit(state.copyWith(users: users));
  }
}