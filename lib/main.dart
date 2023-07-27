import 'package:flutter/material.dart';
import 'package:qurani/screens/my_statefull_widget.dart';
import 'package:qurani/screens/surah_page.dart';

void main() {
  runApp(const Qurani());
}

class Qurani extends StatelessWidget {
 const Qurani({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SurahPage.id: (context) => const SurahPage(),
      },
      home:const MYstateFullWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
