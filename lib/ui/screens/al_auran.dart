import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_zone/ui/routes/routes.dart';

import '../widgets/vio_button.dart';

class AlQuran extends StatefulWidget {
  const AlQuran({super.key});

  @override
  State<AlQuran> createState() => _AlQuranState();
}

class _AlQuranState extends State<AlQuran> {
  RxBool _loaded = false.obs;
  String url = "";
  ouloadDataFirebase() async {}

  

  //RxBool _loaded = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55.w,
        centerTitle: true,
        title: Text(
          "Al Quran",
          style: TextStyle(fontSize: 18.sp),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, size: 18.sp, color: Colors.white)),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('pdf')
              .doc('al-quran')
              .collection("all-pdf")
              .snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasError)
              // return Text('Error = ${snapshot.error}');
              return Center(
                child: Transform.scale(
                    scale: 0.9,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.purple,
                    )),
              );

            if (snapshot.hasData) {
              final docs = snapshot.data!.docs;
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: docs.length ?? 0,
                  itemBuilder: (_, i) {
                    final data = docs[i].data();
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(alqurandetails);
                        },
                        child: Card(
                          elevation: 3,
                          child: Container(
                            height: 55.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              border: Border.all(
                                  color: Color.fromARGB(255, 218, 218, 218)),
                              color: Colors.white,
                            ),
                            child: StreamBuilder<Object>(
                                stream: null,
                                builder: (context, snapshot) {
                                  return Row(
                                    children: [
                                      SizedBox(width: 15.w),
                                      Row(
                                        children: [
                                          Text(
                                            (data["al-quran-name"]),
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(width: 5.w),
                                        ],
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ),
                    );
                  });
            }

            return Center(
              child: Transform.scale(
                  scale: 0.9,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.purple,
                  )),
            );
          }),
    );
  }
}
