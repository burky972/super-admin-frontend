import 'package:flutter/material.dart';
import 'package:super_admin/superadmin/product/extension/responsive/responsive.dart';

class TransactionLoggingReportingManagement extends StatelessWidget {
  const TransactionLoggingReportingManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final String licenseStatusReport = 'Lisans Durumu: Aktif';
    final String userActivityReport = 'Bugün 50 kullanıcı giriş yaptı.';
    final String restaurantActivityReport =
        'Restoran Aktiviteleri: 100 işlem tamamlandı.';
    final String waiterTerminalReport =
        'Garson El Terminali: 5 terminal aktif.';

    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReportCard(
            title: 'Lisans Durumu Raporu',
            report: licenseStatusReport,
          ),
          SizedBox(height: 16),
          ReportCard(
            title: 'Kullanıcı Aktivite Raporu',
            report: userActivityReport,
          ),
          SizedBox(height: 16),
          ReportCard(
            title: 'Restoran Aktivite Raporu',
            report: restaurantActivityReport,
          ),
          SizedBox(height: 16),
          ReportCard(
            title: 'Garson El Terminali Raporu',
            report: waiterTerminalReport,
          ),
        ],
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final String title;
  final String report;

  const ReportCard({
    super.key,
    required this.title,
    required this.report,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: context.dynamicHeight(0.02),
              width: context.dynamicWidth(0.45),
            ),
            Text(report),
          ],
        ),
      ),
    );
  }
}
