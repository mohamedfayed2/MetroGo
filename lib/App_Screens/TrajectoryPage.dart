import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/Stations.dart';
import '../controllers/controller_home.dart';

class TrajectoryPage extends StatelessWidget {
  TrajectoryPage({super.key});

  final Stations stations = Get.put(Stations());
  final controllers home = Get.put(controllers());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
        backgroundColor: Color(0xff007BFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(
              home.count.isEmpty ? '${home.time_s}' : '',
              style: TextStyle(color: Colors.red, fontSize: 18),
            )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Obx(() => home.count.isNotEmpty
                        ? Text('عدد المحطات: ${home.sub_st}')
                        : SizedBox()),
                    Obx(() => home.count.isNotEmpty
                        ? Text('الزمن: ${home.time_s}')
                        : SizedBox()),
                  ],
                ),
                Column(
                  children: [
                    Obx(() => home.count.isNotEmpty
                        ? Text('الاتجاه: ${home.dir}')
                        : SizedBox()),
                    Obx(() => home.count.isNotEmpty
                        ? Text('سعر التذكرة: ${home.ticket} جنيه')
                        : SizedBox()),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Obx(() => home.count.isNotEmpty
                        ? ListView(
                      children: home.count
                          .map((value) => Text('$value'))
                          .toList(),
                    )
                        : SizedBox()),
                  ),
                  Expanded(
                    child: Obx(() => home.count2.isNotEmpty
                        ? ListView(
                      children: home.count2
                          .map((value) => Text(
                        '$value',
                        style: TextStyle(color: Colors.white),
                      ))
                          .toList(),
                    )
                        : SizedBox()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
