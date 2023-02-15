import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_zone/ui/dashboard.dart';
import 'package:islamic_zone/ui/routes/routes.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () => Get.toNamed(dasboard));
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 17, 54, 19),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://play-lh.googleusercontent.com/WBI85UynBLgL5NVC2C85Lzz1FuPfUi7jEOmd-mY6rxZGnb3KCysmbTx4RbMlc5ddSg",
              height: 150.h,
            ),
            SizedBox(height: 18.h),
            Text(
              "কোরান সুন্নাহ শিক্ষা",
              style: TextStyle(fontSize: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
