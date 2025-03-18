import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color:Color(0xff121212),
      child: Column(
        children: [
          SizedBox(height: 40,),
          Image.asset("assets/images/Metro_Station.webp"),

          Center(
            child:
            Text.rich(
              TextSpan(
                text: "تنقّل بسهولة وسرعة مع \n ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                children: [
                  TextSpan(
                    text: "MetroGo 🚇\n",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextSpan(
                    text: "اكتشف المحطات، وابدأ رحلتك بدون تعقيد",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            )


          ),
        ],
      ),
    );
  }
}
