import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../Customs/Custom_Bottom_Navigation_Bar.dart';
import '../controllers/NavigationController.dart';

class InfoPage extends StatelessWidget {
  final NavigationController navController = Get.find<NavigationController>();

  final String fbMohamed = "https://www.facebook.com/share/1BSj1TuTJM/?mibextid=qi2Omg";
  final String linkedinMohamed = "https://www.linkedin.com/in/mohamed-adel-6aa572322?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app";
  final String whatsappMohamed = "https://wa.me/201552739400";

  final String fbKarim = "https://www.facebook.com/profile.php?id=100070585457622";
  final String linkedinKarim = "https://www.linkedin.com/in/kireem-ahmad-48b29933b/";
  final String whatsappKarim = "https://wa.me/201013836545";

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      debugPrint('تعذر فتح الرابط: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "معلومات التطبيق | App Info",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff007BFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.directions_subway_filled, size: 80, color: Colors.white),
            const SizedBox(height: 20),

            // أنيميشن الكتابة للنص الرئيسي
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: DefaultTextStyle(
                style: const TextStyle(fontSize: 18, color: Colors.white, height: 1.5),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "MetroGo هو تطبيق ذكي يساعدك على التنقل داخل شبكة المترو بسهولة.",
                      speed: const Duration(milliseconds: 100),
                    ),
                    TypewriterAnimatedText(
                      "يتيح لك حساب تكلفة الرحلات، العثور على أقرب محطة، ومعرفة أفضل المسارات لتوفير الوقت والتكلفة.",
                      speed: const Duration(milliseconds: 100),
                    ),
                    TypewriterAnimatedText(
                      "MetroGo is an intelligent app that helps you navigate the metro network effortlessly.",
                      speed: const Duration(milliseconds: 100),
                    ),
                    TypewriterAnimatedText(
                      "You can calculate trip costs, find the nearest station, and get the best routes to save time and money.",
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  isRepeatingAnimation: false,
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "المطورون | Developers",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 20),

            Column(
              children: [
                _buildDeveloperRow(
                  name: "Mohamed Adel",
                  fbUrl: fbMohamed,
                  linkedinUrl: linkedinMohamed,
                  whatsappUrl: whatsappMohamed,
                ),
                const SizedBox(height: 15),
                _buildDeveloperRow(
                  name: "Kareem Ahmed",
                  fbUrl: fbKarim,
                  linkedinUrl: linkedinKarim,
                  whatsappUrl: whatsappKarim,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(height: 80, child: CustomBottomNavigationBar()),
    );
  }

  Widget _buildDeveloperRow({
    required String name,
    required String fbUrl,
    required String linkedinUrl,
    required String whatsappUrl,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(name, style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500)),
        const SizedBox(width: 10),
        IconButton(icon: const Icon(EvaIcons.facebook, color: Colors.blue), onPressed: () => _launchURL(fbUrl)),
        IconButton(icon: const Icon(EvaIcons.linkedin, color: Colors.blueAccent), onPressed: () => _launchURL(linkedinUrl)),
        IconButton(icon: const Icon(EvaIcons.phoneOutline, color: Colors.green), onPressed: () => _launchURL(whatsappUrl)),
      ],
    );
  }
}
