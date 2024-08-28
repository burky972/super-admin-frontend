import 'package:bloc/bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/cubit/user_management_header_state.dart';

class UserManagementHeaderCubit extends Cubit<UserManagementHeaderState> {
  UserManagementHeaderCubit() : super(UserManagementHeaderInitial());

  void userAdded() {
    emit(UserManagementHeaderUpdated(isUserAdded: true));
  }

  void resetState() {
    emit(UserManagementHeaderInitial());
  }
}