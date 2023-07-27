import 'dart:convert';

import 'package:http/http.dart' as http;

class AudioServices {
  String? audio;

  Future<String> getAya({required surahId, String ayah = "1"}) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://api.alquran.cloud/v1/ayah/$surahId:$ayah/ar.alafasy"));
      Map<String, dynamic> data = jsonDecode(response.body);
      return audio = data["data"]["audio"];
    } on Exception {
      throw Exception("there is an error");
    }
  }
}
