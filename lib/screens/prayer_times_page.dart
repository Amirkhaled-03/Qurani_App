import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qurani/services/get_prayer_times_services.dart';
import 'package:qurani/widgets/prayer_data_widget.dart';

// ignore: must_be_immutable
class PrayerTimesScreen extends StatelessWidget {
  PrayerTimesScreen({super.key});
  Map<int, String> months = {
    1: "January",
    2: "February",
    3: "March",
    4: "April ",
    5: "May",
    6: "June",
    7: "July",
    8: "August",
    9: "September",
    10: "October",
    11: "November",
    12: "Decembe"
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // kPrimaryColor,
              Colors.green[300]!,
              Colors.green[400]!,
              Colors.green[500]!,
              Colors.green[700]!,
              Colors.green[600]!,
              Colors.green[900]!,
            ]),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 55, left: 16, right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "prayers times",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Cairo",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Icon(
                  FontAwesomeIcons.solidBell,
                  color: Colors.white,
                  size: 35,
                )
              ],
            ),
          ),
          const SizedBox(height: 70),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            width: 360,
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.arrow_back_ios_new),
                Text(
                  "${DateTime.now().day}"
                  "  "
                  "${months[DateTime.now().month]}"
                  " "
                  "${DateTime.now().year}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          Column(
            children: [
              FutureBuilder(
                  future: GetPrayerTimesSercices().getprayerTimes(),
                  builder: (context, snapshot) {
                    if (times != null) {
                      return Column(
                        children: [
                          PrayerData(
                            name: "الفجر",
                            time: times!.fajr,
                            icon: FontAwesomeIcons.cloudMoon,
                          ),
                          // Divider(
                          //   color: Colors.white,
                          // ),
                          PrayerData(
                            name: "الضحى",
                            time: times!.sunrise,
                            icon: FontAwesomeIcons.cloudSun,
                          ),
                          PrayerData(
                            name: "الظهر",
                            time: times!.dhuhr,
                            icon: FontAwesomeIcons.sun,
                          ),
                          PrayerData(
                            name: "العصر",
                            time: times!.asr,
                            icon: FontAwesomeIcons.cloudSunRain,
                          ),
                          PrayerData(
                            name: "المغرب",
                            time: times!.maghrib,
                            icon: FontAwesomeIcons.cloudSun,
                          ),
                          PrayerData(
                            name: "العشاء",
                            time: times!.isha,
                            icon: FontAwesomeIcons.moon,
                          ),
                        ],
                      );
                    } else {
                      return const Text("loading...");
                    }
                  })
            ],
          )
        ],
      ),
    );
  }
}
