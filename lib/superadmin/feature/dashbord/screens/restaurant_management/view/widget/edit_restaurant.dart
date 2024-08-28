import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/cubit/restaurant_edit_cubit.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/model/restaurant_model.dart';

class EditRestaurant extends StatelessWidget {
  final Restaurant restaurant;  
  final Function(Restaurant updatedRestaurant) onUpdate;

  EditRestaurant({required this.restaurant, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditRestaurantCubit(restaurant),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Restoran Düzenle'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: GlobalKey<FormState>(),
            child: BlocBuilder<EditRestaurantCubit, Restaurant>(
              builder: (context, state) {
                return ListView(
                  children: [
                    TextFormField(
                      initialValue: state.name,
                      decoration: const InputDecoration(labelText: 'Restoran Adı'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen restoran adını giriniz';
                        }
                        return null;
                      },
                      onChanged: (value) => context.read<EditRestaurantCubit>().updateName(value),
                    ),
                    TextFormField(
                      initialValue: state.branchCount.toString(),
                      decoration: const InputDecoration(labelText: 'Şube Sayısı'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen şube sayısını giriniz';
                        }
                        return null;
                      },
                      onChanged: (value) => context.read<EditRestaurantCubit>().updateBranchCount(int.parse(value)),
                    ),
                    SwitchListTile(
                      title: const Text('Genel Merkez mi?'),
                      value: state.isHeadquarters,
                      onChanged: (value) => context.read<EditRestaurantCubit>().toggleHeadquarters(value),
                    ),
                    SwitchListTile(
                      title: const Text('Birden Fazla Şube Var mı?'),
                      value: state.hasMultipleBranches,
                      onChanged: (value) => context.read<EditRestaurantCubit>().toggleMultipleBranches(value),
                    ),
                    TextFormField(
                      initialValue: state.address,
                      decoration: const InputDecoration(labelText: 'Adres'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen adresi giriniz';
                        }
                        return null;
                      },
                      onChanged: (value) => context.read<EditRestaurantCubit>().updateAddress(value),
                    ),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: TextEditingController(text: state.licenseStartDate.toLocal().toString().split(' ')[0]),
                          decoration: const InputDecoration(labelText: 'Lisans Başlangıç Tarihi'),
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
                      initialValue: state.licenseDurationDays.toString(),
                      decoration: const InputDecoration(labelText: 'Lisans Süresi (Gün)'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen lisans süresini giriniz';
                        }
                        return null;
                      },
                      onChanged: (value) => context.read<EditRestaurantCubit>().updateLicenseDurationDays(int.parse(value)),
                    ),
                    TextFormField(
                      initialValue: state.allowedUserCount.toString(),
                      decoration: const InputDecoration(labelText: 'İzin Verilen Kullanıcı Sayısı'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen izin verilen kullanıcı sayısını giriniz';
                        }
                        return null;
                      },
                      onChanged: (value) => context.read<EditRestaurantCubit>().updateAllowedUserCount(int.parse(value)),
                    ),
                    TextFormField(
                      initialValue: state.waiterTerminalCount.toString(),
                      decoration: const InputDecoration(labelText: 'Garson Terminal Sayısı'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen garson terminal sayısını giriniz';
                        }
                        return null;
                      },
                      onChanged: (value) => context.read<EditRestaurantCubit>().updateWaiterTerminalCount(int.parse(value)),
                    ),
                    SwitchListTile(
                      title: const Text('Merkezi Menü Yönetimi?'),
                      value: state.isCentralMenuManagement,
                      onChanged: (value) => context.read<EditRestaurantCubit>().toggleCentralMenuManagement(value),
                    ),
                    SwitchListTile(
                      title: const Text('Şube Menü Yönetimi?'),
                      value: state.isBranchMenuManagement,
                      onChanged: (value) => context.read<EditRestaurantCubit>().toggleBranchMenuManagement(value),
                    ),
                    SwitchListTile(
                      title: const Text('Lisans Aktif mi?'),
                      value: state.isLicenseActive,
                      onChanged: (value) => context.read<EditRestaurantCubit>().toggleLicenseActive(value),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final updatedRestaurant = context.read<EditRestaurantCubit>().state;
                        onUpdate(updatedRestaurant);
                        Navigator.pop(context);
                      },
                      child: const Text('Kaydet'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      context.read<EditRestaurantCubit>().updateLicenseStartDate(picked);
    }
  }
}
