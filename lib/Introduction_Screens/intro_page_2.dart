import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff121212),
      child: Column(
        children: [
          Image.asset(
            "assets/images/Metro_Train.png",
            height: Get.height * 0.6,
          ),
          Center(
            child: Container(
              height: Get.height * 0.2,
              child: Center(
                  child: Text.rich(
                TextSpan(
                  text: "لا مزيد من الحيرة \n ",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  children: [
                    TextSpan(
                      text: "MetroGo 🗺️\n",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    TextSpan(
                      text: "دليلك الذكي لمترو أسرع وأسهل",
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
