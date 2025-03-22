import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:dio/dio.dart' as dio;
import '../Customs/Custom_Bottom_Navigation_Bar.dart';
import '../controllers/NavigationController.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

import 'PhotomapPage.dart';



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
      ),
      body:Center(
        child: Container(
          width: double.infinity,
          child: Image.asset("assets/images/new-map8.jpg"),
        ),
      ),
      bottomNavigationBar: SizedBox(
          height: 80,
          child: CustomBottomNavigationBar()),
    );
  }
}
