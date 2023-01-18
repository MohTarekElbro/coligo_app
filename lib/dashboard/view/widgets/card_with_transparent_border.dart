import 'package:coligo/dashboard/model/announcement.dart';
import 'package:coligo/dashboard/view/widgets/navigate_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWithTransparentAndBorder extends StatelessWidget {
  final Announcement announcement;
  final VoidCallback onTap;
  final bool selected;

  const CardWithTransparentAndBorder({
    Key? key,
    this.selected = false,
    required this.announcement,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.primary;
    final borderRadius = BorderRadius.circular(8);

    return InkWell(
      // onTap: selected ? null : onTap,
      borderRadius: borderRadius,
      child: Container(
        width: 214,
        height: 260,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: selected ? Colors.black : null,
          borderRadius: borderRadius,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.generating_tokens,
              size: 32,
              color: selected ? secondaryColor : Colors.black,
            ),
            const SizedBox(height: 8),
            Text(
              announcement.name,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: secondaryColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 3),
            Text(
              announcement.specialization,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: selected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 3),
            Text(
              announcement.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: selected ? Colors.grey : Colors.blueGrey),
            ),
            const SizedBox(height: 10),
            DescriptionButton(
                onTap: () {
                  successDialog(
                      context: context,
                      titleText: announcement.name,
                      contentText: announcement.description,
                      buttonOnPressed: () {
                        Get.back();
                      });
                },
                title: "title",
                selected: true)
          ],
        ),
      ),
    );
  }
}

successDialog(
    {BuildContext? context,
    String? titleText,
    String contentText = "",
    Function()? buttonOnPressed}) {
  Get.dialog(
    WillPopScope(
      onWillPop: () async => true,
      child: AlertDialog(
        titlePadding: const EdgeInsets.all(0),
        contentPadding: EdgeInsets.only(top: 0.h, bottom: 5.h),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(60),
            bottomLeft: Radius.circular(60),
          ),
        ),
        content: SizedBox(
          height: 400.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.only(topRight: Radius.circular(105)),
                child: Container(
                    height: 50.h,
                    margin: EdgeInsets.only(bottom: 10.h),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(70)),
                        color: Theme.of(context!).colorScheme.primary),
                    child: Center(
                      child: Icon(
                        Icons.description,
                        color: Colors.white,
                        size: 35.sp,
                      ),
                    )),
              ),
              Text(titleText!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20),
                child: Text(
                  contentText,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.h),
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: buttonOnPressed,
                  child: const Text('OK'),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
