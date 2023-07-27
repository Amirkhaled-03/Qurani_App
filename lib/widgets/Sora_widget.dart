import 'package:flutter/material.dart';
import 'package:qurani/constants.dart';
import 'package:qurani/models/surah_model.dart';
import 'package:qurani/screens/surah_page.dart';

// ignore: must_be_immutable
class Sora extends StatelessWidget {
  Sora({super.key, required this.surah});
  SurahModel surah;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .9;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 7,
            height: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: kPrimaryColor),
          ),
          Container(
            padding: const EdgeInsets.only(left: 3),
            width: width,
            height: 80,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 40,
                spreadRadius: 0,
                // offset: const Offset(10, 50),
                color: Colors.white.withOpacity(0.3),
              )
            ]),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SurahPage.id, arguments: surah);
              },
              child: Card(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
                  child: Row(
                    children: [
                      Stack(alignment: Alignment.center, children: [
                        Image.asset(
                          "Assets/photos/icon.png",
                          color: kPrimaryColor,
                        ),
                        Text("${surah.id}"),
                      ]),
                      const SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            surah.enName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Row(
                            children: [
                              Text(
                                surah.location,
                                style: const TextStyle(
                                  color: kSecondartColor,
                                ),
                              ),
                              Text(
                                "  ${surah.numAyat} AYAT",
                                style: const TextStyle(
                                  color: kSecondartColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        surah.arName,
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: "Noto Nastaliq Urdu",
                        ),
                      ),
                    ],
                  ),
                ),
                // color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
