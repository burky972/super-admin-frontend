import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_admin/superadmin/controllers/MenuAppController.dart';
import 'components/side_menu.dart';
import 'package:super_admin/superadmin/feature/dashbord/dashboard_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(onItemSelected: _onItemTapped),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: IndexedStack(
                index: _selectedIndex,
                children: _widgetOptions,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
