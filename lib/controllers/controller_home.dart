import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../sta_tg.dart';

class controllers extends GetxController {
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
  var dis = double.infinity;
  Station? sta_d;
}
