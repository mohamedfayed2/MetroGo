import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:metro_app/App_Screens/TrajectoryPage.dart';
import 'package:metro_app/Customs/Custom_Bottom_Navigation_Bar.dart';
import '../Models/Stations.dart';
import '../controllers/NavigationController.dart';
import '../controllers/controller_home.dart';
import 'PhotomapPage.dart';

class HomePage extends StatefulWidget {
  State<HomePage> createState() => _HomePageState();
}

final NavigationController navController = Get.find<NavigationController>();
final Stations stations = Get.put(Stations());
final controllers Home = Get.put(controllers());
// location variable
Position? p;
//p!.latitude
var pt = 0.0;
//p!.longitude
var pg = 0.0;
GetStorage? file;

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();

    _initlocation();
  }

  void _initlocation() async {
    Future.delayed(Duration(seconds: 10));
    await _determinePosition();
    print(p);
    if (p == null) {
      return;
    }
    pt = p!.latitude;
    pg = p!.longitude;
    nerst_st(pt, pg);
  }

  @override
  Widget build(BuildContext context) {
    Home.line_All = stations.line_1 +
        stations.line_2 +
        stations.line_3 +
        stations.right_3 +
        stations.left_3;
    Set<String> line_s = Home.line_All.toSet();
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
        backgroundColor: Color(0xff007BFF),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 30,
          ),
          Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownMenu(
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
                width: 350,
                helperText: 'Enter start station',
                enableSearch: true,
                enableFilter: true,
                requestFocusOnTap: true,
                controller: Home.cont,
              ),
            ),
          ),
          SizedBox(height: 10),
          IconButton(
            onPressed: () {
              Home.sta2 = Home.cont.text;
              Home.cont.text = Home.cont2.text;
              Home.cont2.text = Home.sta2;
            },
            icon: Icon(Icons.swap_vert, size: 30, color: Colors.blue),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownMenu(
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
                width: 350,
                helperText: 'Enter end station',
                enableSearch: true,
                enableFilter: true,
                requestFocusOnTap: true,
                controller: Home.cont2,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            label: Text('Search'),
            onPressed: () {
              Home.dir.value = '';
              Home.time_s.value = '';
              Home.count.value = [];
              Home.count2.value = [];
              Home.ticket.value = 0;
              Home.line_All = stations.line_1 +
                  stations.line_2 +
                  stations.line_3 +
                  stations.right_3 +
                  stations.left_3;

              //this block for avoid the exception
              if (Home.cont.text == '' || Home.cont2.text == '') {
                Home.time_s.value = 'enter stations';
                return;
              } else if (!Home.line_All.contains(Home.cont.text)) {
                Home.time_s.value = 'start station is wrong';
                return;
              } else if (!Home.line_All.contains(Home.cont2.text)) {
                Home.time_s.value = 'end station is wrong';
                return;
              } else if (Home.cont.text == Home.cont2.text) {
                Home.time_s.value = 'it is a same station';
                return;
              }
              Home.l_roud(Home.cont.text, Home.cont2.text);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrajectoryPage(),
                ),
              );
            },
            icon: Icon(EvaIcons.search),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            IconButton(
              onPressed: () {
                Get.to(PhotoMap());
              },
              icon: Icon(EvaIcons.map),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ]),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      bottomNavigationBar:
          SizedBox(height: 80, child: CustomBottomNavigationBar()),
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
    for (int i = 0; i < stations.statoin.length; i++) {
      if (Home.dis >
          (Geolocator.distanceBetween(
              pt, pg, stations.statoin[i].late, stations.statoin[i].long))) {
        Home.dis = Geolocator.distanceBetween(
            pt, pg, stations.statoin[i].late, stations.statoin[i].long);
        Home.sta_d = stations.statoin[i];
      }
    }
    Get.snackbar('info', '${Home.sta_d?.name}');
    Get.snackbar('info', '${Home.sta_d?.link}');
    Get.snackbar('info', '${(Home.dis / 1000).roundToDouble()}');
  }
}
