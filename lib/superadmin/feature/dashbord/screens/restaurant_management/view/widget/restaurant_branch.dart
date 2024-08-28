import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/cubit/restaurant_management_state.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/cubit/restaurant_management_cubit.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/view/widget/edit_restaurant.dart';
import 'package:super_admin/superadmin/product/constant/constants.dart';

class RestaurantBranch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RestaurantManagementCubit(),
        child:
            BlocBuilder<RestaurantManagementCubit, RestaurantManagementState>(
          builder: (context, state) {
            return Column(
              children: [
                if (state.selectedRestaurants.isNotEmpty)
                  Container(
                    color: secondaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                              '${state.selectedRestaurants.length} Seçildi',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            context
                                .read<RestaurantManagementCubit>()
                                .deleteSelected();
                          },
                          tooltip: 'Seçilenleri Sil',
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.restaurants.length,
                    itemBuilder: (context, index) {
                      final restaurant = state.restaurants[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Checkbox(
                            value: state.selectedRestaurants.contains(index),
                            onChanged: (bool? value) {
                              if (value != null) {
                                context
                                    .read<RestaurantManagementCubit>()
                                    .toggleSelection(index);
                              }
                            },
                          ),
                          title: Text(restaurant.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 50.0),
                                      child: Text(
                                          'Şubeler: ${restaurant.branchCount}'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Lisans: ${_formatLicenseDuration(restaurant.licenseStartDate, restaurant.licenseDurationDays)}',
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                        'Kullanıcılar: ${restaurant.allowedUserCount}'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                      'Lisans Kodu: ${restaurant.licenseCode}'),
                                  IconButton(
                                    icon: Icon(Icons.copy),
                                    onPressed: () {
                                      _copyToClipboard(
                                          context, restaurant.licenseCode);
                                    },
                                    tooltip: 'Kopyala',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                restaurant.isLicenseActive
                                    ? Icons.check_circle
                                    : Icons.cancel,
                                color: restaurant.isLicenseActive
                                    ? Colors.green
                                    : Colors.red,
                              ),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditRestaurant(
                                        restaurant: restaurant,
                                        onUpdate: (updatedRestaurant) {
                                          context
                                              .read<RestaurantManagementCubit>()
                                              .updateRestaurant(
                                                  index, updatedRestaurant);
                                        },
                                      ),
                                    ),
                                  );
                                },
                                tooltip: 'Düzenle',
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _formatLicenseDuration(DateTime startDate, int durationDays) {
    final endDate = startDate.add(Duration(days: durationDays));
    final remainingDays = endDate.difference(DateTime.now()).inDays;
    return remainingDays > 0 ? '$remainingDays gün kaldı.' : 'Geçti';
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Lisans kodu kopyalandı: $text')),
    );
  }
}
