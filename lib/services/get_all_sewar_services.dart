import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qurani/models/surah_model.dart';

class GetAllSewarServices {
  Future<List<SurahModel>> getAllsewar() async {
    try {
      http.Response response = await http
          .get(Uri.parse("https://api.quran.com/api/v4/chapters?language=ar"));
      Map<String, dynamic> data = jsonDecode(response.body);

      List<SurahModel> sewarList = [];
      for (int i = 0; i < 114; i++) {
        sewarList.add(SurahModel.fromjson(data["chapters"][i]));
      }

      return sewarList;
    } on Exception {
      throw Exception("there is an error");
    }
  }
}
