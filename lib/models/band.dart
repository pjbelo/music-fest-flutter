import 'dart:convert';
import 'package:http/http.dart' as http;

class Band {
  final int id;
  final String name;
  final Map imagePath;
  final String description;
  final String artisticDirector;

  Band(
      {this.id,
      this.name,
      this.imagePath,
      this.description,
      this.artisticDirector});

  factory Band.fromJson(Map<String, dynamic> json) {
    return Band(
      id: json['id'],
      name: json['name'],
      imagePath: json['imagePath'],
      description: json['description'],
      artisticDirector: json['artistic_director'],
    );
  }

  static Future<List<Band>> fetchBands() async {
    final bandsListAPIUrl = 'https://music-fest.herokuapp.com/bands.json';
    final response = await http.get(bandsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((band) => new Band.fromJson(band)).toList();
    } else {
      // decide how you want to handle errors
      // throw Exception('Failed to read from API');
      // or
      print('Failed to read from API');
      return [];
    }
  }
}
