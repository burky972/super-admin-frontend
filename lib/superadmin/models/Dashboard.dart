import 'package:super_admin/superadmin/product/constant/constants.dart';
import 'package:flutter/material.dart';

class DashboardInfo {
  final String? svgSrc, title;
  final Color? color;
  final int? onItemSelected;

  DashboardInfo({
    this.svgSrc,
    this.title,
    this.color,
    this.onItemSelected,
  });
}

List DashboardItems = [
  DashboardInfo(
    title: "Restoran Yönetimi",
    svgSrc: "assets/icons/restaurant.svg",
    color: primaryColor,
    onItemSelected: 0,
  ),
  DashboardInfo(
    title: "Lisans Yönetimi",
    svgSrc: "assets/icons/license.svg",
    color: Color(0xFFFFA113),
    onItemSelected: 1,
  ),
  DashboardInfo(
    title: "Kullanıcı Yönetimi",
    svgSrc: "assets/icons/user_management.svg",
    color: Color(0xFFA4CDFF),
    onItemSelected: 2,
  ),
  DashboardInfo(
    title: "Menü Kopyalama",
    svgSrc: "assets/icons/copy.svg",
    color: Color(0xFF007EE5),
    onItemSelected: 3,
  ),
  DashboardInfo(
    title: "İşlem Yönetimi",
    svgSrc: "assets/icons/error.svg",
    color: Color(0xFF007EE5),
    onItemSelected: 4,
  ),
  DashboardInfo(
    title: "İşlem Günlüğü ve Raporlama",
    svgSrc: "assets/icons/history.svg",
    color: Color(0xFF007EE5),
    onItemSelected: 5,
  ),
  DashboardInfo(
    title: "Bildirim ve Uyarı Sistemi",
    svgSrc: "assets/icons/notification.svg",
    color: Color(0xFF007EE5),
    onItemSelected: 6,
  ),
  DashboardInfo(
    title: "Ayarlar",
    svgSrc: "assets/icons/menu_setting.svg",
    color: Color(0xFF007EE5),
    onItemSelected: 7,
  ),
];
