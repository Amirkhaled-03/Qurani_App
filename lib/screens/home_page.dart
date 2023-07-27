import 'package:flutter/material.dart';
import 'package:qurani/constants.dart';
import 'package:qurani/models/surah_model.dart';
import 'package:qurani/services/get_all_sewar_services.dart';
import 'package:qurani/widgets/header_widget.dart';
import 'package:qurani/widgets/Sora_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * .544;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 8, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Header(
                title: "Baca Al-Quran",
            
              ),
            ),
            SizedBox(
              width: 270,
              height: 75,
              child: TextField(
                decoration: InputDecoration(
                  label: const Text(
                    "search for surah",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            Container(
              clipBehavior: Clip.none,
              height: height,
              child: FutureBuilder<List<SurahModel>>(
                future: GetAllSewarServices().getAllsewar(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<SurahModel> surahList = snapshot.data!;
                    return ListView.builder(
                        padding: const EdgeInsets.only(bottom: 25),
                        itemCount: surahList.length,
                        itemBuilder: (context, index) {
                          return Sora(
                            surah: surahList[index],
                          );
                        });
                  } else {
                    return const Center(child: Text("loading..."));
                  }

                  // return Text("loading");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
