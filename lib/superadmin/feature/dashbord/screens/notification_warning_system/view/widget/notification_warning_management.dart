import 'package:flutter/material.dart';
import 'package:super_admin/superadmin/product/extension/responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dropdown_search/dropdown_search.dart';

class NotificationWarningManagement extends StatelessWidget {
  const NotificationWarningManagement({super.key});

  final List<Map<String, String>> licenseExpirationWarnings = const [
    {
      'name': 'Restoran A',
      'daysLeft': '15 gün kaldı',
      'email': 'restorana@mail.com'
    },
    {
      'name': 'Restoran B',
      'daysLeft': '10 gün kaldı',
      'email': 'restoranb@mail.com'
    },
    {
      'name': 'Restoran C',
      'daysLeft': '5 gün kaldı',
      'email': 'restoranc@mail.com'
    },
  ];

  final List<Map<String, String>> newUserRegistrations = const [
    {'userName': 'Kullanıcı 1', 'registrationDate': '20 gün önce'},
    {'userName': 'Kullanıcı 2', 'registrationDate': '15 gün önce'},
    {'userName': 'Kullanıcı 3', 'registrationDate': '5 gün önce'},
  ];

  final List<Map<String, String>> temporaryClosureNotifications = const [
    {'restaurantName': 'Restoran X', 'status': 'Geçici olarak kapalı'},
    {'restaurantName': 'Restoran Y', 'status': 'Geçici olarak açıldı'},
    {'restaurantName': 'Restoran Z', 'status': 'Geçici olarak kapatıldı'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lisans Süresi Dolmak Üzere Olan Restoranlar (30 günden az)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  DropdownSearch<Map<String, String>>(
                    items: licenseExpirationWarnings,
                    itemAsString: (item) =>
                        '${item?['name']} - ${item?['daysLeft']}',
                    onChanged: (Map<String, String>? value) {},
                    popupProps: PopupProps.menu(
                      showSearchBox: true,
                      itemBuilder: (context, item, isSelected) => ListTile(
                        title: Text('${item['name']} - ${item['daysLeft']}'),
                        trailing: IconButton(
                          icon: Icon(Icons.mail),
                          onPressed: () {
                            _launchEmail(item['email']!);
                          },
                        ),
                      ),
                    ),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Restoran Seçin",
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yeni Kullanıcı Kayıtları (son 1 ayda kayıt olanlar)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  DropdownSearch<Map<String, String>>(
                    items: newUserRegistrations,
                    itemAsString: (item) =>
                        '${item?['userName']} - ${item?['registrationDate']}',
                    onChanged: (Map<String, String>? value) {},
                    popupProps: PopupProps.menu(
                      showSearchBox: true,
                      itemBuilder: (context, item, isSelected) => ListTile(
                        title: Text(
                            '${item['userName']} - ${item['registrationDate']}'),
                      ),
                    ),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Kullanıcı Seçin",
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Restoran Geçici Kapatma/Açma Bildirimleri',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  DropdownSearch<Map<String, String>>(
                    items: temporaryClosureNotifications,
                    itemAsString: (item) =>
                        '${item?['restaurantName']} - ${item?['status']}',
                    onChanged: (Map<String, String>? value) {},
                    popupProps: PopupProps.menu(
                      showSearchBox: true,
                      itemBuilder: (context, item, isSelected) => ListTile(
                        title: Text(
                            '${item['restaurantName']} - ${item['status']}'),
                      ),
                    ),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Bildirim Seçin",
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }
}
