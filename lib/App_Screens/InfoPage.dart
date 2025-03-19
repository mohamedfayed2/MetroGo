import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Customs/Custom_Bottom_Navigation_Bar.dart';
import '../NavigationController.dart';

class InfoPage extends StatelessWidget {
  final NavigationController navController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "معلومات التطبيق | Info",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff007BFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.directions_subway_filled, size: 80, color: Colors.white),
            const SizedBox(height: 20),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "MetroGo هو تطبيق ذكي يساعدك على التنقل بسهولة داخل شبكة المترو، "
                      "حيث يمكنك حساب تكلفة الرحلات، العثور على أقرب محطة، "
                      "ومعرفة المسارات المتاحة لتوفير الوقت والتكلفة.",
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(fontSize: 18, color: Colors.white, height: 1.5),
                  speed: const Duration(milliseconds: 50),
                ),
              ],
              totalRepeatCount: 1,
            ),

            const SizedBox(height: 20),


            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "MetroGo is a smart app that helps you navigate the metro network easily. "
                      "You can calculate trip costs, find the nearest station, "
                      "and discover available routes to save time and money.",
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(fontSize: 18, color: Colors.white70, height: 1.5),
                  speed: const Duration(milliseconds: 50),
                ),
              ],
              totalRepeatCount: 1,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: CustomBottomNavigationBar(),
      ),
    );
  }
}
