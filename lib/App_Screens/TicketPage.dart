import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro_app/App_Screens/TrajectoryPage.dart';
import '../Customs/Custom_Bottom_Navigation_Bar.dart';
import '../Models/Stations.dart';
import '../controllers/NavigationController.dart';
import '../Models/trip.dart';

class TicketPage extends StatelessWidget {
  final NavigationController navController = Get.find<NavigationController>();
  var cont = TextEditingController();
  var cont2 = TextEditingController();
  var numcont = TextEditingController();
  var num = <String>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  @override
  Widget build(BuildContext context) {
    line_All = line_1 + line_2 + line_3 + right_3 + left_3;
    Set<String> line_s = line_All.toSet();
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
              SizedBox(
                height: 30,
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownMenu<String>(
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    menuHeight: 150,
                    width: double.infinity,
                    helperText: 'Enter start station',
                    enableSearch: true,
                    enableFilter: true,
                    requestFocusOnTap: true,
                    controller: cont,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownMenu<String>(
                    dropdownMenuEntries: [
                      for (var value in line_s)
                        DropdownMenuEntry(value: value, label: value),
                    ],
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                    label: Text(
                      'To',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    menuHeight: 150,
                    width: double.infinity,
                    helperText: 'Enter end station',
                    enableSearch: true,
                    enableFilter: true,
                    requestFocusOnTap: true,
                    controller: cont2,
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildDropdown("Passengers", num.toSet(), numcont),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  line_All = line_1 + line_2 + line_3 + right_3 + left_3;

                  //this block for avoid the exception
                  if (cont.text == '' || cont2.text == '') {
                    //Home.time_s.value = 'enter stations';
                    return;
                  } else if (!line_All.contains(cont.text)) {
                    //Home.time_s.value = 'start station is wrong';
                    return;
                  } else if (!line_All.contains(cont2.text)) {
                    //Home.time_s.value = 'end station is wrong';
                    return;
                  } else if (cont.text == cont2.text) {
                    //Home.time_s.value = 'it is a same station';
                    return;
                  }

                  numcont.text = numcont.text.isEmpty ? '1' : numcont.text;

                  var trip = await Trip(
                    cont: cont.text,
                    cont2: cont2.text,
                    pass: int.parse(numcont.text),
                  ).l_roud();
                  trip.count?.value = [];
                  trip.count2?.value = [];
                  Get.to(TrajectoryPage(), arguments: trip);
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
        menuMaxHeight: 150,
        onChanged: (newValue) {
          controller.text = newValue!;
        },
      ),
    );
  }
}
