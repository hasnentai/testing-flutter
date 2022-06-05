import 'dart:convert';

import 'package:weather_app_ios/src/models/albums.dart';
import 'package:http/http.dart' as http;

class AlbumsRepo {
  Future<List<Albums>?> getAlbums() async {
    try {
      Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/albums");
      var data = await http.get(uri);

      if (data.statusCode == 200) {
        var json = jsonDecode(data.body) as List;
        List<Albums> albums = json.map((e) => Albums.fromJson(e)).toList();
        return albums;
      } else {
        throw Exception("Error while fetching data");
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
