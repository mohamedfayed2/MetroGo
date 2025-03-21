import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:metro_app/App_Screens/HomePage.dart';
import 'package:metro_app/App_Screens/TicketPage.dart';
import 'package:metro_app/App_Screens/onboarding_screen.dart';
import 'package:metro_app/Introduction_Screens/intro_page_1.dart';
import 'App_Screens/MapPage.dart';
import 'controllers/NavigationController.dart';
import 'controllers/bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(NavigationController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreens(),
      // initialRoute: '/intro', // تحديد المسار الأولي
      // getPages: [
      //   GetPage(name: '/', page: () => HomePage()),
      //   GetPage(name: '/map', page: () => MapPage()),
      //   GetPage(name: '/intro', page: () => IntroPage1()),
      // ],
    );
  }
}
