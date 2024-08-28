import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/cubit/user_manager_edit_state.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/model/user_model.dart';

class UserManagerEditCubit extends Cubit<UserManagerEditState> {
  UserManagerEditCubit(UserModel user)
      : super(UserManagerEditState(
          userName: user.userName,
          email: user.email,
          password: user.password,
          restaurantAssignment: user.restaurantAssignment,
          role: user.role,
          isActive: user.isActive,
        ));

  void updateUserName(String userName) {
    emit(state.copyWith(userName: userName));
  }

  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void updateRestaurantAssignment(String restaurantAssignment) {
    emit(state.copyWith(restaurantAssignment: restaurantAssignment));
  }

  void updateRole(String role) {
    emit(state.copyWith(role: role));
  }

  void toggleIsActive(bool isActive) {
    emit(state.copyWith(isActive: isActive));
  }

  UserModel getUpdatedUser() {
    return UserModel(
      userName: state.userName,
      email: state.email,
      password: state.password,
      restaurantAssignment: state.restaurantAssignment,
      role: state.role,
      isActive: state.isActive,
    );
  }
}