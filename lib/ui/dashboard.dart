import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';
import 'package:islamic_zone/ui/routes/routes.dart';
import 'package:islamic_zone/ui/screens/al_auran.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Rx<TextEditingController> _dobController = TextEditingController().obs;
  String? dob;

  int count = 0;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (selected != null && selected != selectedDate) {
      dob = "${selected.day} - ${selected.month} - ${selected.year}";
      _dobController.value.text = dob!;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      print(count);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF33603F),
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          "কোরান সুন্নাহ শিক্ষা",
          style: TextStyle(fontSize: 16.sp),
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 55.h,
      ),

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 22.h),
            Center(
              child: Container(
                height: 85.h,
                width: 330.w,
                decoration: BoxDecoration(
                  color: Color(0xFF3E8D0E),
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: Color.fromARGB(255, 64, 73, 45),
                      blurRadius: 3,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 12.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateTime.now().hour.toString() +
                              ":" +
                              DateTime.now().minute.toString() +
                              ":" +
                              DateTime.now().second.toString() +
                              ":" +
                              DateTime.now().millisecond.toString(),
                          style: TextStyle(
                            fontSize: 25.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat("  a").format(DateTime.now()),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => _selectDate(context),
                          child: Icon(
                            Icons.calendar_month,
                            size: 18.sp,
                            color: Colors.amber,
                          ),
                        ),
                        SizedBox(width: 6.sp),
                        Text(
                          DateTime.now().day.toString() +
                              "-" +
                              DateTime.now().month.toString() +
                              "-" +
                              DateTime.now().year.toString(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 22.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder:(context) => AlQuran(),
                              ),
                              );
                          },
                  child: containerWidget(
                    images:
                        "https://firebasestorage.googleapis.com/v0/b/fitness-f7af3.appspot.com/o/profile_image%2Fquran.png?alt=media&token=2e31b3d9-addb-446c-aed2-8692b3eb76c8",
                    imageName: "Al Quran",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(iman);
                  },
                  child: containerWidget(
                    images:
                        "https://firebasestorage.googleapis.com/v0/b/fitness-f7af3.appspot.com/o/profile_image%2Fsalam.png?alt=media&token=573a9154-e579-4a29-b0e5-f127fb1e42f2",
                    imageName: "Iman",
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(prayer);
                  },
                  child: containerWidget(
                    images:
                        "https://firebasestorage.googleapis.com/v0/b/fitness-f7af3.appspot.com/o/profile_image%2Fdoa.png?alt=media&token=dc2700fb-5a7e-40e0-b883-394411517b9b",
                    imageName: "Prayer",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(allah99name);
                  },
                  child: containerWidget(
                    images:
                        "https://firebasestorage.googleapis.com/v0/b/fitness-f7af3.appspot.com/o/profile_image%2Fallah_99%20name.png?alt=media&token=b722846d-4554-426f-b25f-4d14bc23524a",
                    imageName: "Allah 99 Name",
                  ),
                ),
              ],
            ),
            SizedBox(height: 70.h),
            InkWell(
              onTap: () {
                Get.toNamed(tasbih);
              },
              child: Container(
                height: 40.h,
                width: 150.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: Color(0xFF3E8D0E),
                ),
                child: Center(
                    child: Text(
                  "Tasbih",
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class containerWidget extends StatelessWidget {
  String images;
  String imageName;

  containerWidget({Key? key, required this.images, required this.imageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 140.h,
        width: 130.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.amber,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Color.fromARGB(255, 64, 73, 45),
              blurRadius: 3,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              images,
              height: 50.h,
            ),
            SizedBox(height: 6.h),
            Text(
              imageName,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
