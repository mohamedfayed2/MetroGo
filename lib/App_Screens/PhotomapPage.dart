import 'package:flutter/material.dart';

class PhotoMap extends StatelessWidget {
  const PhotoMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          height: 100,
          width: 300,
          child: Image.asset("assets/images/new-map8.jpg"),
        ),
      ),

    );
  }
}
