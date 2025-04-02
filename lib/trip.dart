import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Models/Stations.dart';

final Stations stations = Get.put(Stations());
//the count is result and the road for user
var count = <String>[].obs;

//direction like el-moneb or shobra el-khema

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

var file = GetStorage();

var nerst = null;
//this variable for DropdownMenu
var line_All = <String>[];
var dis = double.infinity;

class Trip {
  String? cont;
  String? cont2;
  int? ticket;
  String? time;
  int? x = 1;
  String? dir;
  int? sum;
  Trip(
      {this.cont,
      this.cont2,
      this.ticket,
      this.time,
      this.x,
      this.dir,
      this.sum});

  Future<Trip> l_roud([int x = 1]) async {
    print(cont);
    print(cont2);
    //decide the line
    line_start = (stations.line_1.contains(cont))
        ? stations.line_1
        : (stations.line_2.contains(cont))
            ? stations.line_2
            : (stations.line_3.contains(cont))
                ? stations.line_3
                : [];
    if (line_start.isNotEmpty) {
      print('hereeeee');
      (stations.line_1.contains(cont) && stations.line_2.contains(cont))
          ? (stations.line_1.contains(cont2))
              ? line_start = stations.line_1
              : (stations.line_2.contains(cont2))
                  ? line_start = stations.line_2
                  : null
          : (stations.line_2.contains(cont) && stations.line_3.contains(cont))
              ? (stations.line_2.contains(cont2))
                  ? line_start = stations.line_2
                  : (stations.line_3.contains(cont2))
                      ? line_start = stations.line_3
                      : null
              : (stations.line_1.contains(cont) &&
                      stations.line_3.contains(cont))
                  ? (stations.line_1.contains(cont2))
                      ? line_start = stations.line_1
                      : (stations.line_3.contains(cont2))
                          ? line_start = stations.line_3
                          : null
                  : null;
    } else {
      print('a');
      line_All = stations.line_3 + stations.right_3 + stations.left_3;
      if (line_All.contains(cont) && line_All.contains(cont2)) {
        print('b');
        if ((stations.line_3.contains(cont) &&
                stations.right_3.contains(cont2)) ||
            ((stations.line_3.contains(cont2) &&
                stations.right_3.contains(cont)))) {
          print('c');
          line_start = stations.line_3 + stations.right_3;
        } else if ((stations.line_3.contains(cont2) &&
                stations.left_3.contains(cont)) ||
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
      } else {
        line_start = (stations.left_3.contains(cont))
            ? stations.line_3 + stations.left_3
            : (stations.right_3.contains(cont))
                ? stations.line_3 + stations.right_3
                : [];
        print('iam here in else');
      }
    }

//index the first station in list for sublist
    var sub_st = 0;

//index the second station in list for sublist
    var sub_end = 0;
    //this block for sub the list and Generat the road
    if (line_start.contains(cont) && line_start.contains(cont2)) {
      sub_st = line_start.indexOf(cont!);
      sub_end = line_start.indexOf(cont2!);
      if (sub_st < sub_end) {
        count.value = line_start.sublist(sub_st, sub_end + 1);
        dir = line_start[line_start.length - 1];
      } else {
        count.value = line_start.sublist(sub_end, sub_st + 1);
        count.value = count.reversed.toList();
        dir = ' ${line_start[0]} ';
      }
    } else {
      print(line_start);
      sta2 = line_start[line_start.length - 1];
      if (stations.line_1.contains(cont2)) {
        line_end = stations.line_1;
      } else if (stations.line_2.contains(cont2)) {
        line_end = stations.line_2;
      } else if (stations.line_3.contains(cont2)) {
        line_end = stations.line_3;
      }
      sta = ['sadat', 'cairo university', 'attaba', 'al-shohadaa', 'nasser'];
      var st_l = <String>[];
      for (int i = 0; i < sta.length; i++) {
        if (line_start.contains(sta[i]) && line_end.contains(sta[i])) {
          st_l.add(sta[i]);
          sta[i] = '';
        }
      }
      for (int i = 0; i < st_l.length; i++) {
        sub_st = line_start.indexOf(cont!);
        print(line_start.indexOf(st_l[i]));
        (sub_st < line_start.indexOf(st_l[i]))
            ? (line_start.indexOf(st_l[i]) < line_start.indexOf(sta2))
                ? sta2 = st_l[i]
                : null
            : (line_start.indexOf(st_l[i]) > line_start.indexOf(sta2))
                ? sta2 = st_l[i]
                : (sta2 == line_start[line_start.length - 1])
                    ? sta2 = st_l[i]
                    : null;

        print(sta2);
      }
      if (stations.right_3.contains(cont2)) {
        stations.left_3 = stations.left_3.reversed.toList();
        line_end = stations.line_3 + stations.left_3 + stations.right_3;
      } else if (stations.right_3.contains(sta2) &&
          stations.left_3.contains(cont2)) {
        line_end = stations.line_3 + stations.right_3 + stations.left_3;
      } else if (stations.left_3.contains(cont2)) {
        stations.left_3 = stations.left_3.reversed.toList();
        line_end = stations.line_3 + stations.left_3 + stations.right_3;
      }
      print(line_end);
      sub_st = line_start.indexOf(cont!);
      sub_end = line_start.indexOf(sta2);
      if (sub_st < sub_end) {
        count.value = line_start.sublist(sub_st, sub_end);

        sub_st = line_end.indexOf(sta2);
        sub_end = line_end.indexOf(cont!);
        if (sub_end > sub_st) {
          count2.value = line_end.sublist(sub_st, sub_end + 1);
          dir = line_end[line_end.length - 1];
        } else {
          count2.value = line_end.sublist(sub_end, sub_st);
          count2.value = count2.reversed.toList();
          dir = line_end[0];
        }
      } else {
        count.value = line_start.sublist(sub_end, sub_st + 1);
        count.value = count.reversed.toList();
        sub_st = line_end.indexOf(sta2);
        sub_end = line_end.indexOf(cont2!);
        if (sub_end > sub_st) {
          count2.value = line_end.sublist(sub_st, sub_end);
          dir = line_end[line_end.length - 1];
        } else {
          count2.value = line_end.sublist(sub_end, sub_st + 1);
          count2.value = count2.reversed.toList();
          dir = line_end[0];
        }
      }
    }
    if (count.isNotEmpty) {
      sum = count.length + count2.length;
      time = (sum! * 2 >= 60)
          ? '1 دقيقه ${sum! * 2 - 60} ساعه'
          : '${sum! * 2} دقيقه ';

      ticket = ((sum! <= 9)
          ? (8 * x)
          : (sum! <= 17)
              ? (10 * x)
              : (15 * x));
      return await Trip(
          cont: cont,
          cont2: cont2,
          ticket: ticket,
          dir: dir,
          time: time,
          sum: sum);
    }
    return await Trip(
        cont: cont, cont2: cont2, ticket: ticket, dir: dir, time: time);
  }
}
