import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/cubit/restaurant_header_cubit.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/cubit/restaurant_management_cubit.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/view/widget/restaurant_branch.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/view/widget/restaurant_management_header.dart';

class RestaurantManagementView extends StatelessWidget {
  const RestaurantManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RestaurantManagementHeaderCubit(),
        ),
        BlocProvider(
          create: (context) => RestaurantManagementCubit(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Restoran Yönetimi"),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  RestaurantManagementHeader(),
                  Expanded(
                    child: RestaurantBranch(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}