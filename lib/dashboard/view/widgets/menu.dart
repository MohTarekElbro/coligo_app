import 'package:coligo/utils/app_colors.dart';
import 'package:coligo/utils/main_menu_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context);
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => Get.toNamed("/"),
            child: const Padding(
                padding: EdgeInsets.all(30),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    "Coligo",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                )),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listMainMenu.length,
              itemBuilder: (context, index) {
                MainMenuData menu = listMainMenu[index];
                return ListTile(
                  selected: route!.settings.name == menu.route,
                  selectedTileColor: AppColors.indigoAccent.withOpacity(0.3),
                  onTap: () => Get.toNamed(menu.route),
                  title: Text(menu.name),
                  leading: Icon(menu.icon),
                  selectedColor: Colors.white,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
