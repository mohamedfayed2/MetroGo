import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const InfoCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        Text(title, style: TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }
}

class StationTile extends StatelessWidget {
  final String stationName;
  final bool isFirst;
  final bool isLast;

  const StationTile(
      {required this.stationName, required this.isFirst, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            if (!isFirst)
              Container(
                  width: 2, height: 20, color: Colors.blue), // خط قبل المحطة
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: isFirst || isLast ? Colors.red : Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast)
              Container(
                  width: 2, height: 20, color: Colors.blue), // خط بعد المحطة
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              stationName,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
