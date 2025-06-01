import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Stations.dart';

//direction like el-moneb or shobra el-khema

//it's a line i will sub from him if i have one line in my road
//or if i have multiple lines it's the first line you will sub from it
//how can i decide this line ? you can search about first station in each line
var line_start = <String>[];

//if i have multiple lines it's the end line you will sub from him
//how can i decide this line ? you can search about second station in each line
var line_end = <String>[];
//it's the station concat between two lines
var sta = <String>[];

var file = GetStorage();

var nerst = null;
//this variable for DropdownMenu
var line_All = <String>[];
var dis = 100000000000000000000000.0;

class Trip {
  String cont;
  String? cont2;
  int? ticket;
  String? time;
  String? dir;
  int? sum;
  int? pass = 1;
  RxList<String>? count;
  RxList<String>? count2;
  String? sta2;
  Trip(
      {required this.cont,
      required this.cont2,
      this.ticket,
      this.time,
      this.dir,
      this.sum,
      this.count,
      this.count2,
      this.pass,
      this.sta2});

  List<String> getLineOf(String station) {
    if (line_1.contains(station)) return line_1;
    if (line_2.contains(station)) return line_2;
    if (line_3.contains(station)) return line_3;
    return [];
  }

  Future<Trip> l_roud() async {
    count ??= <String>[].obs;
    count2 ??= <String>[].obs;
    sta2 ??= '';
    pass ??= 1;
    //decide the line
    line_start = getLineOf(cont);
    if (left_3.contains(cont) ||
        right_3.contains(cont2) ||
        right_3.contains(cont) ||
        left_3.contains(cont2)) {
      print('hereeeee');
      (line_1.contains(cont) && line_2.contains(cont))
          ? (line_1.contains(cont2))
              ? line_start = line_1
              : (line_2.contains(cont2))
                  ? line_start = line_2
                  : null
          : (line_2.contains(cont) && line_3.contains(cont))
              ? (line_2.contains(cont2))
                  ? line_start = line_2
                  : (line_3.contains(cont2))
                      ? line_start = line_3
                      : null
              : (line_1.contains(cont) && line_3.contains(cont))
                  ? (line_1.contains(cont2))
                      ? line_start = line_1
                      : (line_3.contains(cont2))
                          ? line_start = line_3
                          : null
                  : null;
    } else if ((left_3.contains(cont) && right_3.contains(cont2)) ||
        (right_3.contains(cont) && left_3.contains(cont2))) {
      print('a');
      line_All = line_3 + right_3 + left_3;
      if (line_All.contains(cont) && line_All.contains(cont2)) {
        print('b');
        if ((line_3.contains(cont) && right_3.contains(cont2)) ||
            ((line_3.contains(cont2) && right_3.contains(cont)))) {
          line_start = line_3 + right_3;
        } else if ((line_3.contains(cont2) && left_3.contains(cont)) ||
            (line_3.contains(cont) && left_3.contains(cont2))) {
          print('c');
          line_start = line_3 + left_3;
        } else if (left_3.contains(cont) && right_3.contains(cont2)) {
          if (!right_3.contains('kit kat') && !left_3.contains('kit kat')) {
            left_3.add('kit kat');
          }
          line_start = line_3 + left_3 + right_3;
        } else if (right_3.contains(cont) && left_3.contains(cont2)) {
          right_3 = right_3.reversed.toList();
          if (!right_3.contains('kit kat') && !left_3.contains('kit kat')) {
            right_3.add('kit kat');
          }
          line_start = line_3 + right_3 + left_3;
        }
      } else if (line_All.contains(cont)) {
        if (left_3.contains(cont)) {
          if (!right_3.contains('kit kat') && !left_3.contains('kit kat')) {
            left_3.add('kit kat');
          }
          line_start = line_3 + left_3 + right_3;
        } else if (right_3.contains(cont)) {
          if (!right_3.contains('kit kat') && !left_3.contains('kit kat')) {
            right_3.add('kit kat');
          }
          line_start = line_3 + right_3 + left_3;
        }
        if (left_3.contains(cont) && left_3.contains(cont2)) {
          line_start = left_3;
        } else if (left_3.contains(cont) && left_3.contains(cont2)) {
          line_start = right_3;
        }
      } else {
        line_start = (left_3.contains(cont2))
            ? line_3 + left_3
            : (right_3.contains(cont2))
                ? line_3 + right_3
                : [];
      }
    }

//index the first station in list for sublist
    var sub_st = 0;

//index the second station in list for sublist
    var sub_end = 0;
    //this block for sub the list and Generat the road
    if (line_start.contains(cont) && line_start.contains(cont2)) {
      sub_st = line_start.indexOf(cont);
      sub_end = line_start.indexOf(cont2!);
      if (sub_st < sub_end) {
        count?.value = line_start.sublist(sub_st, sub_end + 1);
        dir = line_start[line_start.length - 1];
      } else {
        count?.value = line_start.sublist(sub_end, sub_st + 1);
        count?.value = count!.reversed.toList();
        dir = ' ${line_start[0]} ';
      }
    } else {
      print(line_start);
      sta2 = line_start[line_start.length - 1];
      if (line_1.contains(cont2)) {
        line_end = line_1;
      } else if (line_2.contains(cont2)) {
        line_end = line_2;
      } else if (line_3.contains(cont2)) {
        line_end = line_3;
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
        sub_st = line_start.indexOf(cont);

        (sub_st < line_start.indexOf(st_l[i]))
            ? (line_start.indexOf(st_l[i]) < line_start.indexOf(sta2!))
                ? sta2 = st_l[i]
                : null
            : (line_start.indexOf(st_l[i]) > line_start.indexOf(sta2!))
                ? sta2 = st_l[i]
                : (sta2 == line_start[line_start.length - 1])
                    ? sta2 = st_l[i]
                    : null;
      }
      if (right_3.contains(cont2)) {
        left_3 = left_3.reversed.toList();
        line_end = line_3 + left_3 + right_3;
      } else if (right_3.contains(sta2) && left_3.contains(cont2)) {
        line_end = line_3 + right_3 + left_3;
      } else if (left_3.contains(cont2)) {
        left_3 = left_3.reversed.toList();
        line_end = line_3 + left_3 + right_3;
      }
      print(line_start);
      sub_st = line_start.indexOf(cont);
      sub_end = line_start.indexOf(sta2!);
      print(sub_st);
      print(sub_end);
      print(sta2);
      if (sub_st < sub_end) {
        print(sta2);
        count?.value = line_start.sublist(sub_st, sub_end + 1);
        sub_st = line_end.indexOf(sta2!);
        sub_end = line_end.indexOf(cont2!);
        if (sub_end > sub_st) {
          count2?.value = line_end.sublist(sub_st, sub_end);
          dir = line_end[line_end.length - 1];
        } else {
          count2?.value = line_end.sublist(sub_end, sub_st);
          count2?.value = count2!.reversed.toList();
          dir = line_end[0];
        }
      } else {
        print('1');
        count?.value = line_start.sublist(sub_end, sub_st + 1);
        count?.value = count!.reversed.toList();
        sub_st = line_end.indexOf(sta2!);
        sub_end = line_end.indexOf(cont2!);
        if (sub_end > sub_st) {
          count2?.value = line_end.sublist(sub_st, sub_end);
          dir = line_end[line_end.length - 1];
        } else {
          count2?.value = line_end.sublist(sub_end, sub_st + 1);
          count2?.value = count2!.reversed.toList();
          dir = line_end[0];
        }
      }
    }
    if (count!.isNotEmpty) {
      sum = count!.length + count2!.length;
      time = (sum! * 2 >= 60)
          ? '1 دقيقه ${sum! * 2 - 60} ساعه'
          : '${sum! * 2} دقيقه ';

      ticket = ((sum! <= 9)
          ? (8 * pass!)
          : (sum! < 17)
              ? (10 * pass!)
              : (15 * pass!));
    }
    return Trip(
        cont: cont,
        cont2: cont2,
        ticket: ticket,
        dir: dir,
        time: time,
        pass: pass,
        sum: sum,
        count: count,
        count2: count2,
        sta2: sta2);
  }
}
