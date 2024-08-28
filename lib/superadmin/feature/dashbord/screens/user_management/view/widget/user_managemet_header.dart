import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/cubit/user_management_header_cubit.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/cubit/user_management_header_state.dart';
import 'package:super_admin/superadmin/product/constant/constants.dart';
import 'package:super_admin/superadmin/product/extension/responsive/responsive.dart';
import 'package:super_admin/superadmin/product/responsive/responsive.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/view/widget/user_management_add.dart';

class UserManagemetHeader extends StatelessWidget {
  const UserManagemetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserManagementHeaderCubit(),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<UserManagementHeaderCubit, UserManagementHeaderState>(
              builder: (context, state) {
                return ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding /
                          (Responsive.isMobile(context) ? 2 : 1),
                    ),
                  ),
                  onPressed: () async {
                    final cubit = context.read<UserManagementHeaderCubit>();
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              UserManagementAdd(onUserAdded: (userModel) {
                                cubit.userAdded();
                              })),
                    );
                    if (result != null) {
                      cubit.userAdded();
                    }
                  },
                  icon: Icon(Icons.add),
                  label: Text("Kullanıcı Ekle"),
                );
              },
            ),
            Row(
              children: [
                SizedBox(
                  width: context.dynamicWidth(0.3),
                  child: SearchField(),
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
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Kullanıcı Ara",
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
