import 'package:flutter/material.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/menu_copy/view/widget/menu_copy_management.dart';

class MenuCopyView extends StatelessWidget {
  const MenuCopyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menü Kopyalama"),
      ),
      body: Expanded(
        child: MenuCopyManagement(),
      ),
    );
  }
}
