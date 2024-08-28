import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/model/restaurant_model.dart';

import 'package:equatable/equatable.dart';

class EditRestaurantState extends Equatable {
  final String name;
  final int branchCount;
  final bool isHeadquarters;
  final bool hasMultipleBranches;
  final String address;
  final DateTime licenseStartDate;
  final int licenseDurationDays;
  final int allowedUserCount;
  final int waiterTerminalCount;
  final bool isCentralMenuManagement;
  final bool isBranchMenuManagement;
  final bool isLicenseActive;
  final bool saved;
  final Restaurant restaurant;

  const EditRestaurantState({
    required this.name,
    required this.branchCount,
    required this.isHeadquarters,
    required this.hasMultipleBranches,
    required this.address,
    required this.licenseStartDate,
    required this.licenseDurationDays,
    required this.allowedUserCount,
    required this.waiterTerminalCount,
    required this.isCentralMenuManagement,
    required this.isBranchMenuManagement,
    required this.isLicenseActive,
    required this.saved,
    required this.restaurant,
  });

  factory EditRestaurantState.initial(Restaurant restaurant) {
    return EditRestaurantState(
      name: restaurant.name,
      branchCount: restaurant.branchCount,
      isHeadquarters: restaurant.isHeadquarters,
      hasMultipleBranches: restaurant.hasMultipleBranches,
      address: restaurant.address,
      licenseStartDate: restaurant.licenseStartDate,
      licenseDurationDays: restaurant.licenseDurationDays,
      allowedUserCount: restaurant.allowedUserCount,
      waiterTerminalCount: restaurant.waiterTerminalCount,
      isCentralMenuManagement: restaurant.menuManagement.isCentral,
      isBranchMenuManagement: restaurant.menuManagement.isBranch,
      isLicenseActive: restaurant.isLicenseActive,
      saved: false,
      restaurant: restaurant,
    );
  }

  EditRestaurantState copyWith({
    String? name,
    int? branchCount,
    bool? isHeadquarters,
    bool? hasMultipleBranches,
    String? address,
    DateTime? licenseStartDate,
    int? licenseDurationDays,
    int? allowedUserCount,
    int? waiterTerminalCount,
    bool? isCentralMenuManagement,
    bool? isBranchMenuManagement,
    bool? isLicenseActive,
    bool? saved,
    Restaurant? restaurant,
  }) {
    return EditRestaurantState(
      name: name ?? this.name,
      branchCount: branchCount ?? this.branchCount,
      isHeadquarters: isHeadquarters ?? this.isHeadquarters,
      hasMultipleBranches: hasMultipleBranches ?? this.hasMultipleBranches,
      address: address ?? this.address,
      licenseStartDate: licenseStartDate ?? this.licenseStartDate,
      licenseDurationDays: licenseDurationDays ?? this.licenseDurationDays,
      allowedUserCount: allowedUserCount ?? this.allowedUserCount,
      waiterTerminalCount: waiterTerminalCount ?? this.waiterTerminalCount,
      isCentralMenuManagement: isCentralMenuManagement ?? this.isCentralMenuManagement,
      isBranchMenuManagement: isBranchMenuManagement ?? this.isBranchMenuManagement,
      isLicenseActive: isLicenseActive ?? this.isLicenseActive,
      saved: saved ?? this.saved,
      restaurant: restaurant ?? this.restaurant,
    );
  }

  @override
  List<Object?> get props => [
        name,
        branchCount,
        isHeadquarters,
        hasMultipleBranches,
        address,
        licenseStartDate,
        licenseDurationDays,
        allowedUserCount,
        waiterTerminalCount,
        isCentralMenuManagement,
        isBranchMenuManagement,
        isLicenseActive,
        saved,
        restaurant,
      ];
}
