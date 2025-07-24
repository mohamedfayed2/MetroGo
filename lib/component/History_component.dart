import 'package:flutter/material.dart';
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(children: [
                    (trip.count!.isNotEmpty)
                        ? Text(
                            'line ${(line_1.contains(trip.count![0])) ? '1' : (line_2.contains(trip.count![0])) ? '2' : '3'}')
                        : SizedBox(),
                    SizedBox(
                      height: 6,
                    ),
                    (trip.count!.isNotEmpty)
                        ? Container(
                            width: 115,
                            height: 130,
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
                                    isFirst: index == 0,
                                    isLast: index == count2Length - 1);
                              },
                            ),
                          )
                        : SizedBox(),
                  ]),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      (trip.count2!.isNotEmpty)
                          ? Text(
                              'line ${(line_1.contains(trip.count![0])) ? '1' : (line_2.contains(trip.count![0])) ? '2' : '3'}')
                          : SizedBox(),
                      SizedBox(
                        height: 8,
                      ),
                      (trip.count2!.isNotEmpty)
                          ? Container(
                              width: 115,
                              height: 130,
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
                                      isFirst: index == 0,
                                      isLast: index == count2Length - 1);
                                },
                              ),
                            )
                          : SizedBox(),
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
                  Text(
                    trip.cont,
                    maxLines: 2,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('|'),
                  Text('V'),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    trip.cont2,
                    maxLines: 2,
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
