import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData lightTheme(context) => ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 64, 73, 45),
          elevation: 0,
          titleTextStyle: TextStyle(),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        colorScheme: const ColorScheme.light(),
        textTheme: GoogleFonts.aBeeZeeTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
                displayColor: Colors.black,
                decorationColor: Colors.black,
              ),
        ),
        scaffoldBackgroundColor: Color(0xFFEAEAEA),
      );

  ThemeData darkTheme(context) => ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          color: Color(0xFF3E8D0E),
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.white),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        colorScheme: const ColorScheme.dark(),
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.aBeeZeeTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
                decorationColor: Colors.white,
              ),
        ),
        scaffoldBackgroundColor: Color(0xFF33603F),
      );
}
