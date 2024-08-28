import 'package:flutter/material.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/transaction_management/view/widget/transaction_management.dart';

class TransactionManagementView extends StatelessWidget {
  const TransactionManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İşlem Yönetimi"),
      ),
      body: Center(
        child: TransactionManagement(),
      ),
    );
  }
}