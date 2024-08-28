import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/model/restaurant_model.dart';

class EditRestaurantCubit extends Cubit<Restaurant> {
  EditRestaurantCubit(Restaurant initialRestaurant) : super(initialRestaurant);

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updateBranchCount(int branchCount) {
    emit(state.copyWith(branchCount: branchCount));
  }

  void toggleHeadquarters(bool isHeadquarters) {
    emit(state.copyWith(isHeadquarters: isHeadquarters));
  }

  void toggleMultipleBranches(bool hasMultipleBranches) {
    emit(state.copyWith(hasMultipleBranches: hasMultipleBranches));
  }

  void updateAddress(String address) {
    emit(state.copyWith(address: address));
  }

  void updateLicenseStartDate(DateTime licenseStartDate) {
    emit(state.copyWith(licenseStartDate: licenseStartDate));
  }

  void updateLicenseDurationDays(int licenseDurationDays) {
    emit(state.copyWith(licenseDurationDays: licenseDurationDays));
  }

  void updateAllowedUserCount(int allowedUserCount) {
    emit(state.copyWith(allowedUserCount: allowedUserCount));
  }

  void updateWaiterTerminalCount(int waiterTerminalCount) {
    emit(state.copyWith(waiterTerminalCount: waiterTerminalCount));
  }

  void toggleCentralMenuManagement(bool isCentralMenuManagement) {
    emit(state.copyWith(
      menuManagement: state.menuManagement.copyWith(isCentral: isCentralMenuManagement),
      isCentralMenuManagement: isCentralMenuManagement,
    ));
  }

  void toggleBranchMenuManagement(bool isBranchMenuManagement) {
    emit(state.copyWith(
      menuManagement: state.menuManagement.copyWith(isBranch: isBranchMenuManagement),
      isBranchMenuManagement: isBranchMenuManagement,
    ));
  }

  void toggleLicenseActive(bool isLicenseActive) {
    emit(state.copyWith(isLicenseActive: isLicenseActive));
  }
}
