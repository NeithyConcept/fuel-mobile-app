import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:vitemoncarburant/app/data/models/search/search.dart';
import 'package:vitemoncarburant/main.dart';

class SearchApiProvider {

  final http.Client httpClient;

  SearchApiProvider({required this.httpClient});

  Future<Search> searchByCity(String name) async {
    final url = Uri.parse(Environment.apiUrl + "search/" + name);

    final response = await http.get(url, headers: {
      "Accept": "application/json; charset=UTF-8"
    });

    try {
      if (response.statusCode != 200) throw HttpException('${response.statusCode}');
      return Search.fromJson(response.body);
    } on HttpException {
      throw Exception("Failed to load cities");
    }
  }

  Future<Search> searchByCoord(double latitude, double longitude, int distance) async {
    final url = Uri.parse(Environment.apiUrl + "search/${latitude.toString()}/${longitude.toString()}/${distance.toString()}");

    final response = await http.get(url, headers: {
      "Accept": "application/json; charset=UTF-8"
    });

    try {
      if (response.statusCode != 200) throw HttpException('${response.statusCode}');
      return Search.fromJson(response.body);
    } on HttpException {
      throw Exception("Failed to load cities");
    }
  }

}