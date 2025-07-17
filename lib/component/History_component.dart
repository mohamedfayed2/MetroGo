import 'package:flutter/material.dart';
import 'package:metro_app/App_Screens/HomePage.dart';
import 'package:metro_app/App_Screens/TrainPage.dart';
import 'package:metro_app/Models/Stations.dart';

import '../Models/trip.dart';

class HistoryComponent extends StatelessWidget {
  const HistoryComponent({super.key, required this.trip});
  final Trip trip;
  @override
  Widget build(BuildContext context) {
    final countLength = trip.count!.length;
    final count2Length = trip.count2!.length;
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(children: [
                    Text(
                        'line ${(line_1.contains(trip.count![0])) ? '1' : (line_2.contains(trip.count![0])) ? '2' : '3'}'),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView.builder(
                        itemCount: trip.count!.length,
                        itemBuilder: (context, index) {
                          return StationTile(
                              stationName: trip.count![index],
                              isFirst: index == 1,
                              isLast: index == countLength);
                        },
                      ),
                    ),
                  ]),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    children: [
                      Text(
                          'line ${(line_1.contains(trip.count![0])) ? '1' : (line_2.contains(trip.count![0])) ? '2' : '3'}'),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListView.builder(
                          itemCount: trip.count2!.length,
                          itemBuilder: (context, index) {
                            return StationTile(
                                stationName: trip.count2![index],
                                isFirst: index == 1,
                                isLast: index == count2Length);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(trip.cont),
                      SizedBox(
                        width: 6,
                      ),
                      Text(trip.cont2)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(trip.time!),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
