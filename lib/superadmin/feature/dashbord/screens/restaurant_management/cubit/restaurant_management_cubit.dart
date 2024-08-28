import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/cubit/restaurant_management_state.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/model/restaurant_model.dart';

class RestaurantManagementCubit extends Cubit<RestaurantManagementState> {
  RestaurantManagementCubit()
      : super(RestaurantManagementState(
          restaurants: [
            Restaurant(
              name: 'Restoran Ab',
              branchCount: 33,
              isHeadquarters: true,
              hasMultipleBranches: true,
              branchList: ['Branch 1', 'Branch 2', 'Branch 3'],
              menuManagement: MenuManagement(isCentral: true, isBranch: false),
              isCentralMenuManagement: true,
              isBranchMenuManagement: false,
              address: 'Adres',
              licenseStartDate: DateTime(2024, 1, 1),
              licenseDurationDays: 3653,
              allowedUserCount: 10,
              waiterTerminalCount: 5,
              isLicenseActive: true,
              licenseCode: 'ABC123DEF456GHI789JKL012MNO345',
            ),
            Restaurant(
              name: 'Restoran B',
              branchCount: 5333,
              isHeadquarters: false,
              hasMultipleBranches: true,
              branchList: ['Branch 1', 'Branch 2'],
              menuManagement: MenuManagement(isCentral: true, isBranch: false),
              isCentralMenuManagement: true,
              isBranchMenuManagement: false,
              address: 'Adres',
              licenseStartDate: DateTime(2024, 3, 1),
              licenseDurationDays: 65,
              allowedUserCount: 10,
              waiterTerminalCount: 5,
              isLicenseActive: true,
              licenseCode: 'XYZ678LMN123OPQ456RST789UVW012',
            ),
            Restaurant(
              name: 'Restoran C',
              branchCount: 7,
              isHeadquarters: false,
              hasMultipleBranches: true,
              branchList: ['Branch 1', 'Branch 2'],
              menuManagement: MenuManagement(isCentral: true, isBranch: false),
              isCentralMenuManagement: true,
              isBranchMenuManagement: false,
              address: 'Adres',
              licenseStartDate: DateTime(2022, 3, 1),
              licenseDurationDays: 1365,
              allowedUserCount: 10,
              waiterTerminalCount: 5,
              isLicenseActive: true,
              licenseCode: 'LMN456XYZ789RST012OPQ345UVW678',
            ),
          ],
        ));

  void toggleSelection(int index) {
    final selectedRestaurants = Set<int>.from(state.selectedRestaurants);
    if (selectedRestaurants.contains(index)) {
      selectedRestaurants.remove(index);
    } else {
      selectedRestaurants.add(index);
    }
    emit(state.copyWith(selectedRestaurants: selectedRestaurants));
  }

  void deleteSelected() {
    final selectedIndices = state.selectedRestaurants.toList()
      ..sort((a, b) => b.compareTo(a));
    final updatedRestaurants = List<Restaurant>.from(state.restaurants);
    for (final index in selectedIndices) {
      updatedRestaurants.removeAt(index);
    }
    emit(state.copyWith(
      restaurants: updatedRestaurants,
      selectedRestaurants: {},
    ));
  }

  void addRestaurant(Restaurant restaurant) {
    final updatedRestaurants = List<Restaurant>.from(state.restaurants)
      ..add(restaurant);
    emit(state.copyWith(restaurants: updatedRestaurants));
  }

  void updateRestaurant(int index, Restaurant updatedRestaurant) {
    final updatedRestaurants = List<Restaurant>.from(state.restaurants);
    updatedRestaurants[index] = updatedRestaurant;
    emit(state.copyWith(restaurants: updatedRestaurants));
  }
}
