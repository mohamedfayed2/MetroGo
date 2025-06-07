import 'dart:convert';
import 'dart:io';

import 'package:metro_app/Models/trip.dart';
import 'package:metro_app/main.dart';
import 'package:path_provider/path_provider.dart';

class Jsontools {
  static Future<List<Trip>> getjsondata() async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    var file = File("${appDocumentsDir.path}/JsonFile.json");
    if (!(await savejsonfile())) {
      return [];
    }
    List<Map<String, dynamic>> jsonmap = jsonDecode(await file.readAsString());
    List<Trip> trips = jsonmap.map((m) => Trip.fromjson(m)).toList();
    return trips;
  }

  static Future<bool> savejsonfile() async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    var file = File("${appDocumentsDir.path}/JsonFile.json");
    if (await file.exists()) {
      if ((await file.readAsString()).trim().isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } else {
      await file.create();
      return false;
    }
  }

  static Future<void> addtrip(Trip trip) async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    triplist.add(trip);
    var tripmap = triplist.map((m) => m.tojson()).toList();
    await File(
      "${appDocumentsDir.path}/JsonFile.json",
    ).writeAsString(jsonEncode(tripmap));
  }
}
