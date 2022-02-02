import 'dart:convert';

import 'package:vitemoncarburant/app/data/models/search/parameters/parameters.dart';
import 'package:vitemoncarburant/app/data/models/search/records/record.dart';

class Search {
  Parameters parameters;
  List<Record> records;

  Search({required this.parameters, required this.records});

  factory Search.fromJson(String raw) {
    Map<String, dynamic> json = jsonDecode(raw) as Map<String, dynamic>;
    return Search(
        parameters: Parameters.fromJson(json["parameters"]),
        records: List<Record>.from((json["records"] as List<dynamic>).map((e) => Record.fromJson(e)))
    );
  }
}