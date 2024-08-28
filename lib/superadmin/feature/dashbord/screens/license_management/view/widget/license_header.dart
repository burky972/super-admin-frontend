import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/license_management/cubit/license_duration_update_cubit.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/license_management/view/widget/license_duration_update.dart';
import 'package:super_admin/superadmin/product/constant/constants.dart';
import 'package:super_admin/superadmin/product/extension/responsive/responsive.dart';
import 'package:super_admin/superadmin/product/responsive/responsive.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/model/restaurant_model.dart';

class LicenseHeader extends StatelessWidget {
  final Function(DateTime) onUpdateLicenseEndDate;
  final Function(Restaurant?) onRestaurantSelected;
  final Function(String) onSearchQueryChanged;
  final List<Restaurant> filteredRestaurants;
  final Restaurant? selectedRestaurant;

  const LicenseHeader({
    super.key,
    required this.onUpdateLicenseEndDate,
    required this.onRestaurantSelected,
    required this.filteredRestaurants,
    required this.selectedRestaurant,
    required this.onSearchQueryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical:
                    defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
              ),
            ),
            onPressed: () async {
              final selectedEndDate = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => LicenseDurationUpdateCubit(),
                    child: LicenseDurationUpdate(),
                  ),
                ),
              );

              if (selectedEndDate != null && selectedEndDate is DateTime) {
                onUpdateLicenseEndDate(selectedEndDate);
              }
            },
            icon: Icon(Icons.add),
            label: Text("Lisans süresi Uzatma"),
          ),
          Row(
            children: [
              SizedBox(
                width: context.dynamicWidth(0.3),
                child: DropdownSearch<Restaurant>(
                  items: filteredRestaurants,
                  selectedItem: selectedRestaurant,
                  itemAsString: (Restaurant restaurant) => restaurant.name,
                  onChanged: onRestaurantSelected,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Restoran Seç",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  popupProps: PopupProps.menu(
                    showSearchBox: true,
                    searchDelay: Duration.zero,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        hintText: "Restoran ara...",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: defaultPadding / 2),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(defaultPadding * 0.8),
                  backgroundColor: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {},
                child: SvgPicture.asset(
                  "assets/icons/filter.svg",
                  height: 28,
                  width: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
