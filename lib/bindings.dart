import 'package:get/get.dart';
import 'NavigationController.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
  }
}