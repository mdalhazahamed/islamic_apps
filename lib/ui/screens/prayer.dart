import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Prayer extends StatefulWidget {
  const Prayer({super.key});

  @override
  State<Prayer> createState() => _PrayerState();
}

class _PrayerState extends State<Prayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 55.w,
          centerTitle: true,
          title: Text(
            "Prayer",
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios,
                  size: 20.sp, color: Colors.white))),
      body: Column(
        children: [
          Center(
            child: Text("Prayer"),
          ),
        ],
      ),
    );
  }
}
