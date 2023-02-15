import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Allah99Name extends StatefulWidget {
  const Allah99Name({super.key});

  @override
  State<Allah99Name> createState() => _Allah99NameState();
}

class _Allah99NameState extends State<Allah99Name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 55.w,
        centerTitle: true,
        title: Text(
          "Allah 99 Names",
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, size: 20.sp, color: Colors.white))
      ),
      body: Column(
        children: [
          Center(
            child: Text("Allah 99 Names"),
          ),
        ],
      ),
    );
  }
}