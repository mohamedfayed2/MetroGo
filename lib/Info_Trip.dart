import 'package:get/get.dart';
import 'package:metro_app/trip.dart';

class InfoTrip extends Trip {
  int? pass = 1;
  InfoTrip(
      {super.cont,
      super.cont2,
      super.dir,
      super.ticket,
      super.sum,
      super.time,
      this.pass});

  @override
  Future<InfoTrip> l_roud() async {
    return InfoTrip();
  }
}
