import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/cubit/restaurant_add_cubit.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/cubit/restaurant_add_state.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/model/restaurant_model.dart';

class AddRestaurant extends StatelessWidget {
  final Function(Restaurant) onAdd;

  const AddRestaurant({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RestaurantCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Restoran Ekle'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: BlocBuilder<RestaurantCubit, RestaurantState>(
            builder: (context, state) {
              return Form(
                child: ListView(
                  children: [
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Restoran Adı'),
                      onChanged: (value) =>
                          context.read<RestaurantCubit>().updateName(value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen restoran adını giriniz';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Şube Sayısı'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => context
                          .read<RestaurantCubit>()
                          .updateBranchCount(value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen şube sayısını giriniz';
                        }
                        return null;
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Genel Merkez mi?'),
                      value: state.isHeadquarters,
                      onChanged: (_) => context
                          .read<RestaurantCubit>()
                          .toggleIsHeadquarters(),
                    ),
                    SwitchListTile(
                      title: const Text('Birden Fazla Şube Var mı?'),
                      value: state.hasMultipleBranches,
                      onChanged: (_) => context
                          .read<RestaurantCubit>()
                          .toggleHasMultipleBranches(),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Adres'),
                      onChanged: (value) =>
                          context.read<RestaurantCubit>().updateAddress(value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen adresi giriniz';
                        }
                        return null;
                      },
                    ),
                    GestureDetector(
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (picked != null) {
                          context
                              .read<RestaurantCubit>()
                              .updateLicenseStartDate(
                                "${picked.toLocal()}".split(' ')[0],
                              );
                        }
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Lisans Başlangıç Tarihi'),
                          controller: TextEditingController(
                              text: state.licenseStartDate),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Lütfen lisans başlangıç tarihini giriniz';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Lisans Süresi (Gün)'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => context
                          .read<RestaurantCubit>()
                          .updateLicenseDurationDays(value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen lisans süresini giriniz';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'İzin Verilen Kullanıcı Sayısı'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => context
                          .read<RestaurantCubit>()
                          .updateAllowedUserCount(value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen izin verilen kullanıcı sayısını giriniz';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Garson Terminal Sayısı'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => context
                          .read<RestaurantCubit>()
                          .updateWaiterTerminalCount(value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen garson terminal sayısını giriniz';
                        }
                        return null;
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Merkezi Menü Yönetimi mi?'),
                      value: state.isCentralMenuManagement,
                      onChanged: (_) => context
                          .read<RestaurantCubit>()
                          .toggleIsCentralMenuManagement(),
                    ),
                    SwitchListTile(
                      title: const Text('Şube Menü Yönetimi mi?'),
                      value: state.isBranchMenuManagement,
                      onChanged: (_) => context
                          .read<RestaurantCubit>()
                          .toggleIsBranchMenuManagement(),
                    ),
                    SwitchListTile(
                      title: const Text('Lisans Aktif mi?'),
                      value: state.isLicenseActive,
                      onChanged: (_) => context
                          .read<RestaurantCubit>()
                          .toggleIsLicenseActive(),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        onAdd(
                          Restaurant(
                            name: state.name,
                            branchCount: int.parse(state.branchCount),
                            isHeadquarters: state.isHeadquarters,
                            hasMultipleBranches: state.hasMultipleBranches,
                            address: state.address,
                            licenseStartDate:
                                DateTime.parse(state.licenseStartDate),
                            licenseDurationDays:
                                int.parse(state.licenseDurationDays),
                            allowedUserCount: int.parse(state.allowedUserCount),
                            waiterTerminalCount:
                                int.parse(state.waiterTerminalCount),
                            isCentralMenuManagement:
                                state.isCentralMenuManagement,
                            isBranchMenuManagement:
                                state.isBranchMenuManagement,
                            isLicenseActive: state.isLicenseActive,
                            licenseCode: state.licenseCode,
                            menuManagement: MenuManagement(
                              isCentral: state.isCentralMenuManagement,
                              isBranch: state.isBranchMenuManagement,
                            ),
                          ),
                        );
                        Navigator.of(context).pop();
                      },
                      child: const Text('Ekle'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
