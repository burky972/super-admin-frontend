import 'package:flutter/material.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/model/restaurant_model.dart';

class LicenseInfo extends StatelessWidget {
  final Restaurant restaurant;
  const LicenseInfo({Key? key, required this.restaurant}) : super(key: key);

  String _formatLicenseDuration(DateTime startDate, int durationDays) {
    final endDate = startDate.add(Duration(days: durationDays));
    final remainingDays = endDate.difference(DateTime.now()).inDays;
    return remainingDays > 0 ? '$remainingDays gün kaldı.' : 'Geçti';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                title: Text('Lisans Başlangıç Tarihi'),
                subtitle: Text('${restaurant.licenseStartDate.toLocal()}'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Lisans Bitiş Tarihi'),
                subtitle: Text('${restaurant.licenseStartDate.add(Duration(days: restaurant.licenseDurationDays)).toLocal()}'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Lisans Uzunluğu (Gün)'),
                subtitle: Text('${restaurant.licenseDurationDays} gün'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Lisans Kalan Gün'),
                subtitle: Text('${_formatLicenseDuration(restaurant.licenseStartDate, restaurant.licenseDurationDays)}'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Lisans Kodu'),
                subtitle: Text('${restaurant.licenseCode}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
