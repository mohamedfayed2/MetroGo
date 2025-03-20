import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:dio/dio.dart' as dio;
import '../Customs/Custom_Bottom_Navigation_Bar.dart';
import '../controllers/NavigationController.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

class MapController extends GetxController {
  var startPoint = Rxn<LatLng>();
  var endPoint = Rxn<LatLng>();
  var routePoints = <LatLng>[].obs;
  final TextEditingController searchController = TextEditingController();

  Future<void> getRoute() async {
    if (startPoint.value == null || endPoint.value == null) return;
    String url = Uri.encodeFull(
        "https://router.project-osrm.org/route/v1/driving/"
            "\${startPoint.value!.longitude},\${startPoint.value!.latitude};"
            "\${endPoint.value!.longitude},\${endPoint.value!.latitude}?overview=full");
    try {
      dio.Response response = await dio.Dio().get(url);
      List coords = response.data['routes']?[0]['geometry']['coordinates'] ?? [];
      routePoints.value = coords.map((c) => LatLng(c[1], c[0])).toList();
    } catch (e) {
      print("Error fetching route: \$e");
    }
  }
}

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: mapController.searchController,
                decoration: InputDecoration(
                  hintText: "ابحث عن موقع...",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              suggestionsCallback: (pattern) async {
                if (pattern.isEmpty) return [];
                String url = Uri.encodeFull("https://nominatim.openstreetmap.org/search?format=json&q=\$pattern");
                try {
                  dio.Response response = await dio.Dio().get(url);
                  return (response.data as List?)?.map((place) => {
                    "display_name": place["display_name"],
                    "lat": double.parse(place["lat"]),
                    "lon": double.parse(place["lon"])
                  }).toList() ?? [];
                } catch (e) {
                  print("Error fetching suggestions: \$e");
                  return [];
                }
              },
              itemBuilder: (context, suggestion) {
                return ListTile(title: Text(suggestion["display_name"]));
              },
              onSuggestionSelected: (suggestion) {
                mapController.endPoint.value = LatLng(suggestion["lat"], suggestion["lon"]);
                mapController.getRoute();
              },
            ),
          ),
          Expanded(
            child: Obx(() => FlutterMap(
              options: MapOptions(
                center: LatLng(30.033, 31.233),
                zoom: 12.0,
                onTap: (_, latLng) {
                  if (mapController.startPoint.value == null) {
                    mapController.startPoint.value = latLng;
                  } else if (mapController.endPoint.value == null) {
                    mapController.endPoint.value = latLng;
                    mapController.getRoute();
                  }
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  tileProvider: CancellableNetworkTileProvider(),
                ),
                if (mapController.startPoint.value != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: mapController.startPoint.value!,
                        width: 40.0,
                        height: 40.0,
                        child: Icon(Icons.location_on, color: Colors.green, size: 40),
                      ),
                    ],
                  ),
                if (mapController.endPoint.value != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: mapController.endPoint.value!,
                        width: 40.0,
                        height: 40.0,
                        child: Icon(Icons.location_on, color: Colors.red, size: 40),
                      ),
                    ],
                  ),
                if (mapController.routePoints.isNotEmpty)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: mapController.routePoints,
                        strokeWidth: 5.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
              ],
            )),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
          height: 80,
          child: CustomBottomNavigationBar()),
    );
  }
}
