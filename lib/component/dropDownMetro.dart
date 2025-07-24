import 'package:flutter/material.dart';

class Dropdownmetro extends StatelessWidget {
  const Dropdownmetro(
      {super.key,
      required this.dis,
      required this.controller,
      required this.data,
      required this.onselect});
  final String dis;
  final TextEditingController controller;
  final List<DropdownMenuEntry<String>> data;
  final void Function(String?)? onselect;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 5),
      child: Container(
        width: 167,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: DropdownMenu<String>(
          width: 170,
          textAlign: TextAlign.right,
          dropdownMenuEntries: data,
          textStyle: TextStyle(color: Colors.white),
          inputDecorationTheme: InputDecorationTheme(border: InputBorder.none),
          hintText: dis,
          controller: controller,
          onSelected: onselect,
        ),
      ),
    );
  }
}
