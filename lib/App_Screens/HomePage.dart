import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:metro_app/App_Screens/TrajectoryPage.dart';
import 'package:metro_app/Customs/Custom_Bottom_Navigation_Bar.dart';
import 'package:metro_app/Models/trip.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Models/Stations.dart';
import '../controllers/NavigationController.dart';
import '../Models/sta_tg.dart';

class HomePage extends StatefulWidget {
  State<HomePage> createState() => _HomePageState();
}

final NavigationController navController = Get.find<NavigationController>();

//first station
final cont = TextEditingController();

//second station
final cont2 = TextEditingController();

Station sta_d = Station(name: '', late: 0.0, long: 0.0, link: '');
// location variable
Position? p;
//p!.latitude
var pt = 0.0;
//p!.longitude
var pg = 0.0;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _initlocation();
  }

  var name = sta_d.name.obs;

  void _initlocation() async {
    await _determinePosition();
    print(p);
    print(name?.value);
    if (p == null) {
      return;
    }
    pt = p!.latitude;
    pg = p!.longitude;
    nerst_st(pt, pg);
    name.value = sta_d.name;
    Get.snackbar('info', name.value);
  }

  @override
  Widget build(BuildContext context) {
    final RxBool swi = false.obs;
    line_All = line_1 + line_2 + line_3 + right_3 + left_3;
    Set<String> line_s = line_All.toSet();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
        backgroundColor: Color(0xff007BFF),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: Get.width * 0.75,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13.5),
                          ),
                          child: Center(
                            child: Obx(() {
                              return Text(
                                name.value,
                                style: TextStyle(fontSize: 20),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: Get.width * 0.15,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13.5),
                          ),
                          child: IconButton(
                              onPressed: () {
                                if (sta_d.link == '') {
                                  return;
                                }
                                launchUrl(Uri.parse(sta_d.link));
                              },
                              icon: Icon(LucideIcons.map)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownMenu<String>(
                dropdownMenuEntries: [
                  for (var value in line_s)
                    DropdownMenuEntry(value: value, label: value),
                ],
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
                label: Text(
                  'From',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                menuHeight: 150,
                width: 350,
                helperText: 'Enter start station',
                enableSearch: true,
                enableFilter: true,
                requestFocusOnTap: true,
                controller: cont,
              ),
            ),
          ),
          const SizedBox(height: 10),
          IconButton(
            onPressed: () {
              sta2 = cont.text;
              cont.text = cont2.text;
              cont2.text = sta2;
            },
            icon: Icon(Icons.swap_vert, size: 30, color: Colors.blue),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownMenu<String>(
                dropdownMenuEntries: [
                  for (var value in line_s)
                    DropdownMenuEntry(value: value, label: value),
                ],
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.green, width: 2),
                  ),
                ),
                label: Text(
                  'To',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                menuHeight: 150,
                width: 350,
                helperText: 'Enter end station',
                enableSearch: true,
                enableFilter: true,
                requestFocusOnTap: true,
                controller: cont2,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () async {
              line_All = line_1 + line_2 + line_3 + right_3 + left_3;

              //this block for avoid the exceptions
              if (cont.text == '' || cont2.text == '') {
                //time_s.value = 'enter stations';
                return;
              } else if (!line_All.contains(cont.text)) {
                //time_s.value = 'start station is wrong';
                return;
              } else if (!line_All.contains(cont2.text)) {
                //time_s.value = 'end station is wrong';
                return;
              } else if (cont.text == cont2.text) {
                //time_s.value = 'it is a same station';
                return;
              }
              final Trip trip_ob = await Trip(
                cont: cont.text,
                cont2: cont2.text,
              ).l_roud();
              Get.to(TrajectoryPage(), arguments: trip_ob);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
            ),
            child: const Text('Search',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ]
      ),
      bottomNavigationBar:
          SizedBox(height: 70, child: CustomBottomNavigationBar()),
    );
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Get.snackbar('error', 'Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        Get.snackbar('error', 'Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Get.snackbar('error',
          'Location permissions are permanently denied, we cannot request permissions.');
      return;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    p = await Geolocator.getCurrentPosition();
  }

  void nerst_st(double pt, double pg) {
    for (int i = 0; i < statoin.length; i++) {
      if (dis >
          (Geolocator.distanceBetween(
              pt, pg, statoin[i].late, statoin[i].long))) {
        dis = Geolocator.distanceBetween(
            pt, pg, statoin[i].late, statoin[i].long);
        sta_d = statoin[i];
      }
    }
    Get.snackbar('info', '${(dis / 1000).roundToDouble()}');
  }
}
