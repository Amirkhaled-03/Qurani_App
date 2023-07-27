class PrayerTimesModel {
  String fajr;
  String sunrise;
  String dhuhr;
  String asr;
  String maghrib;
  String isha;

  PrayerTimesModel(
      {required this.fajr,
      required this.sunrise,
      required this.dhuhr,
      required this.asr,
      required this.maghrib,
      required this.isha});

  factory PrayerTimesModel.fromjson(data) {
    return PrayerTimesModel(
        fajr: data["Fajr"],
        sunrise: data["Sunrise"],
        dhuhr: data["Dhuhr"],
        asr: data["Asr"],
        maghrib: data["Maghrib"],
        isha: data["Isha"]);
  }
}
