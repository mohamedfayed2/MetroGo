import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/Stations.dart';
import '../sta_tg.dart';

class controllers extends GetxController {
  final Stations stations = Get.put(Stations());

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
  void l_roud(String cont, String cont2) {
    //decide the line
    if (stations.line_1.contains(cont)) {
      line_start = stations.line_1;
    } else if (stations.line_2.contains(cont)) {
      line_start = stations.line_2;
    } else if (stations.line_3.contains(cont)) {
      line_start = stations.line_3;
    } else {
      if (stations.line_1.contains(cont) && stations.line_2.contains(cont)) {
        if (stations.line_1.contains(cont2)) {
          line_start = stations.line_1;
        } else if (stations.line_2.contains(cont2)) {
          line_start = stations.line_2;
        }
      } else if (stations.line_2.contains(cont) &&
          stations.line_3.contains(cont)) {
        if (stations.line_2.contains(cont2)) {
          line_start = stations.line_2;
        } else if (stations.line_3.contains(cont2)) {
          line_start = stations.line_3;
        }
      } else if (stations.line_1.contains(cont) &&
          stations.line_3.contains(cont)) {
        if (stations.line_1.contains(cont2)) {
          line_start = stations.line_1;
        } else if (stations.line_3.contains(cont2)) {
          line_start = stations.line_3;
        }
      }
      line_All = stations.line_3 + stations.right_3 + stations.left_3;
      if (line_All.contains(cont) && line_All.contains(cont2)) {
        if (stations.line_3.contains(cont) &&
            stations.right_3.contains(cont2)) {
          line_start = stations.line_3 + stations.right_3;
        } else if (stations.line_3.contains(cont2) &&
            stations.right_3.contains(cont)) {
          stations.right_3 = stations.right_3.reversed.toList();
          line_start = stations.line_3 + stations.right_3;
        } else if ((stations.line_3.contains(cont2) &&
                stations.line_3.contains(cont)) ||
            (stations.line_3.contains(cont) &&
                stations.left_3.contains(cont2))) {
          line_start = stations.line_3 + stations.left_3;
        } else if (stations.left_3.contains(cont) &&
            stations.right_3.contains(cont2)) {
          stations.left_3 = stations.left_3.reversed.toList();
          if (!stations.right_3.contains('kit kat') &&
              !stations.left_3.contains('kit kat')) {
            stations.left_3.add('kit kat');
          }
          line_start = stations.line_3 + stations.left_3 + stations.right_3;
        } else if (stations.right_3.contains(cont) &&
            stations.left_3.contains(cont2)) {
          stations.right_3 = stations.right_3.reversed.toList();
          if (!stations.right_3.contains('kit kat') &&
              !stations.left_3.contains('kit kat')) {
            stations.right_3.add('kit kat');
          }
          line_start = stations.line_3 + stations.right_3 + stations.left_3;
        }
      } else if (line_All.contains(cont)) {
        if (stations.left_3.contains(cont)) {
          if (!stations.right_3.contains('kit kat') &&
              !stations.left_3.contains('kit kat')) {
            stations.left_3.add('kit kat');
          }
          line_start = stations.line_3 + stations.left_3 + stations.right_3;
        } else if (stations.right_3.contains(cont)) {
          if (!stations.right_3.contains('kit kat') &&
              !stations.left_3.contains('kit kat')) {
            stations.right_3.add('kit kat');
          }
          line_start = stations.line_3 + stations.right_3 + stations.left_3;
        }
        if (stations.left_3.contains(cont) && stations.left_3.contains(cont2)) {
          line_start = stations.left_3;
        } else if (stations.left_3.contains(cont) &&
            stations.left_3.contains(cont2)) {
          line_start = stations.right_3;
        }
      }
    }
    //this block for sub the list and Generat the road
    if (line_start.contains(cont) && line_start.contains(cont2)) {
      sub_st = line_start.indexOf(cont);
      sub_end = line_start.indexOf(cont2);
      if (sub_st < sub_end) {
        count.value = line_start.sublist(sub_st, sub_end + 1);
        dir.value = line_start[line_start.length - 1];
      } else {
        count.value = line_start.sublist(sub_end, sub_st + 1);
        count.value = count.reversed.toList();
        dir.value = 'dir = ${line_start[0]}';
      }
    } else {
      if (stations.line_1.contains(cont2)) {
        line_end = stations.line_1;
      } else if (stations.line_2.contains(cont2)) {
        line_end = stations.line_2;
      } else {
        line_end = stations.line_3;
      }
      sta = ['sadat', 'cairo university', 'attaba', 'al-shohadaa', 'nasser'];
      sta.shuffle();
      for (int i = 0; i < sta.length; i++) {
        if (line_start.contains(sta[i]) && line_end.contains(sta[i])) {
          sta2 = sta[i];
          sta[i] = '';
          break;
        } else {
          sta2 = '';
        }
      }
      if (stations.right_3.contains(cont2)) {
        stations.left_3 = stations.left_3.reversed.toList();
        line_end = stations.line_3 + stations.left_3 + stations.right_3;
      } else if (stations.right_3.contains(sta2) &&
          stations.left_3.contains(cont2)) {
        line_end = stations.line_3 + stations.right_3 + stations.left_3;
      }
      sub_st = line_start.indexOf(cont);
      sub_end = line_start.indexOf(sta2);
      if (sub_st < sub_end) {
        count.value = line_start.sublist(sub_st, sub_end);
        sub_st = line_end.indexOf(sta2);
        sub_end = line_end.indexOf(cont2);
        if (sub_end > sub_st) {
          count2.value = line_end.sublist(sub_st, sub_end + 1);
          dir.value = line_end[line_end.length - 1];
        } else {
          count2.value = line_end.sublist(sub_end, sub_st);
          count2.value = count2.reversed.toList();
          dir.value = line_end[0];
        }
      } else {
        count.value = line_start.sublist(sub_end, sub_st + 1);
        count.value = count.reversed.toList();
        sub_st = line_end.indexOf(sta2);
        sub_end = line_end.indexOf(cont2);
        if (sub_end > sub_st) {
          count2.value = line_end.sublist(sub_st, sub_end);
          dir.value = line_end[line_end.length - 1];
        } else {
          count2.value = line_end.sublist(sub_end, sub_st + 1);
          count2.value = count2.reversed.toList();
          dir.value = line_end[0];
        }
      }
    }
    if (count.isNotEmpty) {
      sub_st = count.length + count2.length;
      sub_st = sub_st;
      if (sub_st * 2 >= 60) {
        time_s.value = ' 1 hour ${sub_st * 2 - 60}';
      } else {
        time_s.value = 'time = ${sub_st * 2} min';
      }
      if (sub_st <= 9) {
        ticket.value = 8;
      } else if (sub_st <= 17) {
        ticket.value = 10;
      } else {
        ticket.value = 15;
      }
    }
  }
}
