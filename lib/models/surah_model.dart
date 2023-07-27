class SurahModel {
  final int id;
  final String arName;
  final String enName;
  final String location;
  final int numAyat;
  final List<dynamic> pages;

  SurahModel(
      {required this.id,
      required this.arName,
      required this.enName,
      required this.location,
      required this.numAyat,
      required this.pages, 
      });

  factory SurahModel.fromjson(jsonData) {
    return SurahModel(
      id: jsonData["id"],
      arName: jsonData['name_arabic'],
      enName: jsonData["name_simple"],
      numAyat: jsonData["verses_count"],
      location: jsonData["revelation_place"],
      pages: jsonData["pages"],
    );
  }
}
