import 'dart:js_interop';

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
        title: Text("Ticket Page"),
        backgroundColor: Color(0xff007BFF),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownMenu(
                  dropdownMenuEntries: [
                    for (var value in line_s)
                      DropdownMenuEntry(value: value, label: value),
                  ],
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                  label: Text(
                    'From',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  width: 350,
                  helperText: 'Enter start station',
                  enableSearch: true,
                  enableFilter: true,
                  requestFocusOnTap: true,
                  controller: cont,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownMenu(
                  dropdownMenuEntries: [
                    for (var value in line_s)
                      DropdownMenuEntry(value: value, label: value),
                  ],
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                  label: Text(
                    'To',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  width: 350,
                  helperText: 'Enter start station',
                  enableSearch: true,
                  enableFilter: true,
                  requestFocusOnTap: true,
                  controller: cont2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownMenu(
                  dropdownMenuEntries: [
                    for (var value in num)
                      DropdownMenuEntry(value: value, label: value),
                  ],
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                  label: Text(
                    'How many people in trip ?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  width: 350,
                  helperText: 'Enter start station',
                  enableSearch: true,
                  enableFilter: true,
                  requestFocusOnTap: true,
                  controller: numcont,
                ),
              ),
              SizedBox(
                height: 40,
              ),
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
                    Get.snackbar('info', '${Home.ticket}');
                  },
                  child: Text('calculate')),
              Text('${Home.time_s}'),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          Container(height: 80, child: CustomBottomNavigationBar()),
    );
  }
}
