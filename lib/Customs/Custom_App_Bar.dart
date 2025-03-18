import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("MetroGo"),
          Icon(LucideIcons.train, color: Color(0xff121212))
        ],
      ),
      backgroundColor: Color(0xff007BFF),

    );
  }
}
