import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../App_Screens/HomePage.dart';
import '../App_Screens/InfoPage.dart';
import '../App_Screens/MapPage.dart';
import '../App_Screens/TicketPage.dart';
import '../App_Screens/TrainPage.dart';
import '../controllers/NavigationController.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key});

  final NavigationController navController = Get.put(NavigationController());

  final List<Widget> pages = [
    HomePage(),
    MapPage(),
    TrainPage(),
    TicketPage(),
    InfoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Transform.translate(
          offset: const Offset(0, -35),
          child: Obx(() => Container(
            height: 60,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color:  Color(0xff007BFF).withOpacity(0.7),
                  offset: const Offset(0, 3),
                  blurRadius: 20,
                ),
              ],
              color: Color(0xff007BFF),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    navController.changePage(index);
                    Get.offAll(() => pages[index], transition: Transition.rightToLeftWithFade, duration: Duration(milliseconds: 500));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: navController.selectedIndex.value == index
                          ? Colors.white.withOpacity(0.3)
                          : Colors.transparent,
                    ),
                    child: Icon(
                      _icons[index],
                      size: 30,
                      color: navController.selectedIndex.value == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.6),
                    ),
                  ),
                );
              }),
            ),
          )),
        ),
      ),
    );
  }

  final List<IconData> _icons = [
    LucideIcons.home,
    LucideIcons.map,
    LucideIcons.train,
    LucideIcons.ticket,
    LucideIcons.info
  ];
}
