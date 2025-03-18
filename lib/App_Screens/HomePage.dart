import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:metro_app/Customs/Custom_Bottom_Navigation_Bar.dart';

import '../NavigationController.dart';


class HomePage extends StatelessWidget {
  final NavigationController navController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
        backgroundColor:  Color(0xff007BFF),
      ),
      body: const Center(child: Text("Home Page Content")),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

