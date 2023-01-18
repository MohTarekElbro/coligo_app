// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MainMenuData {
  String name;
  IconData? icon;
  Widget page;
  String route;
  String type_opening;

  MainMenuData({
    required this.name,
    this.icon,
    required this.page,
    required this.route,
    this.type_opening = "page",
  });
}

List<MainMenuData> listMainMenu = [
  MainMenuData(
    name: "Dashboard",
    page: Container(),
    icon: Icons.analytics,
    route: "/",
  ),
  MainMenuData(
    name: "Schedule",
    page: Container(),
    icon: Icons.calendar_month,
    route: "/schedule",
  ),
  MainMenuData(
    name: "Courses",
    page: Container(),
    icon: Icons.menu_book_sharp,
    route: "/courses",
  ),
  MainMenuData(
    name: "Gradebook",
    page: Container(),
    icon: Icons.school,
    route: "/gradebook",
  ),
  MainMenuData(
    name: "Performance",
    page: Container(),
    icon: Icons.bar_chart,
    route: "/performance",
  ),
  MainMenuData(
    name: "Accouncement",
    page: Container(),
    icon: Icons.announcement,
    route: "/accouncement",
  ),
];
