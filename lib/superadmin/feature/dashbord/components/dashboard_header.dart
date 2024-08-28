import 'package:flutter/material.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/transaction_management/view/transaction_management_view.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/menu_copy/view/menu_copy_view.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/notification_warning_system/view/notification_warning_system_view.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/settings/view/settings_view.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/transaction_logging_reporting/view/transaction_logging_reporting_view.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/user_management/view/user_management_view.dart';
import 'package:super_admin/superadmin/product/responsive/responsive.dart';
import 'package:super_admin/superadmin/product/constant/constants.dart';
import 'package:super_admin/superadmin/models/Dashboard.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:super_admin/superadmin/feature/dashbord/screens/restaurant_management/view/restaurant_management_view.dart';
import 'package:super_admin/superadmin/feature/dashbord/screens/license_management/view/license_management_view.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: ManagementCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
          ),
          tablet: ManagementCardGridView(),
          desktop: ManagementCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class ManagementCardGridView extends StatelessWidget {
  const ManagementCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: DashboardItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        final item = DashboardItems[index];
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(defaultPadding),
            backgroundColor: secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            switch (item.onItemSelected) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RestaurantManagementView()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LicenseManagementView()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserManagementView()),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuCopyView()),
                );
                break;
              case 4:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TransactionManagementView()),
                );
                break;
              case 5:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TransactionLoggingReportingView()),
                );
                break;
              case 6:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationWarningSystemView()),
                );
                break;
              case 7:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsView()),
                );
                break;
              default:
                break;
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(defaultPadding * 0.75),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: item.color!.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: SvgPicture.asset(
                      item.svgSrc!,
                      colorFilter: ColorFilter.mode(
                          item.color ?? Colors.black, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
              Text(
                item.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }
}
