import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Customs/Custom_Bottom_Navigation_Bar.dart';
import '../controllers/NavigationController.dart';
import '../controllers/controller_home.dart';

class TicketPage extends StatelessWidget {
  final NavigationController navController = Get.find<NavigationController>();
  final controllers Home = Get.put(controllers());
  var cont = TextEditingController();
  var cont2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ticket Page"),
        backgroundColor: Color(0xff007BFF),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            TextField(
              controller: cont,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: cont,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Home.l_roud(cont.text, cont2.text);
                },
                child: Text('calculate')),
          ],
        ),
      ),
      bottomNavigationBar:
          Container(height: 80, child: CustomBottomNavigationBar()),
    );
  }
}
