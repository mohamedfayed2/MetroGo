import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import '../Customs/Custom_Bottom_Navigation_Bar.dart';
import '../controllers/NavigationController.dart';

class MapPage extends StatelessWidget {
  final NavigationController navController = Get.find<NavigationController>();
  final MapController mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("خريطة التنقل"),
        backgroundColor: Color(0xff007BFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          child: Image.asset("assets/images/new-map8.jpg"),
        ),
      ),
      bottomNavigationBar:
          SizedBox(height: 80, child: CustomBottomNavigationBar()),
    );
  }
}
