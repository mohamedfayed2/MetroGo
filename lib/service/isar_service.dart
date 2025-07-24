import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../Models/trip.dart';

late final Isar isar;

class IsarService {
  static Future<Isar> openIsarSchema() async {
    var diretory = await getApplicationDocumentsDirectory();
    WidgetsFlutterBinding.ensureInitialized();
    isar = await Isar.open([TripSchema], directory: diretory.path);
    return isar;
  }

  static Future<void> addTrip(Trip trip) async {
    await isar.writeTxn(() async {
      var trips = isar.trips;
      await trips.put(trip);
    });
  }

  static Future<List<Trip>> getTrips() async {
    var trips = await isar.trips.where().findAll();
    return trips;
  }
}
