import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/license_management/cubit/license_cubit.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/license_management/cubit/license_header_cubit.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/model/restaurant_model.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/license_management/view/widget/license_header.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/license_management/view/widget/license_info.dart';

class LicenseManagementView extends StatelessWidget {
  const LicenseManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LicenseCubit([
            Restaurant(
          name: 'köfteci alibaba',
          branchCount: 5,
          isHeadquarters: true,
          hasMultipleBranches: true,
          menuManagement: MenuManagement(isCentral: true, isBranch: false),
          isCentralMenuManagement: true,
          isBranchMenuManagement: false,
          address: '123 Main Street',
          licenseStartDate: DateTime(2023, 3, 2),
          licenseDurationDays: 700,
          allowedUserCount: 50,
          waiterTerminalCount: 10,
          isLicenseActive: true,
          licenseCode: "A7F9G3H1J6L2M8N5P0Q4R7S2T8U1V9",
        ),
        Restaurant(
          name: 'dönerci ali usta',
          branchCount: 3,
          isHeadquarters: false,
          hasMultipleBranches: true,
          menuManagement: MenuManagement(isCentral: false, isBranch: true),
          isCentralMenuManagement: false,
          isBranchMenuManagement: true,
          address: '456 Second Street',
          licenseStartDate: DateTime(2022, 5, 15),
          licenseDurationDays: 500,
          allowedUserCount: 30,
          waiterTerminalCount: 5,
          isLicenseActive: true,
          licenseCode: "B8H3K1L6N9M2P7Q4R1S5T8U2V6",
        ),
        Restaurant(
          name: 'şazeli',
          branchCount: 4,
          isHeadquarters: true,
          hasMultipleBranches: true,
          menuManagement: MenuManagement(isCentral: false, isBranch: true),
          isCentralMenuManagement: false,
          isBranchMenuManagement: true,
          address: '1500 Street',
          licenseStartDate: DateTime(2020, 5, 15),
          licenseDurationDays: 300,
          allowedUserCount: 30,
          waiterTerminalCount: 5,
          isLicenseActive: false,
          licenseCode: "B8H3K1L6N9M2P7Q4R1S5T8U2V6",
        ),
          ]),
        ),
        BlocProvider(
          create: (context) => LicenseHeaderCubit(
              context.read<LicenseCubit>().restaurants),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lisans Yönetimi'),
        ),
        body: Column(
          children: [
            BlocBuilder<LicenseHeaderCubit, LicenseHeaderState>(
              builder: (context, state) {
                return LicenseHeader(
                  onUpdateLicenseEndDate: (newEndDate) {
                    context
                        .read<LicenseCubit>()
                        .updateLicenseEndDate(newEndDate);
                  },
                  onRestaurantSelected: (Restaurant? newValue) {
                    context.read<LicenseHeaderCubit>().selectRestaurant(newValue);
                    context.read<LicenseCubit>().selectRestaurant(newValue);
                  },
                  filteredRestaurants: state.filteredRestaurants,
                  selectedRestaurant: state.selectedRestaurant,
                  onSearchQueryChanged: (query) {
                    context.read<LicenseHeaderCubit>().filterRestaurants(query);
                  },
                );
              },
            ),
            BlocBuilder<LicenseCubit, LicenseState>(
              builder: (context, state) {
                if (state.filteredRestaurants.isNotEmpty &&
                    state.selectedRestaurant != null) {
                  return Expanded(
                    child: LicenseInfo(restaurant: state.selectedRestaurant!),
                  );
                }
                return Center(child: Text('Restoran Bulunamadı'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
