import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:metro_app/Models/nearst.dart';
import '../Models/trip.dart';
import '../App_Screens/HomePage.dart';

class TrajectoryPage extends StatelessWidget {
  TrajectoryPage({super.key});

  int co = 20;
  var cou = '';
  var loop = 0;
  RxString cou2 = ''.obs;
  bool isfinshed = true;
  @override
  Widget build(BuildContext context) {
    var trip = Get.arguments as Trip;
    co = (trip.count!.length + trip.count2!.length) * 2;
    return Scaffold(
      // بص يسطا لما التذكره بتكون ب 10 جنيه بتكون لونها اصفر ولما بتكون ب 12 بتكون خضره
      // ولما بتكون ي 15 جنيه بتكون بينك
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("مسار الرحلة", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff007BFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
        actions: [
          Obx(() => (cou2.value != '')
              ? Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 85,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Text(
                    '${cou2.value}',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                )
              : SizedBox()),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: Get.width * 0.4,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.black87, // لون خلفية مميز
                      borderRadius: BorderRadius.circular(12),
                      border: Border(
                          bottom: BorderSide(color: Colors.white),
                          left: BorderSide(color: Colors.white),
                          right: BorderSide(color: Colors.white),
                          top: BorderSide(color: Colors.white)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: InfoCard(
                        title: "عدد المحطات", value: trip.sum!.toString()),
                  ),
                  Container(
                    width: Get.width * 0.4,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.black87, // لون آخر مميز
                      borderRadius: BorderRadius.circular(12),
                      border: Border(
                          bottom: BorderSide(color: Colors.white),
                          left: BorderSide(color: Colors.white),
                          right: BorderSide(color: Colors.white),
                          top: BorderSide(color: Colors.white)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: InfoCard(title: "الزمن", value: trip.time!),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: Get.width * 0.4,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.black87, // لون مختلف للتمييز
                      borderRadius: BorderRadius.circular(12),
                      border: Border(
                          bottom: BorderSide(color: Colors.white),
                          left: BorderSide(color: Colors.white),
                          right: BorderSide(color: Colors.white),
                          top: BorderSide(color: Colors.white)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: InfoCard(title: "الاتجاه", value: trip.dir!),
                  ),
                  Container(
                    width: Get.width * 0.4,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(12),
                      border: Border(
                          bottom: BorderSide(color: Colors.white),
                          left: BorderSide(color: Colors.white),
                          right: BorderSide(color: Colors.white),
                          top: BorderSide(color: Colors.white)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: InfoCard(
                        title: "سعر التذكرة", value: "${trip.ticket} جنيه"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Container(
                width: Get.width * 0.8,
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.black87, // لون مختلف للتمييز
                  borderRadius: BorderRadius.circular(12),
                  border: Border(
                      bottom: BorderSide(color: Colors.white),
                      left: BorderSide(color: Colors.white),
                      right: BorderSide(color: Colors.white),
                      top: BorderSide(color: Colors.white)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: InfoCard(title: "محطه التبديل", value: trip.sta2!),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      // قيود واضحة
                      child: Obx(() => ListView.builder(
                            itemCount: trip.count?.length,
                            itemBuilder: (context, index) {
                              return StationTile(
                                stationName: trip.count![index],
                                isFirst: index == 0,
                                isLast: index == trip.count!.length - 1,
                              );
                            },
                          )),
                    ),
                  ),

                  SizedBox(width: 10), // مسافة بين القائمتين
                  Expanded(
                    child: SizedBox(
                      child: Obx(() => ListView.builder(
                            itemCount: trip.count2?.length,
                            itemBuilder: (context, index) {
                              return StationTile(
                                stationName: trip.count2![index],
                                isFirst: index == 0,
                                isLast: index == trip.count2!.length - 1,
                              );
                            },
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: (trip.count!.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 13),
              child: ElevatedButton(
                onPressed: () async {
                  getnum();
                  var index = 0;
                  n;
                  if (trip.count!.isNotEmpty || trip.cont2!.isNotEmpty) {
                    if (trip.count!.isNotEmpty) {
                      n = await Nerst().getdata();
                      if (trip.count!.contains(n!.st!.name)) {
                        while (trip.count!.isNotEmpty) {
                          await Future.delayed(Duration(minutes: 1));
                          n = await Nerst().getdata();
                          index = trip.count!.indexOf(n!.st!.name);
                          if (index == -1) {
                            Get.snackbar('info', 'بتستعبطني طب والله ما مكمل');
                            cou2.value = '';
                            break;
                          } else if (index > 0) {
                            trip.count?.removeAt(index);
                            index--;
                          } else {
                            if (trip.count!.length == 1 &&
                                trip.count2!.isNotEmpty) {
                              Get.snackbar(
                                'info',
                                'you must go to ${trip.sta2} station in next station',
                                colorText: Colors.white,
                                backgroundColor: Colors.blueAccent,
                                duration: Duration(seconds: 6),
                              );
                              trip.count?.removeAt(0);
                            } else if (trip.count!.length == 1 &&
                                trip.count2!.isEmpty) {
                              Get.snackbar(
                                'info',
                                'you finished trip',
                                colorText: Colors.white,
                                backgroundColor: Colors.blueAccent,
                                duration: Duration(seconds: 6),
                              );
                              trip.count?.removeAt(0);
                            }
                          }
                          name.value = n!.st!.name;
                        }
                      } else {
                        Get.snackbar('info', 'بتستعبطني ؟');
                      }
                    }
                    if (trip.count2!.isNotEmpty) {
                      n = await Nerst().getdata();
                      if (trip.count2!.contains(n!.st!.name)) {
                        while (trip.count2!.isNotEmpty) {
                          await Future.delayed(Duration(minutes: 1));
                          n = await Nerst().getdata();
                          index = trip.count2!.indexOf(n!.st!.name);
                          if (index == -1) {
                            Get.snackbar('info', 'بتستعبطني طب والله ما مكمل');
                            cou2.value = '';
                            break;
                          } else if (index > 0) {
                            trip.count?.removeAt(index);
                            index--;
                          } else {
                            if (trip.count2!.length == 1) {
                              Get.snackbar(
                                'info',
                                'you finished trip',
                                colorText: Colors.white,
                                backgroundColor: Colors.blueAccent,
                                duration: Duration(seconds: 6),
                              );
                              trip.count?.removeAt(index);
                            }
                          }
                        }
                      } else {
                        Get.snackbar('info', 'خلصت الرحله ي باشا يلا قوم امشي');
                      }
                    }
                  }
                },
                child: Text('strart trip'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
                  .animate()
                  .visibility(
                      delay: Duration(seconds: 1),
                      duration: Duration(microseconds: 200000))
                  .then()
                  .scale(),
            )
          : null,
    );
  }

  void getnum() async {
    if (cou2.value != '') {
      return;
    }
    for (int i = 0; i < co * 60;) {
      await Future.delayed(Duration(seconds: 1));
      if (loop == co || isfinshed) {
        break;
      }
      i = i + 1;
      if (i > 9 && i != 59) {
        cou = '00:${i}';
      } else if (i < 9 && i != 59) {
        cou = '00:0${i}';
      } else if (i == 59) {
        i = 0;
        loop += 1;
        cou = '0${loop}:${i}';
      }
      if (loop != 0) {
        if (loop < 9 && i < 9) {
          cou = '0${loop}:0${i}';
        } else if (loop < 9 && i > 9 && i != 59) {
          cou = '0${loop}:${i}';
        } else if (loop < 9 && i == 59) {
          i = 0;
          loop += 1;
          cou = '0${loop}:${i}';
        } else {
          if (loop > 9 && i > 9) {
            cou = '${loop}:${i}';
          } else if (loop > 9 && i < 9) {
            cou = '${loop}:0${i}';
          } else if (loop > 9 && i == 59) {
            i = 0;
            loop += 1;
            cou = '${loop}:${i}';
          }
        }
      }
      print(co);
      cou2.value = cou;
    }
    loop = 0;
    cou2.value = '';
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const InfoCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        Text(title, style: TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }
}

class StationTile extends StatelessWidget {
  final String stationName;
  final bool isFirst;
  final bool isLast;

  const StationTile(
      {required this.stationName, required this.isFirst, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            if (!isFirst)
              Container(
                  width: 2, height: 20, color: Colors.blue), // خط قبل المحطة
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: isFirst || isLast ? Colors.red : Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast)
              Container(
                  width: 2, height: 20, color: Colors.blue), // خط بعد المحطة
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              stationName,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
