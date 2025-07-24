import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:metro_app/Models/Stations.dart';
import 'package:metro_app/component/dropDownMetro.dart';
import 'package:metro_app/service/isar_service.dart';

import '../Models/trip.dart';
import '../component/History_component.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

var drop1 = TextEditingController();
var drop2 = TextEditingController();

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    gettrips();
    print('done');
  }

  gettrips() async {
    tripsList.value = await IsarService.getTrips();
  }

  RxList<Trip> tripsList = <Trip>[].obs;

  @override
  Widget build(BuildContext context) {
    var ALl = (line_1 + line_2 + line_3 + left_3 + right_3).toSet();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 5, top: 4),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Dropdownmetro(
                  dis: 'enter first station',
                  controller: drop1,
                  data: ALl.toList()
                      .map((e) => DropdownMenuEntry(value: e, label: e))
                      .toList(),
                  onselect: (value) async {
                    if (value == null) {
                      return;
                    } else if (value.length < 3) {
                      return;
                    } else if (!ALl.toList().contains(value)) {
                      Get.snackbar('error',
                          'this station didn\'t contains metro stations');
                      return;
                    }
                    var trips = await isar.trips
                        .filter()
                        .contContains(value, caseSensitive: false)
                        .findAll();
                    tripsList.value = trips;
                  },
                ),
                Dropdownmetro(
                  dis: 'enter secoend station (optional)',
                  controller: drop2,
                  data: ALl.toList()
                      .map((e) => DropdownMenuEntry(value: e, label: e))
                      .toList(),
                  onselect: (value) async {
                    if (value == null) {
                      return;
                    } else if (drop1.text.isEmpty) {
                      Get.snackbar(
                          'error', 'at least input first station in fist');
                      return;
                    } else if (value.length < 3) {
                      return;
                    } else if (!ALl.toList().contains(value)) {
                      Get.snackbar('error',
                          'this station didn\'t contains metro stations');
                      return;
                    }
                    var trips = await isar.trips
                        .filter()
                        .cont2Contains(value, caseSensitive: false)
                        .contContains(drop1.text, caseSensitive: false)
                        .findAll();
                    tripsList.value = trips;
                  },
                )
              ],
            ),
          ),
        ),
      ),
      body: Obx(() {
        return (tripsList.isNotEmpty)
            ? Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: ListView.builder(
                    itemCount: tripsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: HistoryComponent(trip: tripsList[index]),
                      );
                    },
                  ),
                ),
              )
            : Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ),
                ),
              );
      }),
    );
  }
}
