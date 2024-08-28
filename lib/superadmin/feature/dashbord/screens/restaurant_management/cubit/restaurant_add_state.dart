import 'dart:math';
import 'package:equatable/equatable.dart';

class RestaurantState extends Equatable {
  final String name;
  final String branchCount;
  final bool isHeadquarters;
  final bool hasMultipleBranches;
  final String address;
  final String licenseStartDate;
  final String licenseDurationDays;
  final String allowedUserCount;
  final String waiterTerminalCount;
  final bool isCentralMenuManagement;
  final bool isBranchMenuManagement;
  final bool isLicenseActive;
  final String licenseCode;

  RestaurantState({
    this.name = '',
    this.branchCount = '',
    this.isHeadquarters = false,
    this.hasMultipleBranches = false,
    this.address = '',
    this.licenseStartDate = '',
    this.licenseDurationDays = '',
    this.allowedUserCount = '',
    this.waiterTerminalCount = '',
    this.isCentralMenuManagement = false,
    this.isBranchMenuManagement = false,
    this.isLicenseActive = false,
    String? licenseCode,
  }) : licenseCode = licenseCode ?? _generateLicenseCode();

  static String _generateLicenseCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return String.fromCharCodes(Iterable.generate(
      26,
      (_) => chars.codeUnitAt(Random().nextInt(chars.length)),
    ));
  }
  
  RestaurantState copyWith({
    String? name,
    String? branchCount,
    bool? isHeadquarters,
    bool? hasMultipleBranches,
    String? address,
    String? licenseStartDate,
    String? licenseDurationDays,
    String? allowedUserCount,
    String? waiterTerminalCount,
    bool? isCentralMenuManagement,
    bool? isBranchMenuManagement,
    bool? isLicenseActive,
    String? licenseCode,
  }) {
    return RestaurantState(
      name: name ?? this.name,
      branchCount: branchCount ?? this.branchCount,
      isHeadquarters: isHeadquarters ?? this.isHeadquarters,
      hasMultipleBranches: hasMultipleBranches ?? this.hasMultipleBranches,
      address: address ?? this.address,
      licenseStartDate: licenseStartDate ?? this.licenseStartDate,
      licenseDurationDays: licenseDurationDays ?? this.licenseDurationDays,
      allowedUserCount: allowedUserCount ?? this.allowedUserCount,
      waiterTerminalCount: waiterTerminalCount ?? this.waiterTerminalCount,
      isCentralMenuManagement:
          isCentralMenuManagement ?? this.isCentralMenuManagement,
      isBranchMenuManagement:
          isBranchMenuManagement ?? this.isBranchMenuManagement,
      isLicenseActive: isLicenseActive ?? this.isLicenseActive,
      licenseCode: licenseCode ?? this.licenseCode,
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
        licenseCode,
      ];
}
