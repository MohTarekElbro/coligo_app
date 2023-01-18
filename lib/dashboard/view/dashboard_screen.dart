import 'package:coligo/dashboard/model/announcement.dart';
import 'package:coligo/dashboard/view/widgets/card_announce_medium.dart';
import 'package:coligo/dashboard/view/widgets/card_with_transparent_border.dart';
import 'package:coligo/dashboard/view/widgets/menu.dart';
import 'package:coligo/dashboard/view/widgets/navigate_button.dart';
import 'package:coligo/dashboard/view/widgets/subtitle.dart';
import 'package:coligo/dashboard/viewModel/dashboad_controller.dart';
import 'package:coligo/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DashboardScreen extends StatelessWidget {
  final Widget? content;
  DashboardScreen({super.key, this.content});

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  Announcement announcement = Announcement(
      name: 'Mr.Ahmed Mustafa',
      specialization: 'Math 101',
      description:
          "You are free to use any package in React.js. If you choose a framework that generates boilerplate code, please specify in the README which code was written by you.");

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (cont) {
          return Scaffold(
            key: _globalKey,
            backgroundColor: AppColors.background,
            appBar: AppBar(
              title: Text(
                "Welcome Talia",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.notifications,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.mail_outline_outlined,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  ),
                ),
              ],
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                      onPressed: () {
                        _globalKey.currentState!.openDrawer();
                      },
                      icon: const Icon(
                        Icons.sort,
                        size: 30.0,
                        color: AppColors.indigo,
                      ));
                },
              ),
            ),
            drawer: const Menu(),
            body: content ??
                SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Subtitle(title: "Quizes"),
                            const Spacer(),
                            NavigateButton(
                              onTap: () {},
                              title: "All",
                              iconData: Icons.arrow_forward,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 214,
                          child: ListView.separated(
                            itemCount: cont.quizzes.length,
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(width: 16),
                            itemBuilder: (context, index) => CardAnnounceMedium(
                              iconData: Icons.hourglass_bottom,
                              quiz: cont.quizzes[index],
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            const Subtitle(title: "Announcement"),
                            const Spacer(),
                            NavigateButton(
                              onTap: () {},
                              title: "All",
                              iconData: Icons.arrow_forward,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 234,
                          child: ListView.separated(
                            itemCount: cont.announcements.length,
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(width: 16),
                            itemBuilder: (context, index) =>
                                CardWithTransparentAndBorder(
                              selected: index == 0,
                              announcement: cont.announcements[index],
                              onTap: () {},
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                )),
          );
        });
  }
}
