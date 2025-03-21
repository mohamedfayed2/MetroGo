import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Customs/Custom_Bottom_Navigation_Bar.dart';
import '../controllers/NavigationController.dart';
import '../controllers/controller_home.dart';
import 'HomePage.dart';

class TicketPage extends StatelessWidget {
  final NavigationController navController = Get.find<NavigationController>();
  final controllers Home = Get.put(controllers());
  var cont = TextEditingController();
  var cont2 = TextEditingController();
  var numcont = TextEditingController();
  var num = <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  @override
  Widget build(BuildContext context) {
    Home.line_All = stations.line_1 +
        stations.line_2 +
        stations.line_3 +
        stations.right_3 +
        stations.left_3;
    Set<String> line_s = Home.line_All.toSet();
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ticket Page",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              _buildDropdown("From", line_s, cont),
              SizedBox(height: 20),
              _buildDropdown("To", line_s, cont2),
              SizedBox(height: 20),
              _buildDropdown("Passengers", num.toSet(), numcont),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Home.dir.value = '';
                  Home.time_s.value = '';
                  Home.count.value = [];
                  Home.count2.value = [];
                  Home.ticket.value = 0;
                  Home.line_All = stations.line_1 +
                      stations.line_2 +
                      stations.line_3 +
                      stations.right_3 +
                      stations.left_3;

                  //this block for avoid the exception
                  if (cont.text == '' || cont2.text == '') {
                    Home.time_s.value = 'enter stations';
                    return;
                  } else if (!Home.line_All.contains(cont.text)) {
                    Home.time_s.value = 'start station is wrong';
                    return;
                  } else if (!Home.line_All.contains(cont2.text)) {
                    Home.time_s.value = 'end station is wrong';
                    return;
                  } else if (cont.text == cont2.text) {
                    Home.time_s.value = 'it is a same station';
                    return;
                  }

                  numcont.text = numcont.text.isEmpty ? '1' : numcont.text;

                  Home.l_roud(cont.text, cont2.text, int.parse(numcont.text));
                  Get.snackbar('Info', '${Home.ticket}',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.blueAccent,
                      colorText: Colors.white);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: Text('Search',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          SizedBox(height: 80, child: CustomBottomNavigationBar()),
    );
  }

  Widget _buildDropdown(
      String label, Set<String> items, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xff121212),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
        ),
        value: items.first,
        items: items.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value, style: TextStyle(color: Color(0xff121212))),
          );
        }).toList(),
        onChanged: (newValue) {
          controller.text = newValue!;
        },
      ),
    );
  }
}
