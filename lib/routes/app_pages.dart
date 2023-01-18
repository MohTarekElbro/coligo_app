import 'package:coligo/dashboard/view/dashboard_screen.dart';
import 'package:coligo/routes/dashboard_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: "/",
      page: () => DashboardScreen(),
      bindings: [
        DashboardBinding(),
      ],
    ),
    GetPage(
      name: "/schedule",
      page: () => DashboardScreen(
        content: const Align(
          alignment: Alignment.center,
          child: Text("Schedule"),
        ),
      ),
    ),
    GetPage(
      name: "/courses",
      page: () => DashboardScreen(
        content: const Align(
          alignment: Alignment.center,
          child: Text("Courses"),
        ),
      ),
    ),
    GetPage(
      name: "/gradebook",
      page: () => DashboardScreen(
        content: const Align(
          alignment: Alignment.center,
          child: Text("GradeBook"),
        ),
      ),
    ),
    GetPage(
      name: "/performance",
      page: () => DashboardScreen(
        content: const Align(
          alignment: Alignment.center,
          child: Text("Performance"),
        ),
      ),
    ),
    GetPage(
      name: "/accouncement",
      page: () => DashboardScreen(
        content: const Align(
          alignment: Alignment.center,
          child: Text("Announcement"),
        ),
      ),
    ),
  ];
}
