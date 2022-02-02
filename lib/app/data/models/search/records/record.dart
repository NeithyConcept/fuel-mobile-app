import 'package:vitemoncarburant/app/data/models/search/records/search_records.dart';

class Record {
  String id;
  SearchRecords recordField;

  Record(this.id, this.recordField);

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(json["id"], SearchRecords.fromJson(json["fields"]));
  }
}