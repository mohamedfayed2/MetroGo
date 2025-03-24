import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff121212),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.08,
          ),
          Image.asset(
            "assets/images/Metro_public.webp",
            height: Get.height * 0.45,
          ),
          SizedBox(
            height: 60,
          ),
          Center(
            child: Container(
              height: Get.height * 0.2,
              child: Center(
                  child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "MetroGo 🚆\n",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    TextSpan(
                      text:
                          "أصبح التنقل أسهل\nخطط رحلتك، استكشف المحطات، وانطلق بكل ثقة",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
