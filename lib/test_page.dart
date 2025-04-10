import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'Customs/Custom_Bottom_Navigation_Bar.dart';
import 'Models/Stations.dart';
import 'Models/trip.dart';

class TestPage extends StatelessWidget {
  TestPage({super.key});
  var cont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          TextField(
            controller: cont,
          ),
          const SizedBox(
            height: 35,
          ),
          ElevatedButton(
              onPressed: () async {
                var nerst = statoin[0];
                print(cont.text);
                List<Location> locations =
                    await locationFromAddress('Cairo, Egypt');
                print(locations);
                for (int i = 0; i < statoin.length; i++) {
                  if (dis >
                      (Geolocator.distanceBetween(
                          locations[0].latitude,
                          locations[0].longitude,
                          statoin[i].late,
                          statoin[i].long))) {
                    dis = Geolocator.distanceBetween(
                        locations[0].latitude,
                        locations[0].longitude,
                        statoin[i].late,
                        statoin[i].long);
                    nerst = statoin[i];
                  }
                }
                Get.snackbar('info', '${nerst.name}');
              },
              child: Text('submet'))
        ],
      )),
      bottomNavigationBar:
          Container(height: 80, child: CustomBottomNavigationBar()),
    );
  }
}
