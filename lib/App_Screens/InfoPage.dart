import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../Customs/Custom_Bottom_Navigation_Bar.dart';
import '../controllers/NavigationController.dart';

class InfoPage extends StatelessWidget {
  final NavigationController navController = Get.find<NavigationController>();

  final String fbMohamed =
      "https://www.facebook.com/share/1BSj1TuTJM/?mibextid=qi2Omg";
  final String linkedinMohamed =
      "https://www.linkedin.com/in/mohamed-adel-6aa572322?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app";
  final String whatsappMohamed = "https://wa.me/201552739400";

  final String fbKarim =
      "https://www.facebook.com/profile.php?id=100070585457622";
  final String linkedinKarim =
      "https://www.linkedin.com/in/kireem-ahmad-48b29933b?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3Bz0SpP%2BMQQl6tLZ0ayu4bgg%3D%3D";
  final String whatsappKarim = "https://wa.me/201013836545";

  void _launchURL(String url) async {
    var urlparse = Uri.parse(url);
    await launchUrl(urlparse);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff070707),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "معلومات التطبيق | App Info",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
        backgroundColor: const Color(0xff007BFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.directions_subway_filled,
                size: 80, color: Colors.white),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 18, color: Colors.white, height: 1.5),
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
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Mohamed Adel',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 42,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                              'assets/images/mo.jpeg',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildDeveloperRow(
                          name: "",
                          fbUrl: fbMohamed,
                          linkedinUrl: linkedinMohamed,
                          whatsappUrl: whatsappMohamed,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(children: [
                      Text(
                        'Kareem Ahmed',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 42,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            'assets/images/ka.jpg',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _buildDeveloperRow(
                        name: "",
                        fbUrl: fbKarim,
                        linkedinUrl: linkedinKarim,
                        whatsappUrl: whatsappKarim,
                      ),
                    ]),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/flutter.jpg',
                      height: 40,
                      width: 40,
                    ),
                    Text(
                      'this app made by flutter',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              )
                  .animate(delay: Duration(seconds: 3))
                  .slide(
                      begin: Offset(2, 0),
                      end: Offset(0, 0),
                      duration: Duration(seconds: 2))
                  .shimmer(
                      color: Colors.blueAccent, duration: Duration(seconds: 2)),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          SizedBox(height: 80, child: CustomBottomNavigationBar()),
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
        Text(name,
            style: const TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
        const SizedBox(width: 10),
        IconButton(
            icon: const Icon(EvaIcons.facebook, color: Colors.blue),
            iconSize: 40,
            onPressed: () => _launchURL(fbUrl)),
        IconButton(
            icon: const Icon(
              EvaIcons.linkedin,
              color: Colors.blueAccent,
            ),
            iconSize: 40,
            onPressed: () => _launchURL(linkedinUrl)),
        IconButton(
            icon: const Icon(EvaIcons.phoneOutline, color: Colors.green),
            iconSize: 40,
            onPressed: () => _launchURL(whatsappUrl)),
      ],
    );
  }
}
