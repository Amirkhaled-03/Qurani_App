import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'package:qurani/models/prayer_times_model.dart';

PrayerTimesModel? times;

String? higri;
String? monthEn, monthAr;

class GetPrayerTimesSercices {
  var now = DateTime.now();
  var formatter = DateFormat('dd-MM-yyyy');
  late String formattedDate = formatter.format(now);

  Future<void> getprayerTimes() async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://api.aladhan.com/v1/timingsByCity/$formattedDate?city=cairo&country=egypt&method=5"));
      Map<String, dynamic> data = jsonDecode(response.body);
      var dataa = data["data"]["date"]["hijri"];
      higri = dataa["date"];
      monthEn = dataa["month"]["en"];
      monthAr = dataa["month"]["ar"];

      PrayerTimesModel time =
          PrayerTimesModel.fromjson(data["data"]["timings"]);

      times = time;
    } on Exception {
      throw Exception("there is an error");
    }
  }
}
