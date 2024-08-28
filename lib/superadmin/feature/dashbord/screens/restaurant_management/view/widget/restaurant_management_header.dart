import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/cubit/restaurant_header_cubit.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/cubit/restaurant_header_state.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/view/widget/add_restaurant.dart';
import 'package:super_admin/superadmin/product/constant/constants.dart';
import 'package:super_admin/superadmin/product/extension/responsive/responsive.dart';
import 'package:super_admin/superadmin/product/responsive/responsive.dart';

class RestaurantManagementHeader extends StatelessWidget {
  const RestaurantManagementHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RestaurantManagementHeaderCubit(),
        ),
        
      ],
      child: Padding(
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddRestaurant(
                            onAdd: (Restaurant) {},
                          )),
                );
              },
              icon: Icon(Icons.add),
              label: Text("Restoran Ekle"),
            ),
            Row(
              children: [
                SizedBox(
                  width: context.dynamicWidth(0.3),
                  child: BlocBuilder<RestaurantManagementHeaderCubit,
                      RestaurantManagementHeaderState>(
                    builder: (context, state) {
                      return SearchField(
                        onChanged: (query) {
                          context
                              .read<RestaurantManagementHeaderCubit>()
                              .searchRestaurant(query);
                        },
                      );
                    },
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
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  final Function(String) onChanged;
  const SearchField({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: "Restoran Ara",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
