import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:metro_app/Models/sta_tg.dart';
import '../App_Screens/HomePage.dart';
import 'Stations.dart';

class Nerst {
  double? pt;
  double? pl;
  double? dis;
  Station? st;
  Nerst({this.pt, this.pl, this.dis, this.st});
  Future<Nerst> getdata() async {
    await _determinePosition();
    return Nerst(pt: pt, pl: pl, dis: dis, st: st);
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Get.snackbar('error', 'Location services are disabled.');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        Get.snackbar('error', 'Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Get.snackbar('error',
          'Location permissions are permanently denied, we cannot request permissions.');
      return;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    var p = await Geolocator.getCurrentPosition();
    pt = p.latitude;
    pl = p.longitude;
    nerst_st(pt!, pl!);
  }

  void nerst_st(double pt, double pg) {
    dis ??= 10000000000000000;
    for (int i = 0; i < statoin.length; i++) {
      if (dis! >
          (Geolocator.distanceBetween(
                  pt, pg, statoin[i].late, statoin[i].long) /
              1000)) {
        dis = Geolocator.distanceBetween(
                pt, pg, statoin[i].late, statoin[i].long) /
            1000;
        sta_d = statoin[i];
      }
    }
    cont.text = sta_d.name;
    st = sta_d;
  }
}
