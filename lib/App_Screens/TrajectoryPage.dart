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
      // بص يسطا لما التذكره بتكون ب 10 جنيه بتكون لونها اصفر ولما بتكون ب 12 بتكون خضره
      // ولما بتكون ي 15 جنيه بتكون بينك
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("مسار الرحلة", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff007BFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
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
                        title: "عدد المحطات", value: home.sub_st.toString()),
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
                    child:
                        InfoCard(title: "الزمن", value: home.time_s.toString()),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
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
                  child: InfoCard(title: "الاتجاه", value: home.dir.toString()),
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
                      title: "سعر التذكرة", value: "${home.ticket} جنيه"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      // قيود واضحة
                      child: Obx(() => ListView.builder(
                        itemCount: home.count.length,
                        itemBuilder: (context, index) {
                          return StationTile(
                            stationName: home.count[index],   isFirst: index == 0,
                            isLast: index == home.count.length - 1,
                          );
                        },
                      )),
                    ),
                  ),

                  SizedBox(width: 10), // مسافة بين القائمتين
                  Expanded(
                    child: SizedBox(
                      child: Obx(() => ListView.builder(
                        itemCount: home.count2.length,
                        itemBuilder: (context, index) {
                          return StationTile(
                            stationName: home.count2[index],   isFirst: index == 0,
                            isLast: index == home.count2.length - 1,
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
    );
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
