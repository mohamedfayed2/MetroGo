import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:metro_app/Customs/Custom_Bottom_Navigation_Bar.dart';

import '../NavigationController.dart';

class HomePage extends StatefulWidget {
  final NavigationController navController = Get.find<NavigationController>();
  State<HomePage> createState() => _HomePageState();
}

//line 1 in metro
var line_1 = [
  'helwan',
  'ain helwan',
  'helwan university',
  'wadi hof',
  'hadayek helwan',
  'el-maasara',
  'tora el-asmant',
  'kozzika',
  'tora el-balad',
  'sakanat el-maadi',
  'maadi',
  'hadayek el-maadi',
  'dar el-salam',
  'el-zahraa',
  'mar girgis',
  'el-malek el-saleh',
  'el-sayeda zeinab',
  'saad zaghloul',
  'sadat',
  'nasser',
  'orabi',
  'al-shohadaa',
  'ghamra',
  'el-demerdash',
  'manshiet el-sadr',
  'kobri el-qobba',
  'hammamat el-qobba',
  'saray el-qobba',
  'hadayek el-zaitoun',
  'helmeyet el-zaitoun',
  'el-matareyya',
  'ain shams',
  'ezbet el-nakhl',
  'el-marg',
  'new el-marg'
];

//line 2 in metro
var line_2 = [
  'shubra el-kheima',
  'kolleyet el-zeraa',
  'mezallat',
  'khalafawy',
  'st. teresa',
  'rod el-farag',
  'masarra',
  'al-shohadaa',
  'attaba',
  'mohamed naguib',
  'sadat',
  'dokki',
  'opera',
  'bohooth',
  'cairo university',
  'faisal',
  'giza',
  'om el-masryeen',
  'sakiat mekky',
  'el-mounib'
];

//line 3 in metro
var line_3 = [
  'adly mansour',
  'el-haykestep',
  'omar ibn el-khattab',
  'qobaa',
  'hesham barakat',
  'el-nozha',
  'nadi el-shams',
  'alf maskan',
  'heliopolis',
  'haroun',
  'al-ahram',
  'kolleyet el-banat',
  'stadium',
  'fair zone',
  'abbassiya',
  'abdou pasha',
  'el-geish',
  'bab el-shaaria',
  'attaba',
  'nasser',
  'maspero',
  'zamalek',
  'kit kat'
];

//this place in right of end line 3 ,you can look in the map and you will find it
var right_3 = [
  'al-sodan',
  'embaba',
  'al-bohe',
  'ah-kwmia',
  'al-daary road',
  'rod al-farag'
];

//this place in right of end line 3 ,you can look in the map and you will find it
var left_3 = [
  'al-twfikia',
  'wady al-nil',
  'al-dwal unevrsty',
  'bolak',
  'cairo university'
];
//first station
final cont = TextEditingController();

//second station
final cont2 = TextEditingController();

//index the first station in list for sublist
var sub_st = 0;

//index the second station in list for sublist
var sub_end = 0;

//the count is result and the road for user
var count = <String>[].obs;

//direction like el-moneb or shobra el-khema
var dir = ''.obs;

//time for the user's trip
var time_s = ''.obs;

//price for the ticket
var ticket = 0.obs;

//it's a line i will sub from him if i have one line in my road
//or if i have multiple lines it's the first line you will sub from it
//how can i decide this line ? you can search about first station in each line
var line_start = <String>[];

//if i have multiple lines it's the end line you will sub from him
//how can i decide this line ? you can search about second station in each line
var line_end = <String>[];
//it's the station concat between two lines
var sta2 = '';
var sta = <String>[];

//the count is result and the road for user if i have multiple lines
var count2 = <String>[].obs;

var nerst = null;
//this variable for DropdownMenu
var line_All = <String>[];

// location variable
Position? p;
//p!.latitude
var pt = 0.0;
//p!.longitude
var pg = 0.0;
GetStorage? file;

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    _initlocation();
  }

  void _initlocation() async {
    await _determinePosition();
    print(p);
    if (p == null) {
      return;
    }
    pt = p!.latitude;
    pg = p!.longitude;
    print('kareem');
    nerst_st(pt, pg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
        backgroundColor: Color(0xff007BFF),
      ),
      body: Column(),
      // bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Get.snackbar('error', 'Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        Get.snackbar('error', 'Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Get.snackbar('error',
          'Location permissions are permanently denied, we cannot request permissions.');
      return;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    p = await Geolocator.getCurrentPosition();
  }

  void nerst_st(double pt, double pg) {
    print(pt);
    print(pg);
  }
}
