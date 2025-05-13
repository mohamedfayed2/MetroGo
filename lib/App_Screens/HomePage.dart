import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:metro_app/App_Screens/TrajectoryPage.dart';
import 'package:metro_app/Customs/Custom_Bottom_Navigation_Bar.dart';
import 'package:metro_app/Models/nearst.dart';
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

final contn = TextEditingController();

Station sta_d = Station(name: '', late: 0.0, long: 0.0, link: '');
// location variable

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getst();
    file.write('splash', 'shittt');
  }

  Nerst? n;
  var name = ''.obs;
  void getst() async {
    n = await Nerst().getdata();
    cont.text = n!.st!.name;
    name.value = n!.st!.name;
    print(n?.dis);
  }

  @override
  Widget build(BuildContext context) {
    var nar = 'click'.obs;
    final RxBool swi = false.obs;
    line_All = line_1 + line_2 + line_3 + right_3 + left_3;
    Set<String> line_s = line_All.toSet();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
        backgroundColor: Color(0xff007BFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: Column(children: [
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
                              '${name.value}',
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            style: TextStyle(color: Colors.white),
            controller: contn,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 3),
                child: GestureDetector(
                  onTap: () async {
                    List<Location> locations =
                        await locationFromAddress('${contn.text}, Egypt');
                    print(locations);
                    dis = 100000000000000000000000.0;
                    for (int i = 0; i < statoin.length; i++) {
                      if (dis >
                          (Geolocator.distanceBetween(
                                  locations[0].latitude,
                                  locations[0].longitude,
                                  statoin[i].late,
                                  statoin[i].long)) /
                              1000) {
                        dis = Geolocator.distanceBetween(
                                locations[0].latitude,
                                locations[0].longitude,
                                statoin[i].late,
                                statoin[i].long) /
                            1000;
                        nar.value = statoin[i].name;
                      }
                      print(nar.value);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    width: 135,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Center(
                      child: Obx(() => FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                '${nar.value}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(99),
              ),
              label: Text(
                'the nearst station',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
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
      ]),
      bottomNavigationBar:
          SizedBox(height: 70, child: CustomBottomNavigationBar()),
    );
  }
}
