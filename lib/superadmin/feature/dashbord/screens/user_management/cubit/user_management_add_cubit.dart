import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/cubit/user_management_add_state.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/model/user_model.dart';

class UserManagementAddCubit extends Cubit<UserManagementAddState> {
  UserManagementAddCubit() : super(UserManagementAddState());

  void userNameChanged(String value) {
    emit(state.copyWith(userName: value, formValid: _validateForm()));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value, formValid: _validateForm()));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, formValid: _validateForm()));
  }

  void restaurantAssignmentChanged(String value) {
    emit(state.copyWith(restaurantAssignment: value, formValid: _validateForm()));
  }

  void roleChanged(String value) {
    emit(state.copyWith(role: value));
  }

  void isActiveChanged(bool value) {
    emit(state.copyWith(isActive: value));
  }

  bool _validateForm() {
    return state.userName.isNotEmpty &&
        state.email.isNotEmpty &&
        state.password.isNotEmpty &&
        state.restaurantAssignment.isNotEmpty;
  }

  void submitForm(Function(UserModel) onUserAdded) {
    if (state.formValid) {
      final newUser = UserModel(
        userName: state.userName,
        email: state.email,
        password: state.password,
        restaurantAssignment: state.restaurantAssignment,
        role: state.role,
        isActive: state.isActive,
      );

      onUserAdded(newUser);
    }
  }
}