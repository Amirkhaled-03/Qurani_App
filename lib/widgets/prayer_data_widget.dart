import 'package:flutter/material.dart';

class PrayerData extends StatelessWidget {
  const PrayerData(
      {super.key, required this.name, required this.icon, required this.time});
  final String name;
  final IconData icon;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 23,
            ),
          ),
          Text(
            time,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
