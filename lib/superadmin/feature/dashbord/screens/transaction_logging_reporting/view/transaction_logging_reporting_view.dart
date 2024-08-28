import 'package:flutter/material.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/transaction_logging_reporting/view/widget/transaction_logging_reporting_header.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/transaction_logging_reporting/view/widget/transaction_logging_reporting_management.dart';

class TransactionLoggingReportingView extends StatelessWidget {
  const TransactionLoggingReportingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İşlem Günlüğü ve Raporlama"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TransactionLoggingReportingHeader(),
            ),
          Expanded(
            child: TransactionLoggingReportingManagement(),
          ),
        ],
      ),
    );
  }
}