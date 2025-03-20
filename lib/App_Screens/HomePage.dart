import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:metro_app/App_Screens/MapPage.dart';
import 'package:metro_app/Customs/Custom_Bottom_Navigation_Bar.dart';
import '../Models/Stations.dart';
import '../controllers/NavigationController.dart';
import '../controllers/controller_home.dart';

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
    await _determinePosition();
    print(p);
    if (p == null) {
      return;
    }
    pt = p!.latitude;
    pg = p!.longitude;
    print('kareem');
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
    Home.count.value = [];
    Home.count2.value = [];
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
          DropdownMenu(
            dropdownMenuEntries: [
              for (var value in line_s)
                DropdownMenuEntry(value: value, label: value),
            ],
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
            )),
            label: Text(
              'from',
            ),
            width: 350,
            helperText: 'enter start station',
            enableSearch: true,
            enableFilter: true,
            requestFocusOnTap: true,
            controller: Home.cont,
          ),
          IconButton(
              onPressed: () {
                Home.sta2 = Home.cont.text;
                Home.cont.text = Home.cont2.text;
                Home.cont2.text = Home.sta2;
              },
              icon: Image.asset(
                'assets/images/switch2.png',
                width: 20,
                height: 20,
              )),
          SizedBox(
            height: 10,
          ),
          DropdownMenu(
            dropdownMenuEntries: [
              for (var value in line_s)
                DropdownMenuEntry(value: value, label: value),
            ],
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
            )),
            label: Text('to'),
            width: 350,
            helperText: 'enter end station',
            enableSearch: true,
            enableFilter: true,
            requestFocusOnTap: true,
            controller: Home.cont2,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            label: Text('culclate'),
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
              //decide the line
              if (stations.line_1.contains(Home.cont.text)) {
                Home.line_start = stations.line_1;
              } else if (stations.line_2.contains(Home.cont.text)) {
                Home.line_start = stations.line_2;
              } else if (stations.line_3.contains(Home.cont.text)) {
                Home.line_start = stations.line_3;
              } else if (stations.left_3.contains(Home.cont.text)) {
                Home.line_start = stations.line_3;
              } else if (stations.right_3.contains(Home.cont.text)) {
                Home.line_start = stations.line_3;
              }
              if (stations.line_1.contains(Home.cont.text) &&
                  stations.line_2.contains(Home.cont.text)) {
                if (stations.line_1.contains(Home.cont2.text)) {
                  Home.line_start = stations.line_1;
                } else if (stations.line_2.contains(Home.cont2.text)) {
                  Home.line_start = stations.line_2;
                }
              } else if (stations.line_2.contains(Home.cont.text) &&
                  stations.line_3.contains(Home.cont.text)) {
                if (stations.line_2.contains(Home.cont2.text)) {
                  Home.line_start = stations.line_2;
                } else if (stations.line_3.contains(Home.cont2.text)) {
                  Home.line_start = stations.line_3;
                }
              } else if (stations.line_1.contains(Home.cont.text) &&
                  stations.line_3.contains(Home.cont.text)) {
                if (stations.line_1.contains(Home.cont2.text)) {
                  Home.line_start = stations.line_1;
                } else if (stations.line_3.contains(Home.cont2.text)) {
                  Home.line_start = stations.line_3;
                }
              }
              Home.line_All =
                  stations.line_3 + stations.right_3 + stations.left_3;
              if (Home.line_All.contains(Home.cont.text) &&
                  Home.line_All.contains(Home.cont2.text)) {
                if (stations.line_3.contains(Home.cont.text) &&
                    stations.right_3.contains(Home.cont2.text)) {
                  Home.line_start = stations.line_3 + stations.right_3;
                } else if (stations.line_3.contains(Home.cont2.text) &&
                    stations.right_3.contains(Home.cont.text)) {
                  stations.right_3 = stations.right_3.reversed.toList();
                  Home.line_start = stations.line_3 + stations.right_3;
                } else if ((stations.line_3.contains(Home.cont2.text) &&
                        stations.line_3.contains(Home.cont.text)) ||
                    (stations.line_3.contains(Home.cont.text) &&
                        stations.left_3.contains(Home.cont2.text))) {
                  Home.line_start = stations.line_3 + stations.left_3;
                } else if (stations.left_3.contains(Home.cont.text) &&
                    stations.right_3.contains(Home.cont2.text)) {
                  stations.left_3 = stations.left_3.reversed.toList();
                  if (!stations.right_3.contains('kit kat') &&
                      !stations.left_3.contains('kit kat')) {
                    stations.left_3.add('kit kat');
                  }
                  Home.line_start =
                      stations.line_3 + stations.left_3 + stations.right_3;
                } else if (stations.right_3.contains(Home.cont.text) &&
                    stations.left_3.contains(Home.cont2.text)) {
                  stations.right_3 = stations.right_3.reversed.toList();
                  if (!stations.right_3.contains('kit kat') &&
                      !stations.left_3.contains('kit kat')) {
                    stations.right_3.add('kit kat');
                  }
                  Home.line_start =
                      stations.line_3 + stations.right_3 + stations.left_3;
                }
              } else if (Home.line_All.contains(Home.cont.text)) {
                if (stations.left_3.contains(Home.cont.text)) {
                  if (!stations.right_3.contains('kit kat') &&
                      !stations.left_3.contains('kit kat')) {
                    stations.left_3.add('kit kat');
                  }
                  Home.line_start =
                      stations.line_3 + stations.left_3 + stations.right_3;
                } else if (stations.right_3.contains(Home.cont.text)) {
                  if (!stations.right_3.contains('kit kat') &&
                      !stations.left_3.contains('kit kat')) {
                    stations.right_3.add('kit kat');
                  }
                  Home.line_start =
                      stations.line_3 + stations.right_3 + stations.left_3;
                }
                if (stations.left_3.contains(Home.cont.text) &&
                    stations.left_3.contains(Home.cont2.text)) {
                  Home.line_start = stations.left_3;
                } else if (stations.left_3.contains(Home.cont.text) &&
                    stations.left_3.contains(Home.cont2.text)) {
                  Home.line_start = stations.right_3;
                }
              }
              //this block for sub the list and Generat the road
              if (Home.line_start.contains(Home.cont.text) &&
                  Home.line_start.contains(Home.cont2.text)) {
                Home.sub_st = Home.line_start.indexOf(Home.cont.text);
                Home.sub_end = Home.line_start.indexOf(Home.cont2.text);
                if (Home.sub_st < Home.sub_end) {
                  Home.count.value =
                      Home.line_start.sublist(Home.sub_st, Home.sub_end + 1);
                  Home.dir.value = Home.line_start[Home.line_start.length - 1];
                } else {
                  Home.count.value =
                      Home.line_start.sublist(Home.sub_end, Home.sub_st + 1);
                  Home.count.value = Home.count.reversed.toList();
                  Home.dir.value = 'dir = ${Home.line_start[0]}';
                }
              } else {
                if (stations.line_1.contains(Home.cont2.text)) {
                  Home.line_end = stations.line_1;
                } else if (stations.line_2.contains(Home.cont2.text)) {
                  Home.line_end = stations.line_2;
                } else {
                  Home.line_end = stations.line_3;
                }
                Home.sta = [
                  'sadat',
                  'cairo university',
                  'attaba',
                  'al-shohadaa',
                  'nasser'
                ];
                Home.sta.shuffle();
                for (int i = 0; i < Home.sta.length; i++) {
                  if (Home.line_start.contains(Home.sta[i]) &&
                      Home.line_end.contains(Home.sta[i])) {
                    Home.sta2 = Home.sta[i];
                    Home.sta[i] = '';
                    break;
                  } else {
                    Home.sta2 = '';
                  }
                }
                if (stations.right_3.contains(Home.cont2.text)) {
                  stations.left_3 = stations.left_3.reversed.toList();
                  Home.line_end =
                      stations.line_3 + stations.left_3 + stations.right_3;
                } else if (stations.right_3.contains(Home.sta2) &&
                    stations.left_3.contains(Home.cont2.text)) {
                  Home.line_end =
                      stations.line_3 + stations.right_3 + stations.left_3;
                }
                Home.sub_st = Home.line_start.indexOf(Home.cont.text);
                Home.sub_end = Home.line_start.indexOf(Home.sta2);
                if (Home.sub_st < Home.sub_end) {
                  Home.count.value =
                      Home.line_start.sublist(Home.sub_st, Home.sub_end);
                  Home.sub_st = Home.line_end.indexOf(Home.sta2);
                  Home.sub_end = Home.line_end.indexOf(Home.cont2.text);
                  if (Home.sub_end > Home.sub_st) {
                    Home.count2.value =
                        Home.line_end.sublist(Home.sub_st, Home.sub_end + 1);
                    Home.dir.value = Home.line_end[Home.line_end.length - 1];
                  } else {
                    Home.count2.value =
                        Home.line_end.sublist(Home.sub_end, Home.sub_st);
                    Home.count2.value = Home.count2.reversed.toList();
                    Home.dir.value = Home.line_end[0];
                  }
                } else {
                  Home.count.value =
                      Home.line_start.sublist(Home.sub_end, Home.sub_st + 1);
                  Home.count.value = Home.count.reversed.toList();
                  Home.sub_st = Home.line_end.indexOf(Home.sta2);
                  Home.sub_end = Home.line_end.indexOf(Home.cont2.text);
                  if (Home.sub_end > Home.sub_st) {
                    Home.count2.value =
                        Home.line_end.sublist(Home.sub_st, Home.sub_end);
                    Home.dir.value = Home.line_end[Home.line_end.length - 1];
                  } else {
                    Home.count2.value =
                        Home.line_end.sublist(Home.sub_end, Home.sub_st + 1);
                    Home.count2.value = Home.count2.reversed.toList();
                    Home.dir.value = Home.line_end[0];
                  }
                }
              }
              if (Home.count.isNotEmpty) {
                Home.sub_st = Home.count.length + Home.count2.length;
                Home.sub_st = Home.sub_st;
                if (Home.sub_st * 2 >= 60) {
                  Home.time_s.value = ' 1 hour ${Home.sub_st * 2 - 60}';
                } else {
                  Home.time_s.value = 'time = ${Home.sub_st * 2} min';
                }
                if (Home.sub_st <= 9) {
                  Home.ticket.value = 8;
                } else if (Home.sub_st <= 17) {
                  Home.ticket.value = 10;
                } else {
                  Home.ticket.value = 15;
                }
              }
            },
            icon: Icon(Icons.search),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() {
            if (Home.count.isEmpty) {
              return Text(
                '${Home.time_s}',
                style: TextStyle(
                  color: Colors.red,
                ),
              );
            } else {
              return SizedBox();
            }
          }),
          Row(children: [
            SizedBox(
              width: 50,
            ),
            Column(children: [
              Obx(() {
                if (Home.count.isNotEmpty) {
                  return Text('count =${Home.sub_st}');
                } else {
                  return SizedBox();
                }
              }),
              Obx(() {
                if (Home.count.isNotEmpty) {
                  return Text('${Home.time_s}');
                } else {
                  return SizedBox();
                }
              }),
            ]),
            SizedBox(
              width: 50,
            ),
            Column(children: [
              Obx(() {
                if (Home.count.isNotEmpty) {
                  return Text('dir = ${Home.dir}');
                } else {
                  return SizedBox();
                }
              }),
              Obx(() {
                if (Home.count.isNotEmpty) {
                  return Text('ticket = ${Home.ticket} P.E');
                } else {
                  return SizedBox();
                }
              }),
            ]),
          ]),
          Expanded(
            child: Row(children: [
              Expanded(child: Obx(() {
                if (Home.count.isNotEmpty) {
                  return SizedBox(
                    width: 100,
                    child: ListView(
                      children: [
                        for (var value in Home.count) Text('$value \n')
                      ],
                    ),
                  );
                } else {
                  return SizedBox();
                }
              })),
              Expanded(child: Obx(() {
                if (Home.count.isNotEmpty) {
                  return SizedBox(
                    width: 100,
                    child: ListView(
                      children: [
                        for (var value in Home.count2)
                          Text(
                            '$value \n',
                            style: TextStyle(color: Colors.white),
                          )
                      ],
                    ),
                  );
                } else {
                  return SizedBox();
                }
              })),
            ]),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            IconButton(
              onPressed: () {
                Get.to(MapPage());
              },
              icon: Icon(Icons.map),
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
    print(pt);
    print(pg);
  }
}
