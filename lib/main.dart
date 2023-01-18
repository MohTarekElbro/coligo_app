import 'package:coligo/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(370, 817),
        builder: (context, widget) {
          return GetMaterialApp(
            title: 'Responsive dashboard ',
            debugShowCheckedModeBanner: false,
            // scrollBehavior: WebDragScrollBehavior(),
            getPages: AppPages.routes,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  elevation: 0,
                  color: Colors.transparent,
                  iconTheme: IconThemeData(color: Colors.black)),
              textTheme:
                  Theme.of(context).textTheme.apply(displayColor: Colors.black),
              drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
              navigationRailTheme: const NavigationRailThemeData(
                backgroundColor: Colors.black,
                unselectedIconTheme: IconThemeData(color: Colors.grey),
                selectedIconTheme: IconThemeData(color: Colors.white),
              ),
              listTileTheme: const ListTileThemeData(
                textColor: Colors.grey,
                iconColor: Colors.grey,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              dividerTheme: const DividerThemeData(
                  color: Colors.grey, indent: 32, endIndent: 32),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: AppColors.indigoAccent,
                secondary: Colors.deepOrange,
              ),
              cardTheme:
                  const CardTheme(elevation: 12, shadowColor: Colors.white),
            ),
          );
        });
  }
}
