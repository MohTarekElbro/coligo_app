import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 817.h * 0.4),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20.h),
              child: Text("You must login",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Theme.of(context).primaryColorDark)),
            ),
            ButtonTheme(
              minWidth: 200.w,
              height: 50.h,
              child: TextButton(
                  onPressed: () {
                    print("login1: ${GetStorage().read("isLogin")}");
                    GetStorage().write("isLogin", true);
                    print("login2: ${GetStorage().read("isLogin")}");
                    Get.toNamed("/dashboard");
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size(170.w, 50.h),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.primary)),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20.sp),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
