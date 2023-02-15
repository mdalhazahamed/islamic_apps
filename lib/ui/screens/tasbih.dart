import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Tasbih extends StatefulWidget {
  const Tasbih({super.key});

  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  var _count = 0.obs;

  void _increment() {
    if (_count > 99) {
      return;
    }
    _count++;
  }

  void _decrement() {
    if (_count < 1) {
      return;
    }
    _count--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 55.w,
          centerTitle: true,
          title: Text(
            "Tasbih",
            style: TextStyle(fontSize: 18.sp),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios,
                  size: 20.sp, color: Colors.white))),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 60.h),
            child: Text(
              "' (সহিহ মুসলিম শরিফ)। রাসূলুল্লাহ (সা.) ইরশাদ করেছেন, 'যে ব্যক্তি প্রত্যেক নামাজের পর ৩৩ বার সুবহানাল্লাহ, ৩৩ বার আলহামদুলিল্লাহ এবং ৩৩ বার আল্লাহু আকবার পাঠ করবে, আল্লাহ তার সব পাপ ক্ষমা করে দেবেন, যদিও গোনাহ সমুদ্রের ফেনা পরিমাণ হয়। ' (সহিহ মুসলিম)",
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Obx(
            () => Column(
              children: [
                Container(
                    height: 70.h,
                    width: 95.w,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                        child: Text("${_count}",
                            style: TextStyle(
                                fontSize: 35.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.red)))),
                SizedBox(height: 100.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        _decrement();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 20.r,
                        child: Icon(Icons.remove, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () {
                    _increment();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 50.r,
                    child: Icon(Icons.add, color: Colors.black),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
