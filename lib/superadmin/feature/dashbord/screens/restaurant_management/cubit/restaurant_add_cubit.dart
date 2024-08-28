import 'package:bloc/bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/cubit/restaurant_add_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit() : super(RestaurantState());

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updateBranchCount(String branchCount) {
    emit(state.copyWith(branchCount: branchCount));
  }

  void toggleIsHeadquarters() {
    emit(state.copyWith(isHeadquarters: !state.isHeadquarters));
  }

  void toggleHasMultipleBranches() {
    emit(state.copyWith(hasMultipleBranches: !state.hasMultipleBranches));
  }

  void updateAddress(String address) {
    emit(state.copyWith(address: address));
  }

  void updateLicenseStartDate(String licenseStartDate) {
    emit(state.copyWith(licenseStartDate: licenseStartDate));
  }

  void updateLicenseDurationDays(String licenseDurationDays) {
    emit(state.copyWith(licenseDurationDays: licenseDurationDays));
  }

  void updateAllowedUserCount(String allowedUserCount) {
    emit(state.copyWith(allowedUserCount: allowedUserCount));
  }

  void updateWaiterTerminalCount(String waiterTerminalCount) {
    emit(state.copyWith(waiterTerminalCount: waiterTerminalCount));
  }

  void toggleIsCentralMenuManagement() {
    emit(state.copyWith(isCentralMenuManagement: !state.isCentralMenuManagement));
  }

  void toggleIsBranchMenuManagement() {
    emit(state.copyWith(isBranchMenuManagement: !state.isBranchMenuManagement));
  }

  void toggleIsLicenseActive() {
    emit(state.copyWith(isLicenseActive: !state.isLicenseActive));
  }
}
