import 'package:flutter/material.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/notification_warning_system/view/widget/notification_warning_management.dart';

class NotificationWarningSystemView extends StatelessWidget {
  const NotificationWarningSystemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bildirim ve Uyarı Sistemi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: NotificationWarningManagement(),
      ),
    );
  }
}