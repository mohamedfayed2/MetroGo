import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Customs/Custom_Bottom_Navigation_Bar.dart';
import '../NavigationController.dart';
class InfoPage extends StatelessWidget {
  final NavigationController navController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Info Page"),
        backgroundColor: Color(0xff007BFF),
      ),
      body: const Center(child: Text("Info Page Content")),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}