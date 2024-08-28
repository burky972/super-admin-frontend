import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/model/restaurant_model.dart';

class LicenseState extends Equatable {
  final List<Restaurant> filteredRestaurants;
  final Restaurant? selectedRestaurant;

  LicenseState(
      {required this.filteredRestaurants, required this.selectedRestaurant});

  factory LicenseState.initialize() {
    return LicenseState(filteredRestaurants: [], selectedRestaurant: null);
  }

  LicenseState copyWith({
    List<Restaurant>? filteredRestaurants,
    Restaurant? selectedRestaurant,
  }) {
    return LicenseState(
      filteredRestaurants: filteredRestaurants ?? this.filteredRestaurants,
      selectedRestaurant: selectedRestaurant ?? this.selectedRestaurant,
    );
  }

  @override
  List<Object?> get props => [filteredRestaurants, selectedRestaurant];
}

class LicenseCubit extends Cubit<LicenseState> {
  final List<Restaurant> restaurants;

  LicenseCubit(this.restaurants)
      : super(LicenseState(
            filteredRestaurants: restaurants,
            selectedRestaurant:
                restaurants.isNotEmpty ? restaurants[0] : null));

  void updateLicenseEndDate(DateTime newEndDate) {
    if (state.selectedRestaurant != null) {
      final int newDurationDays = newEndDate
          .difference(state.selectedRestaurant!.licenseStartDate)
          .inDays;
      final updatedRestaurant = Restaurant(
        name: state.selectedRestaurant!.name,
        branchCount: state.selectedRestaurant!.branchCount,
        isHeadquarters: state.selectedRestaurant!.isHeadquarters,
        hasMultipleBranches: state.selectedRestaurant!.hasMultipleBranches,
        menuManagement: state.selectedRestaurant!.menuManagement,
        isCentralMenuManagement:
            state.selectedRestaurant!.isCentralMenuManagement,
        isBranchMenuManagement:
            state.selectedRestaurant!.isBranchMenuManagement,
        address: state.selectedRestaurant!.address,
        licenseStartDate: state.selectedRestaurant!.licenseStartDate,
        licenseDurationDays: newDurationDays,
        allowedUserCount: state.selectedRestaurant!.allowedUserCount,
        waiterTerminalCount: state.selectedRestaurant!.waiterTerminalCount,
        isLicenseActive: state.selectedRestaurant!.isLicenseActive,
        licenseCode: state.selectedRestaurant!.licenseCode,
      );

      emit(LicenseState(
        filteredRestaurants: state.filteredRestaurants,
        selectedRestaurant: updatedRestaurant,
      ));
    }
  }

  void filterRestaurants(String query) {
    final filtered = restaurants
        .where((restaurant) => restaurant.name.toLowerCase().contains(query))
        .toList();
    emit(LicenseState(
      filteredRestaurants: filtered,
      selectedRestaurant: filtered.isNotEmpty ? filtered[0] : null,
    ));
  }

  void selectRestaurant(Restaurant? restaurant) {
    emit(LicenseState(
      filteredRestaurants: state.filteredRestaurants,
      selectedRestaurant: restaurant,
    ));
  }
}
