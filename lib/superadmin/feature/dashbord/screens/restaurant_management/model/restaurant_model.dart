import 'dart:math';

class Restaurant {
  final String name;
  final int branchCount;
  final bool isHeadquarters;
  final bool hasMultipleBranches;
  final List<String>? branchList;
  final MenuManagement menuManagement;
  final bool isCentralMenuManagement;
  final bool isBranchMenuManagement;
  final String address;
  final DateTime licenseStartDate;
  final int licenseDurationDays;
  final int allowedUserCount;
  final int waiterTerminalCount;
  final bool isLicenseActive;
  final String licenseCode;

  Restaurant({
    required this.name,
    required this.branchCount,
    required this.isHeadquarters,
    required this.hasMultipleBranches,
    this.branchList,
    required this.menuManagement,
    required this.isCentralMenuManagement,
    required this.isBranchMenuManagement,
    required this.address,
    required this.licenseStartDate,
    required this.licenseDurationDays,
    required this.allowedUserCount,
    required this.waiterTerminalCount,
    required this.isLicenseActive,
    String? licenseCode,
  }) : licenseCode = licenseCode ?? _generateLicenseCode();

  static String _generateLicenseCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
      26,
      (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
    ));
  }

  DateTime get licenseEndDate =>
      licenseStartDate.add(Duration(days: licenseDurationDays));

  Restaurant copyWith({
    String? name,
    int? branchCount,
    bool? isHeadquarters,
    bool? hasMultipleBranches,
    List<String>? branchList,
    MenuManagement? menuManagement,
    bool? isCentralMenuManagement,
    bool? isBranchMenuManagement,
    String? address,
    DateTime? licenseStartDate,
    int? licenseDurationDays,
    int? allowedUserCount,
    int? waiterTerminalCount,
    bool? isLicenseActive,
    String? licenseCode,
  }) {
    return Restaurant(
      name: name ?? this.name,
      branchCount: branchCount ?? this.branchCount,
      isHeadquarters: isHeadquarters ?? this.isHeadquarters,
      hasMultipleBranches: hasMultipleBranches ?? this.hasMultipleBranches,
      branchList: branchList ?? this.branchList,
      menuManagement: menuManagement ?? this.menuManagement,
      isCentralMenuManagement: isCentralMenuManagement ?? this.isCentralMenuManagement,
      isBranchMenuManagement: isBranchMenuManagement ?? this.isBranchMenuManagement,
      address: address ?? this.address,
      licenseStartDate: licenseStartDate ?? this.licenseStartDate,
      licenseDurationDays: licenseDurationDays ?? this.licenseDurationDays,
      allowedUserCount: allowedUserCount ?? this.allowedUserCount,
      waiterTerminalCount: waiterTerminalCount ?? this.waiterTerminalCount,
      isLicenseActive: isLicenseActive ?? this.isLicenseActive,
      licenseCode: licenseCode ?? this.licenseCode,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Restaurant &&
        other.name == name &&
        other.licenseCode == licenseCode;
  }

  @override
  int get hashCode => name.hashCode ^ licenseCode.hashCode;
}

class MenuManagement {
  final bool isCentral;
  final bool isBranch;

  MenuManagement({
    required this.isCentral,
    required this.isBranch,
  });

  MenuManagement copyWith({
    bool? isCentral,
    bool? isBranch,
  }) {
    return MenuManagement(
      isCentral: isCentral ?? this.isCentral,
      isBranch: isBranch ?? this.isBranch,
    );
  }
}
