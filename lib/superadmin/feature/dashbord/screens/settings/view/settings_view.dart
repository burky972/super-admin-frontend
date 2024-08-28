import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/settings/view/widget/settings_management.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/settings/cubit/settings_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sistem Ayarları"),
      ),
      body: BlocProvider(
        create: (context) => SettingsCubit(),
        child: SettingsManagement(),
      ),
    );
  }
}
