import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_app/service/isar_service.dart';

import '../Models/trip.dart';
import '../component/History_component.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    gettrips();
  }

  gettrips() async {
    trips.value = await IsarService.getTrips();
  }

  RxList<Trip> trips = <Trip>[].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return (trips.isNotEmpty)
            ? ListView.builder(
                itemCount: trips.length,
                itemBuilder: (context, index) {
                  return HistoryComponent(trip: trips[index]);
                },
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              );
      }),
    );
  }
}
