import 'package:flutter/material.dart';

class PhotoMap extends StatelessWidget {
  const PhotoMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('photo map'),
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          child: Image.asset("assets/images/new-map8.jpg"),
        ),
      ),
    );
  }
}
