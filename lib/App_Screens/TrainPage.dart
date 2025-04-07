import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Customs/Custom_Bottom_Navigation_Bar.dart';
import '../Models/Stations.dart';
import '../controllers/NavigationController.dart';


class TrainPage extends StatelessWidget {
  final NavigationController navController = Get.find<NavigationController>();
  final Stations stationsController = Get.find<Stations>();
  final RxString selectedLine = 'الخط الاول'.obs;

  // خريطة تربط الاسم العربي بالليست الحقيقية
  final Map<String, List<String>> getLineMap = {
    'الخط الاول': Get.find<Stations>().line_1,
    'الخط الثاني': Get.find<Stations>().line_2,
    'الخط الثالث': Get.find<Stations>().line_3,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        centerTitle: true,
        title: Text("مسارات المترو", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff007BFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              dropdownColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white12,
                labelText: 'اختر الخط',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              value: selectedLine.value,
              icon: Icon(Icons.arrow_drop_down, color: Colors.white),
              items: ['الخط الاول', 'الخط الثاني', 'الخط الثالث'].map((line) {
                return DropdownMenuItem<String>(
                  value: line,
                  child: Text(line, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (value) {
                selectedLine.value = value!;
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                List<String> stations = getLineMap[selectedLine.value] ?? [];
                return ListView.builder(
                  itemCount: stations.length,
                  itemBuilder: (context, index) {
                    return StationTile(
                      stationName: stations[index],
                      isFirst: index == 0,
                      isLast: index == stations.length - 1,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar:SizedBox(child: CustomBottomNavigationBar(),height: 70,),
    );
  }
}

class StationTile extends StatelessWidget {
  final String stationName;
  final bool isFirst;
  final bool isLast;

  const StationTile({
    required this.stationName,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            if (!isFirst) Container(width: 2, height: 20, color: Colors.blue),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: isFirst || isLast ? Colors.red : Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast) Container(width: 2, height: 20, color: Colors.blue),
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
