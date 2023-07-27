import 'package:flutter/material.dart';
import 'package:qurani/constants.dart';
import 'package:qurani/services/get_prayer_times_services.dart';

// ignore: must_be_immutable
class Header extends StatelessWidget {
  Header({super.key, required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Qurani      ",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 10),
              Text(title),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "${DateTime.now().hour}:${DateTime.now().minute}",
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                higri.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                ),
              ),
              Text(
                "$monthEn - $monthAr",
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "Assets/photos/home1.png",
                width: 190,
                height: 200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
