

import 'package:get/get.dart';
import 'package:islamic_zone/ui/dashboard.dart';
import 'package:islamic_zone/ui/screens/al_auran.dart';
import 'package:islamic_zone/ui/screens/allah_99_name.dart';
import 'package:islamic_zone/ui/screens/details/al_quran_details.dart';
import 'package:islamic_zone/ui/screens/iman.dart';
import 'package:islamic_zone/ui/screens/prayer.dart';
import 'package:islamic_zone/ui/screens/tasbih.dart';

import '../../splash_screen.dart';

const String splash = '/splash_screen';
const String dasboard = '/dasboard';
const String alquran = '/alquran';
const String iman = '/iman';
const String prayer = '/prayer';
const String allah99name = '/allah99name';
const String tasbih = '/tasbih';
const String alqurandetails = '/alqurandetails';

//contrat our page routes

List<GetPage> getPages = [
  GetPage(
    name: splash,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: dasboard,
    page: () => Dashboard(),
  ),
   GetPage(
    name: alquran,
    page: () => AlQuran(),
  ),
   GetPage(
    name: iman,
    page: () => Iman(),
  ),
   GetPage(
    name: prayer,
    page: () => Prayer(),
  ),
   GetPage(
    name: allah99name,
    page: () => Allah99Name(),
  ),
   GetPage(
    name: tasbih,
    page: () => Tasbih(),
  ),
   GetPage(
    name: alqurandetails,
    page: () => AlQuranDetails(),
  ),

];