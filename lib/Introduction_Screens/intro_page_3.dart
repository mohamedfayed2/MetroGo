import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return     Container(
      color:Color(0xff121212) ,
      child: Column(
        children: [
          SizedBox(height: 140,),
        SizedBox(
          height: 200,
          width: 300,
          child: Image.asset("assets/images/Metro_public.webp"),),
          SizedBox(height: 60,),
          Center(
              child:Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "MetroGo 🚆\n",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    TextSpan(
                      text: "أصبح التنقل أسهل\nخطط رحلتك، استكشف المحطات، وانطلق بكل ثقة",
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
