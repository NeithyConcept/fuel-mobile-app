import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:vitemoncarburant/app/data/models/fuels/fuels.dart';
import 'package:vitemoncarburant/main.dart';

class FuelApiProvider {

  final http.Client httpClient;

  FuelApiProvider({required this.httpClient});

  Future<Fuels> getAll() async {
    final url = Uri.parse(Environment.apiUrl + "fuels");

    final response = await http.get(url);

    try {
      if (response.statusCode != 200) throw HttpException('${response.statusCode}');
      return Fuels.fromJson(response.body);
    } on HttpException {
      throw Exception("Failed to load fuels");
    }
  }
}