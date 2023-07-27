import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qurani/constants.dart';
import 'package:qurani/screens/home_page.dart';
import 'package:qurani/screens/ad3iaa_screen.dart';
import 'package:qurani/screens/prayer_times_page.dart';


class MYstateFullWidget extends StatefulWidget {
  const MYstateFullWidget({super.key});
  static String id = "HomePage";

  @override
  State<MYstateFullWidget> createState() => _MYstateFullWidgetState();
}

class _MYstateFullWidgetState extends State<MYstateFullWidget> {
  int selectedIndex = 0;
  List<Widget> screensOptions = [
    const HomePage(),
    const Ad3iaScreen(),
    PrayerTimesScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screensOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        unselectedFontSize: 15,
        selectedFontSize: 16,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bookOpen), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.handsPraying), label: "Doaa"),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.personPraying), label: "Times"),
        ],
        currentIndex: selectedIndex,
      ),
    );
  }
}
