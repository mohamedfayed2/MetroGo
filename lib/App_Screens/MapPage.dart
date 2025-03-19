import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Customs/Custom_Bottom_Navigation_Bar.dart';
import '../controllers/NavigationController.dart';

class MapPage extends StatelessWidget {
  final NavigationController navController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        centerTitle:true ,
        title: const Text("Map Page"),
        backgroundColor: Color(0xff007BFF),
      ),
      body:  Center(child: Text("Map Page Content")),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}