import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/cubit/user_management_cubit.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/cubit/user_management_header_cubit.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/view/widget/user_management.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/view/widget/user_managemet_header.dart';

class UserManagementView extends StatelessWidget {
  const UserManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserManagementHeaderCubit()),
        BlocProvider(create: (_) => UserManagementCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Kullanıcı Yönetimi"),
        ),
        body: Column(
          children: [
            const UserManagemetHeader(),
            Expanded(child: UserManagementScreen()),
          ],
        ),
      ),
    );
  }
}