import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
      color:Color(0xff121212) ,
      child: Column(
        children: [
          SizedBox(height: 40,),
          Image.asset("assets/images/Metro_Train.png"),
          Center(
              child:Text.rich(
                TextSpan(
                  text: "لا مزيد من الحيرة \n ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                  children: [
                    TextSpan(
                      text: "MetroGo 🗺️\n",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    TextSpan(
                      text: "دليلك الذكي لمترو أسرع وأسهل",
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
